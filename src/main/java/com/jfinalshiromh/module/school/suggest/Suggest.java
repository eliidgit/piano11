package com.jfinalshiromh.module.school.suggest;

import java.util.List;

import com.jfinalshiromh.common.BaseModel;


public class Suggest extends BaseModel<Suggest> {
    
	private static final long serialVersionUID = 1L;

	public static final Suggest me = new Suggest();

    public static final String TABLE_NAME = "jf_tb_suggest";

    public Suggest(){
    	super();
    }
    public Suggest(String name,String phone,String email,String message){
    	this.set("name", name).set("phone", phone).set("email", email).set("message", message);
    }
    
    public List<Suggest> getAllBySchool(Integer schoolId){
    	return me.find("select id,create_time,message from "+TABLE_NAME+" where school_id=?",schoolId);
    }
   

}
