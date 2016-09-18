package com.jfinalshiromh.module.course.coursepart;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.module.course.Course;
import com.jfinalshiromh.module.course.coursepart.po.PartNode;
import com.jfinalshiromh.module.course.coursepart.po.TreeViewNode;
import com.jfinalshiromh.module.homework.Homework;
import com.jfinalshiromh.module.music.Music;
import com.jfinalshiromh.module.video.Video;
import com.jfinalshiromh.utils.StrUtil;
import com.jfinalshiromh.utils.ext.plugin.tablebind.TableBind;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;


@TableBind(tableName = "jf_tb_course_part")
public class Coursepart extends BaseModel<Coursepart> {

    public static Coursepart me = new Coursepart();
    public static String TABLE_NAME = "jf_tb_course_part";

    public Page<Record> page(int pageNumber, int pageSize, String name, String courseName, int parentpartId, int courseId) {
        StringBuffer condition = new StringBuffer();
        if (!StrUtil.isBlank(name)) {
            condition.append(" and p.name like \"%" + name + "%\" ");
        }
        if (!StrUtil.isBlank(courseName)) {
            condition.append(" and c.name like \"%" + courseName + "%\" ");
        }
        if (parentpartId != -1) {
            condition.append(" and p.parent_id = " + parentpartId);
        }
        if (courseId != -1) {
            condition.append(" and c.id = " + courseId);
        }
        /*
        select p.id,p.name,p.part_index,p.unit_number,c.id cid,c.name cname,pp.name parentname
        from jf_tb_course_part p,jf_tb_course_part pp,jf_tb_course c
        where 1 = 1
        and p.course_id=c.id
        and c.name like '%小学%'
        and  p.name like '%%'
        and p.parent_id=pp.id
        order by p.id desc;
        */

        


        return Db.paginate(pageNumber, pageSize, "select p.id,p.name,p.part_index,p.unit_number,p.type," +
                        "c.id cid,c.name cname," +
                        "pp.name parentname",
                "from " + TABLE_NAME + " p,jf_tb_course_part pp,jf_tb_course c " +
                        "where 1 = 1 and p.course_id=c.id and p.parent_id=pp.id "
                        + condition + " order by p.id desc");
    }

    public Coursepart getByIndexAndCourseId(int partIndex, int courseId) {
        return super.findFirst("select id from " + TABLE_NAME + " where parent_id =0 and part_index = ? and course_id = ? ", partIndex, courseId);
    }


    
    public List<Integer> getUnuseIndex(int courseId) {
        if (courseId != -1) {
            int partNum = Course.me.getPartNumById(courseId);

            List<Integer> partsList = new ArrayList<Integer>();
            for (int i = 1; i <= partNum; i++) {
                
                Coursepart part = Coursepart.me.getByIndexAndCourseId(i, courseId);
                if (null == part) {
                    partsList.add(i);
                }
            }
            return partsList;
        } else {
            return null;
        }
    }

    
    public String getNameById(Integer id) {
        return Db.queryStr("select name from " + TABLE_NAME + " where id = ? ", id);
    }

    
    public List<Coursepart> getPartsByPid(int parentId) {
        return me.find("select id,name,type from " + TABLE_NAME + " where parent_id = ? order by part_index", parentId);
    }


    
    public List<Coursepart> getFirstPartByCid(int courseId) {
        return me.find("select id,name,parent_id from " + TABLE_NAME + " where parent_id = 0 and course_id = ? order by part_index asc ", courseId);
    }




    
    public String getPartType(int partId) {
        Coursepart part = super.findFirst("select type from " + TABLE_NAME + " where id = ?", partId);
        return part.getStr("type");
    }




    
    public TreeViewNode getNodeById(int partId, boolean isContainHref, String resourceType) {
        if (partId == -1) {
            return null;
        } else {
            TreeViewNode node = new TreeViewNode();

            
            Coursepart part = super.findById(partId);


            node.setText(part.getStr("name"));
            if (isContainHref) {
                node.setHref("/admin/coursepart/?parentpartId=" + partId);
            } else {

                

                String type = getPartType(partId);
                if (type.equalsIgnoreCase(Constants.PART_TYPE_RESOURCE_VIDEO)
                        && resourceType.equalsIgnoreCase(Constants.PART_TYPE_RESOURCE_VIDEO)) {
                    node.setHref(partId + "");
                    node.setTags(new String[]{"视频可选"});
                } else if (type.equalsIgnoreCase(Constants.PART_TYPE_RESOURCE_MUSIC)
                        && resourceType.equalsIgnoreCase(Constants.PART_TYPE_RESOURCE_MUSIC)) {
                    node.setHref(partId + "");
                    node.setTags(new String[]{"音乐可选"});
                } else if (type.equalsIgnoreCase(Constants.PART_TYPE_RESOURCE_HOMEWORK)
                        && resourceType.equalsIgnoreCase(Constants.PART_TYPE_RESOURCE_HOMEWORK)) {
                    node.setHref(partId + "");
                    node.setTags(new String[]{"作业可选"});
                } else {
                    node.setHref("-1");
                }
            }
            
            List<Coursepart> childList = me.getPartsByPid(partId);
            if (childList == null)
                return null;
            else {
                List<TreeViewNode> childNodeList = new ArrayList<TreeViewNode>();
                
                for (Coursepart child : childList) {
                    TreeViewNode childNode = getNodeById(child.getInt("id"), isContainHref, resourceType);
                    if (childNode == null)
                        return null;
                    else
                        childNodeList.add(childNode);
                }
                node.setNodes(childNodeList);
            }
            return node;
        }

    }


