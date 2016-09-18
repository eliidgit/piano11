package com.jfinalshiromh.module.school.teacher;

import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.utils.ext.plugin.tablebind.TableBind;

import java.util.Date;
import java.util.List;


public class TeacherResult extends BaseModel<TeacherResult> {
    public static TeacherResult me = new TeacherResult();


    public List<TeacherResult> topN(int n){
        String sql = "select * from jf_tb_teacher_result order by id limit ?";
        return find(sql,n);
    }

    public List<TeacherResult> topNByTeacherId(int tid){
        String sql = "select * from jf_tb_teacher_result where tid = ? order by id";
        return find(sql,tid);
    }
    
    public Boolean save(Integer tid,String title,String content,Date startDate,Date endDate){
    	return new TeacherResult().set("tid", tid).set("title", title).set("content", content)
    			.set("time_start", startDate).set("time_end", endDate).save();
    			
    			
    }
}
