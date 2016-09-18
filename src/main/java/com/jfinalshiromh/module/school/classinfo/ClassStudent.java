package com.jfinalshiromh.module.school.classinfo;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.utils.ext.plugin.tablebind.TableBind;


@TableBind(tableName = "jf_tb_class_student")
public class ClassStudent extends BaseModel<ClassStudent> {
    public static ClassStudent me = new ClassStudent();
    private String TABLE_NAME = "jf_tb_class_student";

    
    public int deleteByCid(int cid){
        return Db.update("delete from " + TABLE_NAME + " where 1=1 and cid = ? " ,cid);
    }

    
    public Integer countBycid(int cid){
        return Db.queryLong("select count(*) from " + TABLE_NAME + " where 1=1 and cid = ? ",cid).intValue();
    }

    public Integer getCidBySid(int studentId){
        return Db.queryInt("select cid from " + TABLE_NAME + " where 1=1 and sid = ? ", studentId);
    }
}
