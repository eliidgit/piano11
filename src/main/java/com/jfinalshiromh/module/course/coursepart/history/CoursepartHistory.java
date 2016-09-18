package com.jfinalshiromh.module.course.coursepart.history;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.utils.ext.plugin.tablebind.TableBind;

@TableBind(tableName = "jf_tb_course_part_history")
public class CoursepartHistory extends BaseModel<CoursepartHistory> {
	private static final long serialVersionUID = 1L;
	public static CoursepartHistory me = new CoursepartHistory();
    public static String TABLE_NAME = "jf_tb_course_part_history";

    public boolean savePartHistory(Integer classId,Integer partId){
    	return new CoursepartHistory().set("class_id", classId).set("part_id", partId).save();
    }
    
    public Boolean checkIsExist(Integer classId,Integer partId){
    	Long count = Db.queryLong("select count(*) from "+TABLE_NAME+" where class_id=? and part_id=?",classId,partId);
    	return count>0?true:false;
    }
    
    public List<CoursepartHistory> getHistroyLessonByClass(Integer classId){
    	return find("select h.part_id partId,h.id, c.parent_id lessonId,name,type from jf_tb_course_part_history h, jf_tb_course_part c where h.part_id=c.id and h.class_id = ?",classId);
    }
    
    
    	
}
