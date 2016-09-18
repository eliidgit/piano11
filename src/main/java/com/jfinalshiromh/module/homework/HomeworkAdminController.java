package com.jfinalshiromh.module.homework;

import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.module.course.Course;
import com.jfinalshiromh.module.course.coursepart.Coursepart;
import com.jfinalshiromh.module.course.coursepart.po.TreeViewNode;
import com.jfinalshiromh.module.music.Music;
import com.jfinalshiromh.module.music.tone.Tone;
import com.jfinalshiromh.utils.ext.route.ControllerBind;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.util.ArrayList;
import java.util.List;


@ControllerBind(controllerKey = "/admin/homework", viewPath = "/page/admin/homework")
public class HomeworkAdminController extends BaseController {
    private static Logger LOGGER = LoggerFactory.getLogger(HomeworkAdminController.class);

    public void index() {
        String name = getPara("name");
        setAttr("page", Homework.me.page(getParaToInt("p", 1), defaultPageSize(), name));
        setAttr("name", name);
        render("index.ftl");
    }

    public void add() {
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET)) {
            render("add.ftl");
        } else if (method.equalsIgnoreCase(Constants.POST)) {
            
            
            int coursepartid = getParaToInt("homework.course_part_id",-1);
            if (coursepartid != -1){
                Homework homework = Homework.me.findOneByPartId(coursepartid);
                if (homework != null){
                    
                    if (homework.getStr("amswer_type").equalsIgnoreCase("2")){
                        String path = "";
                        
                        if((path = homework.getStr("amswer_a")) != ""){
                            File aFile = new File(path);
                            if (aFile.exists()){
                                aFile.delete();
                            }
                        }
                        
                        if((path = homework.getStr("amswer_b")) != ""){
                            File aFile = new File(path);
                            if (aFile.exists()){
                                aFile.delete();
                            }
                        }
                        
                        if((path = homework.getStr("amswer_c")) != ""){
                            File aFile = new File(path);
                            if (aFile.exists()){
                                aFile.delete();
                            }
                        }

                        
                        if((path = homework.getStr("amswer_c")) != ""){
                            File aFile = new File(path);
                            if (aFile.exists()){
                                aFile.delete();
                            }
                        }
                    }

                    
                    Homework.me.deleteById(homework.getInt("id"));
                }
            }

            if (getModel(Homework.class, "homework").save())
                redirect("/admin/homework");
            else
                redirect("/admin");
        }
    }

    public void edit() {
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET)) {
            setAttr("homework", Homework.me.findById(getParaToInt(0, -1)));
            render("edit.ftl");
        } else {
            getModel(Homework.class, "homework").update();
            forwardAction("/admin/homework/index");
        }

    }

    @Before(Tx.class)
    public void delete() {
        int id = getParaToInt("Homework_id", -1);
        if (id != -1) {
            Homework homework = Homework.me.findById(id);
            String realPath = getRequest().getServletContext().getRealPath("/");
            String homeworkPath = realPath + homework.getStr("path");

            File homeworkFile = new File(homeworkPath);

            if (homeworkFile.exists()) {
                if (homeworkFile.delete()
                        && Homework.me.deleteById(id))
                    success("删除成功");
                else
                    error("删除失败");
            } else {
                error("图片文件不存在");
            }

            
            
        } else {
            error("作业ID不正确");
        }

    }

    public void info() {
        int id = getParaToInt(0, -1);
        if (id != -1) {
            Homework homework = Homework.me.findById(id);
            int course_part_id= Homework.me.getCoursePartIdById(id);
            String course_part_name=Coursepart.me.getNameById(course_part_id);
            setAttr("part_name",course_part_name);
            setAttr("homework", Homework.me.findById(getParaToInt(0, -1)));
            if (homework != null) {
                setAttr("homework_path", homework.getStr("path"));
                render("info.ftl");
            } else {
                LOGGER.error("根据ID查询的视频不存在" + id);
                renderError(500);
            }
        } else {
            LOGGER.error("前台ID未获取到" + id);
            renderError(500);
        }
    }

    
    public void treeViewData() {
        List<TreeViewNode> re = new ArrayList<TreeViewNode>();
        
        List<Course> courseList = Course.me.list();
        for (Course course : courseList
                ) {
            
            int courseId = course.getInt("id");
            TreeViewNode courseNode = new TreeViewNode();
            re.add(courseNode);
            courseNode.setText(course.getStr("name"));
            courseNode.setHref("-1");
            
            List<Coursepart> firstChannelList = Coursepart.me.getFirstPartByCid(courseId);

            List<TreeViewNode> partViewList = new ArrayList<TreeViewNode>();

            for (Coursepart part : firstChannelList
                    ) {
                int partId = part.getInt("id");
                TreeViewNode partNode = Coursepart.me.getNodeById(partId, false, Constants.PART_TYPE_RESOURCE_HOMEWORK);
                partViewList.add(partNode);
            }
            courseNode.setNodes(partViewList);
            
        }
        success(re);
    }
}
