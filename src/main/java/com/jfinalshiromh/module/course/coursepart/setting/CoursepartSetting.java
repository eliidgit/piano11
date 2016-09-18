package com.jfinalshiromh.module.course.coursepart.setting;

import com.jfinal.plugin.activerecord.Db;
import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.utils.ext.plugin.tablebind.TableBind;

import java.util.ArrayList;
import java.util.List;

@TableBind(tableName = "jf_tb_course_part_setting")
public class CoursepartSetting extends BaseModel<CoursepartSetting> {
	private static final long serialVersionUID = 1L;
	public static CoursepartSetting me = new CoursepartSetting();
    public static String TABLE_NAME = "jf_tb_course_part_setting";
    
    
    public void saveLesson(Integer classId,Integer lessonId){
    	Long count = Db.queryFirst("select count(*) from "+TABLE_NAME+" where class_id=? and part_id=?",classId,lessonId);
    	if(count<1){
	    	CoursepartSetting cps = new CoursepartSetting();
	    	cps.set("part_id", lessonId).set("class_id", classId).set("parent_part_id", 0).save();
    	}
    	
    }
    
    public void savePart(String [] partIds ,Integer parentPartId,Integer classId){
    	List<CoursepartSetting> list = new ArrayList<CoursepartSetting>();
    	CoursepartSetting cs =null;
    	for(String partId : partIds){
    		cs= new CoursepartSetting();
    		cs.set("part_id", Integer.parseInt(partId)).set("parent_part_id", parentPartId).set("class_id", classId);
    		list.add(cs);
    	}
    	Db.batchSave(list, list.size());
    	
    }
    
    
    
    public Integer updateLessonStatus(Integer lessonId,Integer classId){
    	return Db.update("update "+TABLE_NAME+" set lesson_status='1' where part_id=? and class_id=?",lessonId,classId);
    }
    
    
    public List<CoursepartSetting> getAllLesson(Integer classId){
    	return me.find("select c.name,s.lesson_status,s.id,s.part_id lesson_id,s.class_id from jf_tb_course_part_setting s,jf_tb_course_part c where s.part_id=c.id and s.class_id=? and s.parent_part_id=0 order by s.id",classId);
    }
    
    
    public List<CoursepartSetting> getAllPartByLesson(Integer lessonId,Integer classId){
    	return me.find("select c.name,c.type,s.part_id lesson_id from jf_tb_course_part_setting s,jf_tb_course_part c where s.part_id=c.id and s.parent_part_id=? and s.class_id=? order by s.id",lessonId,classId);
    }

}
