package com.jfinalshiromh.module.song;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.upload.UploadFile;
import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.module.music.Music;
import com.jfinalshiromh.utils.Result;
import com.jfinalshiromh.utils.ext.route.ControllerBind;
@ControllerBind(controllerKey = "/admin/song", viewPath = "/page/admin/song")
public class SongAdminController extends BaseController {

	public void  index(){
		
		List<Tag> tags = Tag.me.getAll();
		
		String name = getPara("name");
		String tag = getPara("tag");
        setAttr("page", Song.me.page(getParaToInt("p", 1), defaultPageSize(), name,tag));
        setAttr("name", name);
        setAttr("tag", tag);
        setAttr("tags", tags);
	    render("index.ftl");
	}
	
	public void detail(){
		Integer id = getParaToInt("id");
		Song song = Song.me.getById(id);
		List<String> tagNames = SongTag.me.getTagNameBySongId(id);
		setAttr("song", song);
		setAttr("tagNames", tagNames);
		render("info.ftl");
	}
	
	public void add(){
		if(getRequest().getMethod().equalsIgnoreCase(Constants.POST)){
			String [] tagIds = getPara("tags").split("_");
			Song song = getModel(Song.class);
			song.save();
			for(String tagId : tagIds){
				if(tagId!=null&&!"".equals(tagId)){
					SongTag.me.saveTag(song.getInt("id"), Integer.valueOf(tagId));
				}
			}
			redirect("/admin/song");
		}else{
			List<Tag> tags = Tag.me.getAll();
			setAttr("tags", tags);
			render("add.ftl");
		}
	}
	 
    public void uploadPic() throws Exception{
    	
    	String type=getPara("type");
        UploadFile uploadFile = getFile("file-upload", type);
        String path = Constants.UPLOAD_DIR_ROOT + type+ "/" + uploadFile.getFileName();

        renderJson( new Result("200","success",path));
    }
    
    public void addTag(){
    	String tagName = getPara("tagName");
    	Tag tag = Tag.me.checkTagNameisExist(tagName);
    	if(tag!=null){
    		success(tag);
    		return ;
    	}
    	tag=Tag.me.add(tagName);
    	if(tag==null){
    		error("添加有误");
    		return;
    	}
    	success(tag);
    }
    
    public void delSong(){
    	Integer songId = getParaToInt("songId");
    	Song.me.delSong(songId);
    	Song song = Song.me.findById(songId);
        String realPath = getRequest().getServletContext().getRealPath("/");
        System.out.println(realPath);
        String coverPath = realPath + song.getStr("cover_path");
        String stavePath = realPath + song.getStr("stave_path");
        String midiPath = realPath + song.getStr("midi_path");
        String oggPath = realPath + song.getStr("ogg_path");
        String txtaPath = realPath + song.getStr("txt_a");
        String txtbPath = realPath + song.getStr("txt_b");
        File staveFile = new File(stavePath);
        File midiFile = new File(midiPath);
        File oggFile = new File(oggPath);
        File txtaFile = new File(txtaPath);
        File txtbFile = new File(txtbPath);
        File coverFile = new File(coverPath);
        
        if(staveFile.exists()){
        	staveFile.delete();
        }
        if(midiFile.exists()){
        	midiFile.delete();
        }
        if(oggFile.exists()){
        	oggFile.delete();
        }
        if(txtaFile.exists()){
        	txtaFile.delete();
        }
        if(txtbFile.exists()){
        	txtbFile.delete();
        }
        if(coverFile.exists()){
        	coverFile.delete();
        }
    	success();
    }
    
    public void editSong(){
		if(getRequest().getMethod().equalsIgnoreCase(Constants.POST)){
			getModel(Song.class).update();
			redirect("/admin/song");
		}else{
			Integer songId = getParaToInt("songId");
			Song song = Song.me.getById(songId);
			List<SongTag> songTag = SongTag.me.getBySongId(songId);
			List<Tag> tags = Tag.me.getAll();
			
			setAttr("tags", tags);
			setAttr("song", song);
			setAttr("songTag", songTag);
			render("edit.ftl");
		}
	}
    
    public void delSongTagById(){
    	Integer songTagId=getParaToInt("songTagId");
    	SongTag.me.delById(songTagId);
    	success();
    	
    }
    
    public void addSongTagBySongIdAndTagId(){
    	Integer songId = getParaToInt("songId");
    	Integer tagId = getParaToInt("tagId");
    	if(SongTag.me.checkSongTagIsExist(songId, tagId)==null){
    		SongTag st = SongTag.me.saveTag(songId, tagId);
    		success(st);
    	}else{
    		error("不能重复添加");
    	}
    }
    
    public void addSongTagBySongIdAndTagName(){
    	Map<String,Object> result = new HashMap<String, Object>();
    	String tagName = getPara("tagName");
    	Integer songId = getParaToInt("songId");
    	Tag tag = Tag.me.checkTagNameisExist(tagName);
    	if(tag==null){
    		tag=Tag.me.add(tagName);
    		result.put("code", 200);
    	}else{
    		result.put("code", 201);
    	}
    	SongTag st = SongTag.me.checkSongTagIsExist(songId, tag.getInt("id"));
    	if(st==null){
			st = SongTag.me.saveTag(songId, tag.getInt("id"));
			result.put("st", st);
			success(result);
    	}else{
    		error("不能重复添加！");
    	}
    }
}
