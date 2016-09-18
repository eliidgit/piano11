package com.jfinalshiromh.module.song;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.utils.ext.plugin.tablebind.TableBind;


@TableBind(tableName = "jf_tb_song_tag")
public class SongTag extends BaseModel<SongTag> {
	private static final long serialVersionUID = 1L;
	public static final SongTag me = new SongTag();
	public static final String TABEL_NAME="jf_tb_song_tag";
	
	public List<SongTag> getSongIdByTagId(Integer tagId){
		List<SongTag> st = find("select song_id from "+TABEL_NAME+" where tag_id=?",tagId);
		return st;
	}
	
	public List<String> getTagNameBySongId(Integer songId){
		List<String> tagNames = Db.query("select t.name from "+SongTag.TABEL_NAME+" st,"+Tag.TABLE_NAME+" t where  st.tag_id=t.id and st.song_id=?",songId);
		return tagNames;
	}
	public List<SongTag> getBySongId(Integer songId){
		List<SongTag> st = me.find("select st.id id,t.name name from "+SongTag.TABEL_NAME+" st,"+Tag.TABLE_NAME+" t where  st.tag_id=t.id and st.song_id=?",songId);
		return st;
	}
	
	public SongTag saveTag(Integer songId,Integer tagId){
		SongTag st =  new SongTag().set("song_id", songId).set("tag_id", tagId);
		st.save();
		return st;
		
	}
	public SongTag checkSongTagIsExist(Integer songId,Integer tagId){
		SongTag st = me.findFirst("select * from "+TABEL_NAME+" where song_id=? and tag_id=?", songId,tagId);
		return st;
	}
	
	public void delBySongId(Integer songId){
		Db.update("delete from "+TABEL_NAME+" where song_id=?", songId);
	}
	public void delById(Integer id){
		me.deleteById(id);
	}
	
}
