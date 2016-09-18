package com.jfinalshiromh.module.school.piano.malfunction.detail;

import java.util.List;

import com.jfinalshiromh.common.BaseModel;

public class PianoMalfunctionDetail extends BaseModel<PianoMalfunctionDetail> {
	private static final long serialVersionUID = 1L;
	public static final PianoMalfunctionDetail me = new PianoMalfunctionDetail();
	public static String TABLE_NAME = "jf_tb_piano_malfunction_detail";
	
	public List<PianoMalfunctionDetail> getAllByMalId(Integer malId){
		return me.find("select content,create_time from "+TABLE_NAME+" where mal_id=? order by create_time",malId);
	}
	
	
	
}
