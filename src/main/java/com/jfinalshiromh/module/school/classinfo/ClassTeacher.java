package com.jfinalshiromh.module.school.classinfo;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.utils.ext.plugin.tablebind.TableBind;



@TableBind(tableName = "jf_tb_class_teacher")
public class ClassTeacher extends BaseModel<ClassTeacher> {
    public static ClassTeacher me = new ClassTeacher();
    private String TABLE_NAME = "jf_tb_class_teacher";

    
    public int deleteByCid(int cid){
        return  Db.update("delete from " + TABLE_NAME + " where cid = ? " ,cid);
    }

    
    public Integer countBycid(int cid){
        return Db.queryLong("select count(*) from " + TABLE_NAME + " where cid = ? ",cid).intValue();
    }
    
    public List<ClassTeacher> getClassGradeInfoByTid(Integer tid){
    	return me.find("select ct.id,c.id cid,c.name cname,g.id gid,g.name gname from jf_tb_class_teacher ct,jf_tb_class c,jf_tb_grade g where ct.cid=c.id and c.gid=g.id and ct.tid=? order by g.id,c.id",tid);
    }

    
    public Integer getCidByTid(int teacherId){
        Integer cid = Db.queryInt("select cid from " + TABLE_NAME + " where 1=1 and tid = ? ", teacherId);
        if (cid == null)
            return -1;
        else
            return cid;

    }
    
    
    public Integer delTeacherAndClass(Integer tid,Integer cid){
    	return Db.update("delete from "+ TABLE_NAME + " where cid=? and tid=?",cid,tid);
    }
    
    
    public ClassTeacher addTeacher(Integer tid,Integer cid){
    	ClassTeacher ct =new ClassTeacher().set("cid", cid).set("tid", tid);
    	ct.save();
    	return ct;
    	
    }
}
