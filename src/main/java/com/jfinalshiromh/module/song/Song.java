package com.jfinalshiromh.module.song;

import java.sql.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.module.music.Music;
import com.jfinalshiromh.utils.StrUtil;
import com.jfinalshiromh.utils.ext.plugin.tablebind.TableBind;


@TableBind(tableName = "jf_tb_song")
public class Song extends BaseModel<Song> {
	private static final long serialVersionUID = 1L;
	public static final Song me = new Song();
	public static String TABLE_NAME = "jf_tb_song";

	public Page<Song> page(int pageNumber, int pageSize, String name,String tag) {
        StringBuffer condition = new StringBuffer();
        if (!StrUtil.isBlank(name)) {
            condition.append(" and name like \"%" + name + "%\" ");
        }
        if (!StrUtil.isBlank(tag)&& Integer.valueOf(tag)>0) {
        	
        	return super.paginate(pageNumber, pageSize, "select s.*","from "+TABLE_NAME+" s ,"+SongTag.TABEL_NAME+" t where s.id=t.song_id and t.tag_id=? order by s.id desc",Integer.valueOf(tag));
        	
        }
        return super.paginate(pageNumber, pageSize, "select * ","from " + TABLE_NAME + " where 1 = 1 " + condition + " order by id desc");

    }
	
	public Song getById(Integer id){
		return findById(id);
	}
	
	public void delSong(Integer id){
		me.deleteById(id);
		SongTag.me.delBySongId(id);
	}
	
	public List<Song> getNewSong(Integer pageSize,Integer pageNum){
		return me.find("select id,name,author,level,cover_path,stave_path,midi_path,ogg_path,click_num from jf_tb_song  order by id desc limit ?,?",(pageNum-1)*pageSize,pageSize);
	}
	
	public List<Song> getHotSong(Integer pageNum,Integer pageSize){
		Long count = Db.queryFirst("select count(*) from jf_tb_song where click_num>=100");
		if(count>=3){
			return me.find("select id,name,author,level,cover_path,stave_path,midi_path,ogg_path,click_num from jf_tb_song  order by click_num desc limit ?,?",(pageNum-1)*pageSize,pageSize);
		}else{
			return null;
		}
	}
	
	public List<Map<String,Object>> getListSongByTagId(Integer tagId,Integer pageNum,Integer pageSize){
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		Map<String,Object> map = null;
		for(int i=1;i<=8;i++){
			List<Song> songs = me.find("select DISTINCT(st.song_id) id,name,author,level,cover_path,stave_path,midi_path,ogg_path,"
					+ "click_num from jf_tb_song s,jf_tb_song_tag st where s.id=st.song_id and st.tag_id=? and level=? order by s.id desc limit ?,?",tagId,i,(pageNum-1)*pageSize,pageSize);
			if(songs!=null && songs.size()>0){
				map=new HashMap<String, Object>();
				map.put("level", i);
				map.put("songs", songs);
				result.add(map);
			}
		}
		return result.size()>0?result:null;
	}
	
	public List<Song> getListSongByTagIdAndLevel(Integer tagId,Integer level,Integer pageNum,Integer pageSize){
		return  me.find("select DISTINCT(st.song_id) id,name,author,level,cover_path,stave_path,midi_path,ogg_path,"
				+ "click_num from jf_tb_song s,jf_tb_song_tag st where s.id=st.song_id and st.tag_id=? and level=? order by s.id desc limit ?,?",tagId,level,(pageNum-1)*pageSize,pageSize);
	}
	
	
}
