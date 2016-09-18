package com.jfinalshiromh.module.course.coursepart;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.module.course.Course;
import com.jfinalshiromh.module.course.CourseType;

import com.jfinalshiromh.module.course.coursepart.po.TreeViewNode;
import com.jfinalshiromh.module.music.Music;
import com.jfinalshiromh.module.video.Video;

import com.jfinalshiromh.utils.ext.route.ControllerBind;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;

import java.util.List;

import static com.jfinalshiromh.module.course.coursepart.Coursepart.me;




@ControllerBind(controllerKey = "/admin/coursepart", viewPath = "/page/admin/coursepart")
public class CoursePartAdminController extends BaseController {

    private static Logger LOGGER = LoggerFactory.getLogger(CoursePartAdminController.class);

    public void index() {
        String name = getPara("name", "");
        String courseName = getPara("course_name", "");
        int parentPartlId = getParaToInt("parentpartId", -1);
        int courseId = getParaToInt("courseId", -1);
        Page<Record> page = me.page(getParaToInt("p", 1), defaultPageSize(), name, courseName, parentPartlId, courseId);

        setAttr("page", page);
        setAttr("name", name);
        setAttr("course_name", courseName);
        render("index.ftl");
    }

    public void add() {
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET)) {
            int parentId = getParaToInt(0, -1);
            if (parentId != -1) {

                String parentName = "";

                Coursepart parentPart = me.findById(parentId);
                Integer parentParentId = me.getParentIdbyId(parentId);
                setAttr("parentParentId", parentParentId);
                if (parentParentId == 0) {
                    List<CourseType> cts = CourseType.me.getAll();
                    setAttr("cts", cts);
                }
                if (parentId == 0) {
                    
                    
                    setAttr("courseList", Course.me.list());
                } else {
                    
                    parentName = parentPart.getStr("name");

                    int courseId = parentPart.getInt("course_id");
                    setAttr("course_id", courseId);


                    if (parentPart.getInt("parent_id") == 0) {
                        
                        String courseName = Course.me.getNameByid(parentPart.getInt("course_id"));
                        parentName = courseName + "-->" + parentName;
                    }

                    while (parentPart.getInt("parent_id") != 0) {
                        parentPart = me.findById(parentPart.getInt("parent_id"));
                        parentName = parentPart.getStr("name") + "-->" + parentName;

                        if (parentPart.getInt("parent_id") == 0) {
                            
                            String courseName = Course.me.getNameByid(parentPart.getInt("course_id"));
                            parentName = courseName + "-->" + parentName;
                        }

                    }
                }
                setAttr("parent_id", parentId);
                setAttr("parent_name", parentName);
                render("add.ftl");
            } else {
                renderError(500);
            }
        } else {
            if (getModel(Coursepart.class, "coursepart").save())
                redirect("/admin/coursepart");
            else
                renderError(500);
        }
    }

    public void edit() {
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET)) {
            int id = getParaToInt(0, -1);
            if (id != -1 && id > 0) {
                String parentName = "";
                Coursepart part = me.findById(id);
                int parentId = part.getInt("parent_id");
                List<Integer> partsIndexList = me.getUnuseIndex(part.getInt("course_id"));
                if (parentId == 0) {
                    
                    setAttr("courseList", Course.me.list());
                    String courseName = Course.me.getNameByid(part.getInt("course_id"));
                    parentName = courseName + "-->" + parentName;
                } else {
                    
                    Coursepart parentPart = part;
                    while (parentPart.getInt("parent_id") != 0) {
                        parentPart = me.findById(parentPart.getInt("parent_id"));
                        parentName = parentPart.getStr("name") + "-->" + parentName;
                        if (parentPart.getInt("parent_id") == 0) {  
                            String courseName = Course.me.getNameByid(parentPart.getInt("course_id"));
                            parentName = courseName + "-->" + parentName;
                        }
                    }
                }
                setAttr("partsIndexList", partsIndexList);
                setAttr("coursepart", part);
                setAttr("parent_id", parentId);
                setAttr("parent_name", parentName);
                render("edit.ftl");
            } else {
                renderError(500);
            }
        } else {
            if (getModel(Coursepart.class, "coursepart").update())
                redirect("/admin/coursepart");
            else
                renderError(500);
        }

    }

    public void info() {
        
        int id = getParaToInt(0, -1);
        if (id != -1) {
            Video video = (Video) Video.me.findByPartId(id);
            Music music = (Music) Music.me.findByPartId(id);
            setAttr("videoList", video);
            setAttr("musicList", music);
            render("info.ftl");
        } else {
            LOGGER.error("id获取错误");
            renderError(500);
        }

        


        


    }

    public void delete() {
        int id = getParaToInt("coursepart_id", -1);

        if (id != -1) {
            if (me.deleteById(id) && me.deleteParent(id)) {
                
                success("删除成功");
            }
        } else {
            error("id不正确");
        }
    }

    public void getParts() {
        
        int id = getParaToInt("course_id", -1);
        List<Integer> partsList = me.getUnuseIndex(id);
        if (null != partsList)
            success(partsList);
        else
            error("course_id错误");
    }

