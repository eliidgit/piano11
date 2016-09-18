package com.jfinalshiromh.module.school.classinfo;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.utils.StrUtil;
import com.jfinalshiromh.utils.ext.plugin.tablebind.TableBind;

import java.util.List;


@TableBind(tableName = "jf_tb_class")
public class ClassInfo extends BaseModel<ClassInfo> {
    public static ClassInfo me = new ClassInfo();

    private String TABLE_NAME = "jf_tb_class";
    
    
    public Page<ClassInfo> pageBySchool(int pageNumber, int pageSize, String name,int gradeId,int classId,Integer schoolId) {
        StringBuilder condition = new StringBuilder();
        if (gradeId != -1) {
            condition.append(" and c.gid = " + gradeId);
        }
        if (classId != -1) {
            condition.append(" and c.id = " + classId);
        }

        if (!StrUtil.isBlank(name)) {
            condition.append(" and c.name like \"%" + name + "%\"");
        }
        return super.paginate(pageNumber, pageSize, "select c.id cid,c.name cname,lesson_id,g.id gid,g.name gname, g.course_id,co.part_number ", " from " + TABLE_NAME + " c left join jf_tb_grade g on g.id=c.gid left join jf_tb_course co on co.id=g.course_id where g.school_id="+schoolId + condition + " order by g.id, c.id");

    }

    
    public Page<ClassInfo> page(int pageNumber, int pageSize, String name,int gradeId,int classId) {
        StringBuilder condition = new StringBuilder();
        if (gradeId != -1) {
            condition.append(" and gid = " + gradeId);
        }
        if (classId != -1) {
            condition.append(" and id = " + classId);
        }

        if (!StrUtil.isBlank(name)) {
            condition.append(" and name like \"%" + name + "%\"");
        }
        return super.paginate(pageNumber, pageSize, "select *", " from " + TABLE_NAME + " where 1=1 " + condition + " order by id desc");

    }

    
    public int getId(String name) {
        String sql = "select id from " + TABLE_NAME + " where 1=1 and name = ? ";
        return null != super.findFirst(sql, name) ? super.findFirst(sql, name).getInt("id") : -1;
    }


    public ClassInfo queryByConditions(int gid, String name) {
        return super.findFirst("select * from " + TABLE_NAME + " where 1=1 and gid = ? and name = ?", gid, name);
    }


    public List<ClassInfo> findByGid(int gid) {
        return super.find("select * from " + TABLE_NAME + " where 1=1 and gid = ? ", gid);
    }

    public void deleteById() {


    }

    
    public String getGradeNameById(int cid){
        String sql = "select g.name from jf_tb_grade g,jf_tb_class c where 1=1 and g.id = c.gid and c.id = ?";
        return Db.queryStr(sql, cid);
    }
    
    public Object [] getGradeAndClassNameById(int cid){
       String sql = "select g.name gname,c.name cname,g.course_id course_id from jf_tb_grade g,jf_tb_class c where 1=1 and g.id = c.gid and c.id = ?";
       return Db.queryFirst(sql,cid);
    }
    
    public ClassInfo getByStuId(Integer stuId){
    	return findFirst("select c.* from "+TABLE_NAME+" c,jf_tb_class_student cs where c.id=cs.cid and sid=?",stuId);
    }
    
    public int updateLesson(Integer classId,Integer lessonId){
    	return Db.update("update "+TABLE_NAME+" set lesson_id=? where id=?",lessonId,classId);
    }
    
    
    public int updateIPByClassId(Integer cid,String ip,Integer port){
    	return Db.update("update "+TABLE_NAME+" set ip=? , port=? where id=?",ip,port,cid);
    }
    
    
    public ClassInfo getIpAndPortByCid(Integer cid){
    	return me.findFirst("select ip,port from "+ TABLE_NAME+ " where id=?",cid);
    }
}
