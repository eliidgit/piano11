package com.jfinalshiromh.module.school.piano.classroom;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.utils.StrUtil;

public class Classroom extends BaseModel<Classroom> {
	private static final long serialVersionUID = 1L;
	public static final Classroom me = new Classroom();
	public static final String TABLE_NAME = "jf_tb_classroom";
	
	public List<Classroom> getAll(Integer schoolId){
		return me.find("select id,building,name from " +TABLE_NAME+" where school_id=? order by id",schoolId);
	}
	
	public boolean checkIsExist(String building,String name,Integer schoolId){
		if(!StrUtil.checkParamIsNotNull(building,name,schoolId)){
			return false;
		}
		return Db.queryLong("select count(*) from "+ TABLE_NAME+" where school_id=? and building=? and name=?",schoolId,building,name)>0?true:false;
		
	}
	
	
	
	
}
