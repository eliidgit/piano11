package com.jfinalshiromh.module.greetings;

import com.jfinal.plugin.activerecord.Db;
import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.utils.ext.plugin.tablebind.TableBind;
@TableBind(tableName = "jf_tb_greetings_version")
public class GreetingsVersion extends BaseModel<GreetingsVersion> {
	  
	private static final long serialVersionUID = 1L;

	public static final GreetingsVersion me = new GreetingsVersion();

	  public static final  String TABLE_NAME = "jf_tb_greetings_version";




	public Long getNewByType(String type){
		return Db.queryLong("select create_time from "+TABLE_NAME+" where type=? order by id desc limit 1",type);
	}
	public void updateByType(String type){

        long now_time=System.currentTimeMillis()/1000;
        Db.update("update "+TABLE_NAME+" set create_time = ? where type=? ",now_time,type);
	}
}