    public PartNode getPartNodeById(int partId) {
        if (partId == -1) {
            return null;
        } else {
            PartNode node = new PartNode();
            
            Coursepart part = super.findById(partId);
            node.setPart(part);
            
            List<Coursepart> childList = me.getPartsByPid(partId);
            if (childList == null)
                return null;
            else {
                List<PartNode> childNodeList = new ArrayList<PartNode>();
                
                for (Coursepart child : childList) {
                    
                    PartNode childNode = getPartNodeById(child.getInt("id"));
                    if (childNode == null)
                        return null;
                    else {
                        childNodeList.add(childNode);
                    }
                }
                node.setNodes(childNodeList);
            }
            return node;
        }
    }


    
    public List<String> itaratePart(int partId, List<String> reList) {

        List<Coursepart> partList = Coursepart.me.getPartsByPid(partId);

        for (Coursepart part : partList) {
            String type = part.getStr("type");
            if (StrUtil.isBlank(type)) {
                return null;
            } else {
                if (type.equalsIgnoreCase(Constants.PART_TYPE_CHILD)) {
                    
                    itaratePart(part.getInt("id"), reList);

                } else if (type.equalsIgnoreCase(Constants.PART_TYPE_RESOURCE_VIDEO)) {
                    
                    List<String> vList = Video.me.findPathByPartId(part.getInt("id"));
                    if (vList != null)
                        reList.addAll(vList);
                } else if (type.equalsIgnoreCase(Constants.PART_TYPE_RESOURCE_MUSIC)) {
                    
                    List<String> mList = Music.me.findpathsByPartId(part.getInt("id"));
                    if (mList != null)
                        reList.addAll(mList);
                } else if (type.equalsIgnoreCase(Constants.PART_TYPE_RESOURCE_HOMEWORK)) {
                    
                    List<String> hList = Homework.me.findpathsByPartId(part.getInt("id"));
                    if (hList != null)
                        reList.addAll(hList);
                } else {
                    return null;
                }
            }
        }
        return reList;
    }

    public Coursepart getPrevByIdAndGrade(Integer id,Integer courseId){
        return me.findFirst("select * from jf_tb_course_part where course_id=? and parent_id=0 and id<? order by part_index desc limit 1", courseId,id);
    }
    public Coursepart getNextByIdAndGrade(Integer id,Integer courseId){
        return me.findFirst("select * from jf_tb_course_part where course_id=? and parent_id=0 and id>? order by part_index limit 1", courseId,id);
    }
    
    public List<Coursepart> getChildsById(Integer id){
        return me.find("select * from jf_tb_course_part where parent_id=? order by part_index",id);
    }

    
    public Integer getTaskIdByLessonId(Integer id){
        return  Db.queryFirst("select id from jf_tb_course_part where parent_id=? and type=107",id);
    }
    
    public List<Coursepart> getLessonByGid(Integer gid){
        return find("select c.id,c.name from jf_tb_grade g,jf_tb_course_part c where g.course_id=c.course_id and g.id=? and c.parent_id=0 order by c.part_index",gid);
    }

    public Integer getParentIdbyId(Integer id){
        return Db.queryInt("select parent_id from "+TABLE_NAME+" where id=?",id);
    }

    
    public List<Coursepart> getChildsColumnById(Integer id){
        return me.find("select id,name,type from jf_tb_course_part where parent_id=? order by part_index",id);
    }

    public Coursepart getById(Integer id){
        return findFirst("select id,name,type ,parent_id,part_index from jf_tb_course_part where id=?",id);
    }


    public  int deleteParentId(Integer object){
        return Db.update("delete from "+ TABLE_NAME+" where parent_id=? ",object);
    }
    public  int deleteId(Integer Id){
        return Db.update("delete from "+ TABLE_NAME+" where id=? ",Id);
    }

    /*    public Integer getParentId (Integer id){
            return Db.queryInt("select id from "+TABLE_NAME+" where parent_id=?",id);
        }*/
    public  List<Coursepart> getChildCourse(Integer id){
        return me.find("select id from "+TABLE_NAME+" where parent_id=?",id);
    }
    public String getCourseIdById(String  id){
        return Db.queryStr("select course_id from " + TABLE_NAME + " where id = ? ", id);
    }
    public List<Coursepart> getFirstPartByStrCid(String courseId) {
        return me.find("select id,name from " + TABLE_NAME + " where parent_id = 0 and course_id = ? order by part_index asc ", courseId);
    }
    public List<Coursepart> getPartsByStrCPid(String c,String parentId) {
        return me.find("select id,name,type from " + TABLE_NAME + " where course_id = ? and parent_id = ? order by part_index",c, parentId);
    }

    public List<Integer> getChildId(int Id, List<Integer> courseList) {
        List<Coursepart> chileCourse = Coursepart.me.getChildCourse(Id);
        for (Coursepart part : chileCourse) {
            int childid = part.getInt("id");
            courseList.add(childid);
            getChildId(part.getInt("id"), courseList);
        }
        return courseList;
    }

    
    public Integer getLessonIdByLessonNameAndCourseId(String name,Integer courseId){
        return Db.queryInt("select id from "+TABLE_NAME+" where course_id=? and name=?",courseId,name);
    }

    
    public List<Coursepart> getAllLessonByCourseId(Integer courseId){
        return me.find("select id,name,part_index from "+TABLE_NAME+" where parent_id=0 and course_id=? order by part_index",courseId);
    }


    public boolean deleteParent(int id){
        List<Integer> child_List=new ArrayList<Integer>();
        List<Integer>  childlist=getChildId(id, child_List);
        Iterator<Integer> it=childlist.iterator();
        while ( it.hasNext()){
            for(int i=0;i<childlist.size();i++){
                Coursepart.me.deleteById(it.next());
                
            }}
        return true;
    }




}