/*
    */

    /**
     * 获取treeview数据
     *

    public void treeViewData() {
        System.out.println("treeViewData==="+1);
        List<TreeViewNode> re = new ArrayList<TreeViewNode>();
        
        List<Course> courseList = Course.me.list();
        for (Course course : courseList) {
            
            int courseId = course.getInt("id");
            TreeViewNode courseNode = new TreeViewNode();
            re.add(courseNode);
            courseNode.setPid("0");
            courseNode.setText(course.getStr("name"));
            courseNode.setHref("/admin/coursepart/?courseId=" + courseId);
            
            List<Coursepart> firstChannelList = Coursepart.me.getFirstPartByCid(courseId);

            List<TreeViewNode> partViewList = new ArrayList<TreeViewNode>();
            for (Coursepart part : firstChannelList) {
                int  partId = part.getInt("id");
                TreeViewNode partNode = Coursepart.me.getNodeById(partId, true, "-1");
                partViewList.add(partNode);
            }
            courseNode.setNodes(partViewList);
            

        }
        success(re);
    }
*/
    public void treeData() {
        System.out.println("========treeData======treeData来了0--0-=0-=");
        TreeViewNode node;
        String jsonId = getPara("id", "-2147483648");
        int jonIdint = getParaToInt("id", -2147483648);
        String pid = getPara("pId", "-2147483648");
        int pidint = getParaToInt("pid", -2147483648);
        System.out.println(jsonId + "==jsonid,and,pid========" + pid);
        List<Coursepart> firstChannelList = null;
        List<Coursepart> courseList = null;

        List<Course> RootList=new ArrayList<Course>();

            RootList= Course.me.list();

        JSONArray array = new JSONArray();

        List<TreeViewNode> partViewListRoot = new ArrayList<TreeViewNode>();
        List<TreeViewNode> partViewList = new ArrayList<TreeViewNode>();

        if (pid.equals("-2147483648")&&jsonId.equals("-2147483648")) {
        for (Course root : RootList) {
            node = new TreeViewNode();
            int id = root.getInt("id");
            int ppid = 0 - id;
            String partId = Integer.toString(ppid);
            String Strid = Integer.toString(id);

            node.setId(partId);
            node.setPid("-2147483648");
            node.setText(root.getStr("name"));
            node.setHref(Constants.baseUrl + "/admin/coursepart/?courseId=" + Strid);
            node.setIsParent(Coursepart.me.getAllLessonByCourseId(root.getInt("id")) != null);

                partViewList.add(node);


                courseList = me.getFirstPartByStrCid(Strid);
                if (null != courseList) {
                    for (Coursepart course : courseList) {
                        node = new TreeViewNode();
                        String courseId = Integer.toString(course.getInt("id"));
                        node.setId(courseId);
                        node.setPid(partId);
                        node.setText(course.getStr("name"));
                        node.setHref(Constants.baseUrl + "/admin/coursepart?parentpartId=" + courseId);
                        node.setIsParent(Coursepart.me.getChildsById(course.getInt("id")) != null);
                        if (pidint > 0 || pid.equals("-2147483648")) {
                            partViewList.add(node);
                        }

                    }
                }
            }
        }


        if (jonIdint>0) {
            
            firstChannelList = me.getPartsByPid(jonIdint);  

            for (Coursepart part : firstChannelList) {
                node = new TreeViewNode();
                String ids=Integer.toString(part.getInt("id"));
                node.setId(ids);
                node.setPid(jsonId);
                node.setText(part.getStr("name"));
                node.setHref(Constants.baseUrl + "/admin/coursepart/?parentpartId=" + part.getInt("id"));
                node.setIsParent(Coursepart.me.findById(ids) != null);
                partViewList.add(node);
            }
        }



        for (int i = 0; i < partViewList.size(); i++) {
            JSONObject json = new JSONObject();
            json.put("id", partViewList.get(i).getId());
            json.put("pId", partViewList.get(i).getPid());
            json.put("href",partViewList.get(i).getHref());
            json.put("name", partViewList.get(i).getText());
            if (partViewList.get(i).getIsParent() != null) {
                json.put("isParent", partViewList.get(i).getIsParent());
            }
            array.add(json);
        }
        renderJson(array);
    /*    for (int j = 0; j < partViewListRoot.size(); j++) {
            JSONObject jsonRoot = new JSONObject();
            jsonRoot.put("id", partViewListRoot.get(j).getId());
            jsonRoot.put("pId", partViewListRoot.get(j).getPid());
     *
            jsonRoot.put("name", partViewListRoot.get(j).getText());
            if (partViewListRoot.get(j).getIsParent() != null) {
                jsonRoot.put("isParent", partViewListRoot.get(j).getIsParent());
            }
            array.add(jsonRoot);
        }
            for (int i = 0; i < partViewListCourse.size(); i++) {
                JSONObject jsonCourse=new JSONObject();
                jsonCourse.put("id", partViewListCourse.get(i).getId());
                jsonCourse.put("pId",partViewListCourse.get(i).getPid());
                                         *
                jsonCourse.put("name", partViewListCourse.get(i).getText());
                if (partViewListCourse.get(i).getIsParent() != null) {
                    jsonCourse.put("isParent", partViewListCourse.get(i).getIsParent());
                }
                array.add(jsonCourse);
            }*/



 /*       ObjectMapper  objectMapper = new ObjectMapper();
        String data = null;
        try {
            data = objectMapper.writeValueAsString(partViewList);
        } catch (IOException e) {
            e.printStackTrace();
        }
*/

    }
}
