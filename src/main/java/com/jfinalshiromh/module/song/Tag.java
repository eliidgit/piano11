package com.jfinalshiromh.module.song;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.utils.ext.plugin.tablebind.TableBind;


@TableBind(tableName = "jf_tb_tag")
public class Tag extends BaseModel<Tag> {
	private static final long serialVersionUID = 1L;
	public static final Tag me = new Tag();
	public static String TABLE_NAME = "jf_tb_tag";
	public List<Tag> getAll(){
		return find("select * from "+Tag.TABLE_NAME+" order by order_by desc");
	}
	
	public List<Tag> getAllByApi(){
		return find("select id,name from "+Tag.TABLE_NAME+" order by order_by desc");
	}
	
	public Tag add(String name){
		 try {
			Tag tag = new Tag();
			if(tag.set("name", name).save()){
				return tag;
			}
			return null;
		} catch (Exception e) {
			System.out.println(e);
			return findFirst("select * from "+TABLE_NAME+" where name=?",name);
		}
	}
	
	public Tag checkTagNameisExist(String name){
		return findFirst("select * from "+TABLE_NAME+" where name=?",name);
	}
	
}
