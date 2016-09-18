package com.jfinalshiromh.module.school.grade;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.module.school.student.Student;
import com.jfinalshiromh.utils.StrUtil;

import java.util.List;



public class Grade extends BaseModel<Grade> {
    public static Grade me = new Grade();
    private static String TABLE_NAME = "jf_tb_grade";

    public Grade getGradeById(int id) {
        String sql = "select * from " + TABLE_NAME + " where  id = ? ";
        return super.findFirst(sql, id);
    }

    public int getIdByName(String name,Integer schoolId) {
        String sql = "select id from " + TABLE_NAME + " where school_id=? and name = ? ";
        Grade g = super.findFirst(sql, schoolId,name);
        return null != g ? g.getInt("id") : -1;
    }

    public int getLastInsertId() {
        return Db.queryNumber("select last_insert_id() from jf_tb_grade").intValue();
    }

    public List<Grade> list() {
        return super.find("select * from " + TABLE_NAME + " where 1=1 ");
    }

    public Page<Grade> page(int pageNumber, int pageSize, String name) {
        StringBuffer condition = new StringBuffer();
        if (!StrUtil.isBlank(name)) {
            condition.append(" and name like \"%" + name + "%\" ");
        }
        return super.paginate(pageNumber, pageSize, "select * ",
                "from " + TABLE_NAME + " where 1 = 1 " + condition + " order by id desc");
    }


    public Page<Record> pageRocord(int pageNumber, int pageSize, String name,Integer schoolId) {
        StringBuffer condition = new StringBuffer();
        if (!StrUtil.isBlank(name)) {
            condition.append(" and name like \"%" + name + "%\" ");
        }
        if(schoolId!=null && schoolId>0){
        	condition.append(" and school_id =" + schoolId );
        }
        return Db.paginate(pageNumber, pageSize, "select * ",
                "from " + TABLE_NAME + " where 1 = 1 " + condition + " order by id desc");
    }











    
    public int getCourseIdById(int gradeId){
       return Db.queryInt("select course_id from " + TABLE_NAME + " where id = ? ",gradeId);
    }
    
    public List<Grade> getAllBySchool(Integer schoolId){
    	return super.find("select * from " + TABLE_NAME + " where school_id=? order by id",schoolId);
    }

}


