package com.jfinalshiromh.module.school.student;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.DbKit;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.module.school.classinfo.ClassStudent;
import com.jfinalshiromh.module.school.teacher.Teacher;
import com.jfinalshiromh.utils.StrUtil;

import java.util.ArrayList;
import java.util.List;



public class Student extends BaseModel<Student> {
    public static final Student me = new Student();

    private String TABLE_NAME = "jf_tb_student";

    public Page<Student> page(int pageNumber, int pageSize) {
        return page(pageNumber, pageSize, null);
    }
    
    
    public Page<Student> pageBySchoolAndName(int pageNumber, int pageSize, String name,Integer schoolId) {
        StringBuffer condition = new StringBuffer();

        if (!StrUtil.isBlank(name)) {
            condition.append(" and s.name like \"%" + name + "%\" ");
        }
        return super.paginate(pageNumber, pageSize, "select c.name className,g.name gradeName, s.id,s.name,s.gender,s.student_number,s.phone,u.avatar ", "from jf_tb_student s left join jf_tb_class c on c.id=s.class_id left join jf_tb_grade g on g.id=c.gid left join jf_tb_user u on u.phone=s.phone where  s.school_id=? "+condition+" order by s.id desc",schoolId);
    }
    
    public Page<Student> pageBySchool(int pageNumber, int pageSize, Integer schoolId){
    	 return super.paginate(pageNumber, pageSize, "select c.name className,g.name gradeName, s.id,s.name,s.gender,s.student_number,s.phone,u.avatar ", "from jf_tb_student s left join jf_tb_class c on c.id=s.class_id left join jf_tb_grade g on g.id=c.gid left join jf_tb_user u on u.phone=s.phone where  s.school_id=? order by s.id desc",schoolId);
    }


    
    public Page<Student> page(int pageNumber, int pageSize, String name) {
        StringBuffer condition = new StringBuffer();

        
        


        if (!StrUtil.isBlank(name)) {
            condition.append(" and name like \"%" + name + "%\" ");
        }
        return super.paginate(pageNumber, pageSize, "select * ", "from " + TABLE_NAME + " where 1=1 " + condition + " order by id desc");
    }

    public List<Student> list() {
        return super.find("select * from jf_tb_student");
    }

    public Long getAllStutentNumByClass(int classId) {
        return Db.queryLong("select count(*) from jf_tb_student where class_id = ? ", classId);
    }

    public Student getStudentByPhone(String phone) {
        return super.findFirst("select * from jf_tb_student where 1=1 and phone = ? ", phone);
    }


    
    public Page<Student> pageByCid(int pageNumber, int pageSize, int classId) {
    	 return super.paginate(pageNumber, pageSize, "select c.name className,g.name gradeName, s.id,s.name,s.gender,s.student_number,s.phone,u.avatar",
                 "from jf_tb_student s join jf_tb_class c on c.id=s.class_id  join jf_tb_grade g on g.id=c.gid join jf_tb_user u on u.phone=s.phone where s.class_id=? order by s.id desc",classId);

    }

    
    public Page<Student> pageByNotCid(int pageNumber, int pageSize,Integer schoolId) {
    	return super.paginate(pageNumber, pageSize, "select  s.id,s.name,s.gender,s.student_number,s.phone,u.avatar ", 
    			"from jf_tb_student s  join jf_tb_user u on u.phone=s.phone where  s.school_id=? and s.class_id is null order by s.id desc",schoolId);
    }


    
    public Page<Student> pageByGid(int pageNumber, int pageSize, int gradeId) {
    	StringBuilder condition = new StringBuilder();
    	if(gradeId>0){
    		condition.append("where  g.id="+gradeId);
    	}
        return super.paginate(pageNumber, pageSize, "select c.name className,g.name gradeName, s.id,s.name,s.gender,s.student_number,s.phone,u.avatar",
                "from jf_tb_student s join jf_tb_class c on c.id=s.class_id  join jf_tb_grade g on g.id=c.gid join jf_tb_user u on u.phone=s.phone "+condition+" order by s.id desc");
    }

    
    public boolean updateStates(String[] sids, String state) {
        List<Record> listReord = new ArrayList<Record>();

        for (String sid : sids) {
            Record record = new Record();
            record.set("id", sid);
            record.set("state", state);
            listReord.add(record);
        }
        if (Db.batchUpdate(TABLE_NAME, listReord, listReord.size()).length > 0)
            return true;
        else
            return false;
    }
    
    
    public int updatePhoneByPhone(String newPhone,String phone){
       return  Db.update("update jf_tb_student set phone=? where phone=? ", newPhone,phone);
    }
    
    public String  queryAddressByPhone(String phone){
         return Db.queryStr("select address from jf_tb_student where phone = ? ", phone);
    }
    
    public int  updateAddressByPhone(String address,String phone){
        return Db.update("update jf_tb_student set address=? where phone=?", phone);
    }
    
    
    public Object [] getGradeAndClassByStuId(Integer stuId){
    	return Db.queryFirst("select c.id cid,c.name className,g.id gid,g.name gradeName from  jf_tb_student s,jf_tb_class c , jf_tb_grade g where s.class_id=c.id and c.gid=g.id and s.id=89", stuId);
    }
    
    public List<Student> getByClassId(Integer cid){
    	return find("select s.id,s.name,s.gender,s.address,s.phone,u.avatar,s.description,s.parent_name from jf_tb_student s,jf_tb_user u where u.phone=s.phone and s.class_id=?",cid);
    }
    
    public int updateStuClass(Integer stuId,Integer classId){
    	return Db.update("update jf_tb_student set class_id=? where id=?",classId,stuId);
    }
    
    public Student getStuInfoById(Integer stuId){
    	return me.findFirst("select c.name cname,g.name gname,c.id cid,g.id gid,  s.id,s.name,s.gender,s.student_number,s.phone,u.avatar,s.age,s.address,s.student_number,s.state,s.study_time,s.entrancetime,s.parent_type,s.parent_name from jf_tb_student s left join jf_tb_class c on c.id=s.class_id left join jf_tb_grade g on g.id=c.gid left join jf_tb_user u on u.phone=s.phone where s.id=?",stuId);
    }
    
    public String getPhoneById(Integer id){
    	return Db.queryStr("select phone from jf_tb_student where id=?",id);
    }
    
    public int updatePhoneAndParent(Integer id,String phone,String parentType,String parentName){
    	return Db.update("update jf_tb_student set phone=?,parent_type=?,parent_name=? where id=?",phone,parentType,parentName,id);
    }
    
    public Long getCount(){
    	return Db.queryLong("select count(*) from "+TABLE_NAME);
    }

}
