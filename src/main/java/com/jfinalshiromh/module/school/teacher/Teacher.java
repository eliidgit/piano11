package com.jfinalshiromh.module.school.teacher;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.utils.StrUtil;

import java.util.ArrayList;
import java.util.List;



public class Teacher extends BaseModel<Teacher> {

    public static final Teacher me = new Teacher();
    private String TABLE_NAME = "jf_tb_teacher";

    public Page<Teacher> page(int pageNumber, int pageSize) {
        return page(pageNumber, pageSize, null);
    }


    
    public Page<Teacher> page(int pageNumber, int pageSize, String name) {
        StringBuffer condition = new StringBuffer();
        if (!StrUtil.isBlank(name)) {
            condition.append(" and name like \"%" + name + "%\" ");
        }
        return super.paginate(pageNumber, pageSize, "select * ",
                "from jf_tb_teacher where 1 = 1 " + condition + " order by id desc");
    }
    
    public Page<Teacher> pageBySchool(int pageNumber, int pageSize, String name,Integer schoolId) {
        StringBuffer condition = new StringBuffer();
        if (!StrUtil.isBlank(name)) {
            condition.append(" and t.name like \"%" + name + "%\" ");
        }
        return super.paginate(pageNumber, pageSize, "select t.id,t.name,t.job,u.avatar,t.phone ",
                "from jf_tb_teacher t,jf_tb_user u where u.phone=t.phone and t.school_id="+schoolId+" " + condition + " order by id desc");
    }
    
    public Teacher getByTid(Integer tid){
    	return me.findFirst("select t.*,u.avatar from jf_tb_teacher t,jf_tb_user u where u.phone=t.phone and t.id=?",tid);
    }


    
    public Page<Teacher> pageByCid(int pageNumber, int pageSize, int classId) {
       return super.paginate(pageNumber,pageSize,"select t.id,t.name,u.avatar,t.job",
               "from jf_tb_teacher t, jf_tb_class_teacher ct ,jf_tb_user u where t.id = ct.tid and u.phone=t.phone and ct.cid = ?",classId);
    }
    
    
    public List<Teacher> getByCid(int classId) {
       return me.find("select t.id,t.name,u.avatar,t.job from jf_tb_teacher t, jf_tb_class_teacher ct ,jf_tb_user u where t.id = ct.tid and u.phone=t.phone and ct.cid = ?",classId);
    }

    
    public Page<Teacher> pageByNotCid(int pageNumber, int pageSize,Integer schoolId,Integer classId) {

        return super.paginate(pageNumber,pageSize,"select t.id,t.name,t.job,u.avatar,t.phone ",
                "from "+ TABLE_NAME +" t, jf_tb_user u where u.phone=t.phone and t.school_id =? and t.id not in (select tid from jf_tb_class_teacher where cid =?)",schoolId,classId);
    }

    public List<Teacher> list() {
        return super.find("select * from jf_tb_teacher");
    }

    public long getAllTeacherNumByClass(int classId) {
        return Db.queryLong("select count(*) from jf_tb_class_teacher where cid = ? ", classId);
    }

    
    public boolean isPhoneExist(String phone){
        String sql = "select count(*) from " + TABLE_NAME + " where phone = ? ";
        if (Db.queryLong(sql,phone).intValue() > 0)
            return true;
        else
            return false;
    }
    public Teacher getTeacherByPhone(String phone){
        return super.findFirst("select * from "+TABLE_NAME+" where 1=1 and phone = ? ", phone);
    }

    
    public boolean updateStates(String[] tids,String state){
        List<Record> listReord = new ArrayList<Record>();

        for (String tid : tids
                ) {
            Record record = new Record();
            record.set("id", tid);
            record.set("state", state);
            
            
            listReord.add(record);
        }
        if (Db.batchUpdate(TABLE_NAME,listReord,listReord.size()).length>0)
            return true;
        else
            return false;
    }
    
   public Long getCount(){
	   return Db.queryLong("select count(*) from "+TABLE_NAME); 
   }

}
