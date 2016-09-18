package com.jfinalshiromh.module.school.student.homeworkanswer;

import com.jfinal.plugin.activerecord.Db;
import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.utils.StrUtil;


public class StuHomeworkAnswer extends BaseModel<StuHomeworkAnswer> {

    
	private static final long serialVersionUID = 1L;
	public static final StuHomeworkAnswer me = new StuHomeworkAnswer();
    public static final String TABLE_NAME = "jf_tb_stu_homework_answer";
    
    
    public StuHomeworkAnswer() {
		super();
	}
    public StuHomeworkAnswer(Integer sid,Integer hid,String answer) {
    	this.set("sid", sid).set("hid", hid).set("student_answer", answer);
  	}
    public StuHomeworkAnswer(Integer id,String answer) {
    	this.set("id", id).set("student_answer", answer);
  	}
      


	
    public String getAnswerByHomeworkAndStu(Integer sid,Integer homeworkId){
    	return Db.queryStr("select student_answer from jf_tb_student_score where sid=? and homework_id=?",sid,homeworkId);
    }
    
    public StuHomeworkAnswer getByHidandSid(Integer sid,Integer hid){
    	return me.findFirst("select id,hid,student_answer from "+ TABLE_NAME + " where sid=? and hid=?",sid,hid);
    }

}
