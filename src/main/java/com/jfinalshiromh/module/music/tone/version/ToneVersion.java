package com.jfinalshiromh.module.music.tone.version;

import com.jfinal.plugin.activerecord.Db;
import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.utils.ext.plugin.tablebind.TableBind;


@TableBind(tableName = "jf_tb_tone_version")
public class ToneVersion extends BaseModel<ToneVersion> {
	
	private static final long serialVersionUID = 1L;
	public static ToneVersion me = new ToneVersion();
	public static String TABLE_NAME = "jf_tb_tone_version";

	public Long getNewTime(){
		return Db.queryLong("select create_time from "+TABLE_NAME+" order by id desc limit 1");
	}
	public void updateByType(String type){

		long now_time=System.currentTimeMillis()/1000;
		Db.update("update "+TABLE_NAME+" set create_time = ? where id=? ",now_time,type);
	}

}
