package com.jfinalshiromh.module.schedule;

import java.util.List;

import com.jfinalshiromh.common.BaseModel;

public class Schedule extends BaseModel<Schedule> {
    private static final long serialVersionUID = 1L;
    public static final Schedule me = new Schedule();
    public static String TABLE_NAME = "jf_tb_schedule";

    
    public List<Schedule> getByCidAndAP_M(String apm,Integer cid){
    	return me.find("select * from "+TABLE_NAME+" where class_id =? and am_pm=?",cid,apm);
    }
    
    public Schedule save(Integer cid,String time_start,String time_end,Integer week,String title,String intro,String apm){
    	Schedule lesson = new Schedule().set("class_id", cid).set("time_start", time_start).set("time_end", time_end)
    			.set("week", week).set("title", title).set("intro", intro).set("am_pm", apm);
    	if(lesson.save())
    		return lesson;
    	return null;
    }
    
    public List<Schedule> getAllByCid(Integer cid){
    	return me.find("select * from "+TABLE_NAME+" where class_id =?",cid);
    }


}
