package com.jfinalshiromh.module.notification;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinalshiromh.common.BaseModel;

import java.util.List;



public class Notification extends BaseModel<Notification> {
    
	private static final long serialVersionUID = 1L;
	public static Notification me = new Notification();
    private static String TABLE_NAME = "jf_tb_notification";

    public List<Notification> getTopList(int num){
        String sql = "select id,message,create_time in_time from " + TABLE_NAME + " where 1=1 order by id desc limit 1,? ";
        return super.find(sql,num);
    }
    
    public Page<Notification> pageBySchool(int pageNumber, int pageSize, Integer schoolId){
    	return super.paginate(pageNumber, pageSize, "select id,type,message,author,is_read,create_time "," from "+TABLE_NAME+" where school_id in(0,"+schoolId+") order by is_read,id desc");
    }
    
    public List<Notification> getTop(int num,Integer schoolId){
    	return me.find("select id,type,message,author,is_read,create_time from "+TABLE_NAME+" where school_id in(0,"+schoolId+") order by is_read, id desc limit ?",num);
    }
    
    
    public Integer updateRead(Integer id){
    	return Db.update("update "+ TABLE_NAME+" set is_read='2' where id=?",id);
    }
    
    public Page<Notification> page(int pageNumber, int pageSize, Integer schoolId){
    	StringBuilder condition = new StringBuilder();
    	if(schoolId!=-1){
    		condition.append(" and school_id="+schoolId);
    	}
    	return super.paginate(pageNumber, pageSize, "select id,type,message,author,is_read,create_time "," from "+TABLE_NAME+" where  1=1 "+condition+" order by id desc");
    }
}
