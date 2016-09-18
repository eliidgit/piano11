package com.jfinalshiromh.module.song;

import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.utils.ext.plugin.tablebind.TableBind;
@TableBind(tableName = "jf_tb_song_record")
public class SongRecord extends BaseModel<SongRecord> {

	private static final long serialVersionUID = 1L;
	public static final SongRecord me = new SongRecord();
	public static String TABLE_NAME = "jf_tb_song_record";
	
	public boolean save(Integer songId,String phoneNum,Integer coverNum,String yinGao,String jieZou,String shiZhi,String txtPath){
		return new SongRecord().set("song_id", songId).set("phone_num", phoneNum).set("cover_num", coverNum).set("yin_gao", yinGao)
				.set("jie_zou", jieZou).set("shi_zhi", shiZhi).set("txt_path", txtPath).save();
		
	}

}
