package com.jfinalshiromh.module.song;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.jfinal.kit.PathKit;
import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.utils.StrUtil;
import com.jfinalshiromh.utils.ext.route.ControllerBind;
@ControllerBind(controllerKey = "/api/song")
public class SongClientController extends BaseController {

	
	public void getTags(){
		List<Tag> tags = Tag.me.getAllByApi();
		success(tags);
	}
	
	
	public void getNewSong(){
		Integer pageNum = getParaToInt("pageNum", 1);
		Integer pageSize = getParaToInt("pageSize", 8);
		pageNum=pageNum<1?1:pageNum;
		List<Song> songs = Song.me.getNewSong(pageSize,pageNum);
		success(songs);
	}
	
	public void getHotSong(){
		Integer pageNum = getParaToInt("pageNum", 1);
		Integer pageSize = getParaToInt("pageSize", 8);
		pageNum=pageNum<1?1:pageNum;
		List<Song> songs = Song.me.getHotSong(pageNum, pageSize);
		if(songs!=null){
			success(songs);
		}else{
			error("点击量太低，不显示此页");
		}
	}
	
	
	public void getListSongByTagId(){
		Integer pageNum = getParaToInt("pageNum", 1);
		Integer pageSize = getParaToInt("pageSize", 8);
		Integer tagId = getParaToInt("tagId");
		pageNum=pageNum<1?1:pageNum;
		List<Map<String,Object>> list = Song.me.getListSongByTagId(tagId, pageNum, pageSize);
		if(list!=null){
			success(list);
		}else{
			error("没有符号的条件");
		}
	}
	
	
	public void getListSongByTagIdAndLevel(){
		Integer pageNum = getParaToInt("pageNum", 1);
		Integer pageSize = getParaToInt("pageSize", 8);
		Integer tagId = getParaToInt("tagId");
		Integer level =getParaToInt("level");
		pageNum=pageNum<1?1:pageNum;
		List<Song> songs = Song.me.getListSongByTagIdAndLevel(tagId, level, pageNum, pageSize);
		if(songs!=null && songs.size()>0){
			success(songs);
		}else{
			error("无符合此条件歌曲");
		}
	}
	
	
	public void savePlayRecord() throws IOException{
		Integer songId=getParaToInt("songId");
		String phoneNum=getPara("phoneNum");
		Integer coverNum = getParaToInt("coverNum");
		String yinGao = getPara("yinGao");
		String jieZou = getPara("jieZou");
		String shiZhi = getPara("shiZhi");
		InputStream input = this.getRequest().getInputStream();
		String txtPath=Constants.UPLOAD_DIR_ROOT+Constants.UPLOAD_DIR_TXT+"/"+new Date().getTime()+StrUtil.randomNumber(3)+".txt";
		File file = new File(PathKit.getWebRootPath()+txtPath);
		File parent = file.getParentFile();
    	if(parent!=null&&!parent.exists()){
    		parent.mkdirs();
    	}
		OutputStream out = new FileOutputStream(file);
		byte [] b = new byte[1024];
		int i=0;
		while((i=input.read(b))!=-1){
			System.out.println(i);
			out.write(b, 0, i);
		}
		out.close();
		input.close();
		if(SongRecord.me.save(songId, phoneNum, coverNum, yinGao, jieZou, shiZhi, txtPath)){
			success();
		}else{
			error("保存数据失败");
		}
		
	}
}
