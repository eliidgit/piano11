package com.jfinalshiromh.module.school.student.score;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.utils.StrUtil;
import com.jfinalshiromh.utils.ext.plugin.tablebind.TableBind;


@TableBind(tableName = "jf_tb_student_score")
public class StudentScore extends BaseModel<StudentScore> {

    public static final StudentScore me = new StudentScore();
    public static final String TABLE_NAME = "jf_tb_student_score";
    
    public StudentScore() {
		super();
	}
    
    public StudentScore(Integer id,Integer score,
			Integer jieZou,Integer shiZhi,Integer yinGao,String playRecord,String errorFlag,String comments){
    	this.set("id", id);
		if(StrUtil.checkParamIsNotNull(score)){
			this.set("score", score);
		}
		if(StrUtil.checkParamIsNotNull(jieZou)){
			this.set("s_jiezou", jieZou);
		}
		if(StrUtil.checkParamIsNotNull(shiZhi)){
			this.set("s_shizhi", yinGao);
		}
		if(StrUtil.checkParamIsNotNull(yinGao)){
			this.set("s_yingao", yinGao);
		}
		if(StrUtil.checkParamIsNotNull(playRecord)){
			this.set("play_record", playRecord);
		}
		if(StrUtil.checkParamIsNotNull(errorFlag)){
			this.set("error_flag", errorFlag);
		}
		if(StrUtil.checkParamIsNotNull(comments)){
			this.set("comments", comments);
		}
	}

	
    public Page<StudentScore> page(int pageNumber, int pageSize, String name) {
        StringBuffer condition = new StringBuffer();
        if (!StrUtil.isBlank(name)) {
            condition.append(" and name like \"%" + name + "%\" ");
        }

        return super.paginate(pageNumber, pageSize, "select ss.id, " +
                        "stu.name stuname ," +
                        "ss.score," +
                        "cp.name partname," +
                        "ss.comments," +
                        "ss.s_jiezou," +
                        "ss.s_yingao," +
                        "ss.s_shizhi," +
                        "ss.student_answer",
                "from " + TABLE_NAME + " ss,jf_tb_student stu,jf_tb_course_part cp where 1=1 " +
                        condition +
                        " and ss.sid = stu.id and ss.part_id  = cp.id order by id desc");
    }
    
    
    public StudentScore getByPhoneAndPId(Integer sid,Integer pid){
    	return findFirst("select s.*,p.name pname from jf_tb_student_score s,jf_tb_course_part p where p.id=s.part_id and s.sid=? and part_id=?",sid,pid);
    }
    
    public StudentScore getZuoYeByPartIdAndPhone(Integer sid,Integer pid){
    	return findFirst("select s.* from jf_tb_course_part c,jf_tb_student_score s where c.id=s.part_id and c.parent_id=? and c.type=107 and s.sid=?",pid,sid);
    }
    
    public List<StudentScore> getAllLessonByStu(Integer courseId,Integer currentLessonId,Integer sid){
    	return find("select s.*,c.name name from jf_tb_course_part c ,jf_tb_student_score s where c.id=s.part_id and c.course_id=? and c.parent_id=0 and c.id<=? and s.sid=? order by part_index desc",courseId,currentLessonId,sid);
    }
    
    public List<StudentScore> getAllLessonUnitByStuAndLessonId(Integer parentPId,Integer courseId,Integer sid){
    	return find("select * from jf_tb_course_part c ,jf_tb_student_score s where c.id=s.part_id and c.course_id=? and c.parent_id=? and s.sid=? order by part_index",courseId,parentPId,sid);
    }
    
    
    public List<StudentScore> getAllTaskByStu(Integer courseId,Integer currentLessonId,Integer sid){
    	return find("select s.*,c.parent_id parentId  from jf_tb_course_part c,jf_tb_student_score s where s.part_id=c.id and parent_id in(select id from jf_tb_course_part "+
    				"where course_id=? and parent_id=0 and id<=? order by part_index desc)  and type=107 and s.sid=? order by parentId desc",courseId,currentLessonId,sid);
    }
    
    public List<StudentScore> getTasksByLessonId(Integer pid,Integer sid){
    	return find("select s.*, c.name from jf_tb_course_part c,jf_tb_student_score s where s.part_id=c.id and c.parent_id=? and s.sid=? order by part_id",pid,sid);
    }

    public List<StudentScore> getStuScoreByClassAndPartId(Integer classId,Integer partId){
		return me.find("select s.name,ss.score,s.phone,s.id,ss.play_record,ss.error_flag,ss.comments from jf_tb_student s,jf_tb_student_score ss where s.id=ss.sid and s.class_id=? and ss.part_id=? order by ss.score desc",classId,partId);
	}
	 
	public StudentScore save(Integer sid,Integer courseId,Integer score,
			String playRecord,String errorFlag,Integer jieZou,Integer shiZhi,Integer yinGao){
		StudentScore sr = new StudentScore().set("sid", sid).set("part_id", courseId).set("score", score);
		if(StrUtil.checkParamIsNotNull(playRecord)){
			sr.set("play_record", playRecord);
		}
		if(StrUtil.checkParamIsNotNull(errorFlag)){
			sr.set("error_flag", errorFlag);
		}
		if(StrUtil.checkParamIsNotNull(jieZou)){
			sr.set("s_jiezou", jieZou);
		}
		if(StrUtil.checkParamIsNotNull(shiZhi)){
			sr.set("s_shizhi", yinGao);
		}
		if(StrUtil.checkParamIsNotNull(yinGao)){
			sr.set("s_yingao", yinGao);
		}
		if(sr.save()){
			return sr;
		}
		return null;
	}
	
	public int updateCommentById(Integer id,String comment){
		return Db.update("update "+TABLE_NAME+" set comments=? where id=?",comment,id);
	}
	
	
	public StudentScore getByStuIdAndPartId(Integer sid,Integer partId){
		return me.findFirst("select id,sid,part_id,score,play_record,error_flag,comments,s_jiezou,s_shizhi,s_yingao from "+ TABLE_NAME + " where sid=? and part_id = ?",sid,partId);
	}
}
