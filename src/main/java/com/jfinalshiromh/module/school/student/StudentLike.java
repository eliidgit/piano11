package com.jfinalshiromh.module.school.student;

import com.jfinal.plugin.activerecord.Db;
import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.utils.ext.plugin.tablebind.TableBind;



@TableBind(tableName = "jf_tb_like")
public class StudentLike extends BaseModel<StudentLike> {
    public static StudentLike me = new StudentLike();
    private static String TABLE_NAME = "jf_tb_like";

    
    public int getSumAttention(String phone) {
        String sql = "select count(*) from " + TABLE_NAME + " where 1=1 and phone_self = ? ";
        
        return Db.queryLong(sql, phone).intValue();
    }

    
    
    public int getSumFans(String phone) {
        String sql = "select count(*) from " + TABLE_NAME + " where 1=1 and phone_other = ? ";
        
        return Db.queryLong(sql, phone).intValue();
    }
}
