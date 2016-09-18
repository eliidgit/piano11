package com.jfinalshiromh.module.school.teacher;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.module.course.coursepart.Coursepart;
import com.jfinalshiromh.module.course.coursepart.history.CoursepartHistory;
import com.jfinalshiromh.module.course.coursepart.setting.CoursepartSetting;
import com.jfinalshiromh.module.music.tone.Tone;
import com.jfinalshiromh.module.music.tone.version.ToneVersion;
import com.jfinalshiromh.module.school.classinfo.ClassInfo;
import com.jfinalshiromh.module.school.classinfo.ClassTeacher;
import com.jfinalshiromh.module.school.student.score.StudentScore;
import com.jfinalshiromh.module.user.User;
import com.jfinalshiromh.utils.StrUtil;
import com.jfinalshiromh.utils.ext.route.ControllerBind;


@ControllerBind(controllerKey = "/api/teacher")
public class TeacherClientController extends BaseController {

    
    public void detail() {

        String phone = getPara("phone", "");
        if (StrUtil.isBlank(phone) || !StrUtil.isMobile(phone)) {
            error("手机号有错，请检查");
        } else {
            Teacher teacher = Teacher.me.getTeacherByPhone(phone);
            if (teacher == null) {
                error("该手机号未与教师绑定，请申请学校去绑定手机号");
            } else {
                Map<String, Object> resultMap = new HashMap<String, Object>();

                
                
                int classId = ClassTeacher.me.getCidByTid(teacher.getInt("id"));
                if (classId == -1) {
                    
                    resultMap.put("teacherClassName", "未分配班级");
                    resultMap.put("teacherGradeName", "");
                } else {
                	
                    
                    ClassInfo classInfo = ClassInfo.me.findById(classId);

                    String className = classInfo.getStr("name");

                    
                    String gradeName = ClassInfo.me.getGradeNameById(classInfo.getInt("id"));

                    
                    resultMap.put("teacherClassName", className);
                    resultMap.put("teacherClassID", classId);
                    resultMap.put("teacherGradeID", gradeName);
                }
                if (teacher != null) {
                    
                	User u=User.me.findByPhone(teacher.getStr("phone"));
                    String avatar = u.get("avatar");
                    resultMap.put("avatar", avatar);
                    resultMap.put("name", teacher.get("name"));
                    resultMap.put("gender", teacher.get("gender"));
                    resultMap.put("job", teacher.get("job"));
                    resultMap.put("entry_time", teacher.get("entry_time"));
                    resultMap.put("graduated", teacher.get("graduated"));
                    resultMap.put("tops_result", TeacherResult.me.topNByTeacherId(teacher.getInt("id")));
                    resultMap.put("schoolId", u.getInt("school_id"));
                    success(resultMap);
                } 
            }
        }
    }
    
    
    public void getCheckToneIsUpdate(){
    	success(ToneVersion.me.getNewTime());
    	
    }
    
    
    public void getTones(){
    	String type = getPara("type","1");
    	success(Tone.me.getAllByClientType(type));
    }
    
    
    public void oneLessonOver(){
    	try {
			Integer classId = getParaToInt("classId");
			Integer lessonId = getParaToInt("lessonId");
			if (!StrUtil.checkParamIsNotNull(classId, lessonId)) {
				error("参数不能为空");
				return;
			}
			ClassInfo classInfo = ClassInfo.me.findById(classId);
			Integer temp = classInfo.getInt("lesson_id");
			if(temp!=null && temp>=lessonId){
				success();
				return;
			}
			ClassInfo.me.updateLesson(classId, lessonId);
			success();
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("未知错误");
    }
    
    
    public void uploadNotLesson(){
    	try {
			Integer classId = getParaToInt("classId");
			Integer partId = getParaToInt("partId");
			if (!StrUtil.checkParamIsNotNull(classId, partId)) {
				error("参数不能为空");
				return;
			}
			if (CoursepartHistory.me.checkIsExist(classId, partId)) {
				error("历史课程中已存在此课程！");
				return;
			}
			if (CoursepartHistory.me.savePartHistory(classId, partId)) {
				success();
			} else {
				error("上传有误");
			}
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("未知错误");
    	
    }
    
    
    public void getHistoryLessonByClass(){
    	try {
			Integer classId = getParaToInt("classId");
			if (!StrUtil.checkParamIsNotNull(classId)) {
				error("参数不能为空");
				return;
			}
			List<CoursepartHistory> list = CoursepartHistory.me
					.getHistroyLessonByClass(classId);
			success(list);
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("未知错误");
    }
    
    
    public void getLessonById(){
    	try {
			Integer lessonId = getParaToInt("lessonId");
			if (!StrUtil.checkParamIsNotNull(lessonId)) {
				error("参数不能为空");
				return;
			}
			Coursepart cp = Coursepart.me.getById(lessonId);
			success(cp);
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("未知错误");
    }
    
    
    
    public void createLesson(){
    	try {
			Integer classId = getParaToInt("classId");
			String partIdsStr = getPara("partIds");
			String historyIdsStr = getPara("historyIds");
			if(!StrUtil.checkParamIsNotNull(classId,partIdsStr,historyIdsStr)){
				error("参数不能为空");
				return;
			}
			ClassInfo classInfo = ClassInfo.me.findByIdLoadColumns(classId,
					"lesson_id");
			CoursepartSetting.me.saveLesson(classId,classInfo.getInt("lesson_id"));
			String[] partIds = partIdsStr.split("_");
			CoursepartSetting.me.savePart(partIds,classInfo.getInt("lesson_id"), classId);
			String [] historyIds = historyIdsStr.split("_");
			for(String id : historyIds){
				CoursepartHistory.me.deleteById(Integer.parseInt(id));
			}
			success();
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("未知错误");
    }
    
    
    public void oneSettingLessonOver(){
    	try {
			Integer lessonId = getParaToInt("lessonId");
			Integer classId = getParaToInt("classId");
			if (!StrUtil.checkParamIsNotNull(lessonId, classId)) {
				error("参数不能为空");
				return;
			}
			CoursepartSetting.me.updateLessonStatus(lessonId, classId);
			success();
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("未知错误");
    }
    
    
    public void getAllSettingLesson(){
    	try {
			Integer classId = getParaToInt("classId");
			if (!StrUtil.checkParamIsNotNull(classId)) {
				error("参数不能为空");
				return;
			}
			List<CoursepartSetting> list = CoursepartSetting.me
					.getAllLesson(classId);
			success(list);
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("未知错误");
    }
    
    
    public void getPartsByLesson(){
    	try {
			Integer classId = getParaToInt("classId");
			Integer lessonId = getParaToInt("lessonId");
			if (!StrUtil.checkParamIsNotNull(lessonId, classId)) {
				error("参数不能为空");
				return;
			}
			List<CoursepartSetting> list = CoursepartSetting.me
					.getAllPartByLesson(lessonId, classId);
			success(list);
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("未知错误");
    }
    
    
    public void setIpByClass(){
    	try {
			String ip = getPara("ip");
			Integer classId = getParaToInt("cid");
			if(!StrUtil.checkParamIsNotNull(ip,classId)){
				error("参数不能为空");
				return;
			}
			Integer port = Integer.parseInt(StrUtil.randomNumber(5));
			 if(port<10000){
				port=port+10000;
			}
			System.out.println(port);
			ClassInfo.me.updateIPByClassId(classId, ip, port);
			Map<String,Object> result = new HashMap<String, Object>();
			result.put("ip", ip);
			result.put("port", port);
			result.put("cid", classId);
			success(result);
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("未知错误");
    }
    
    public void getTeacherClassGradeInfo(){
    	try {
			Integer tid = getParaToInt("tid");
			if(!StrUtil.checkParamIsNotNull(tid)){
				error("参数不能为空");
				return;
			}
			List<ClassTeacher> ct = ClassTeacher.me.getClassGradeInfoByTid(tid);
			success(ct);
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("未知错误");
    }
    
    
    public void getStuScoreByClassAndPartId(){
    	try {
			Integer cid = getParaToInt("cid");
			Integer partId = getParaToInt("partId");
			if (!StrUtil.checkParamIsNotNull(cid, partId)) {
				error("参数不能为空");
				return;
			}
			List<StudentScore> ss = StudentScore.me.getStuScoreByClassAndPartId(cid, partId);
			success(ss);
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("位置错误");
    }
    
    
    public void addCommentToStuPart(){
    	try {
			String comment = getPara("comment");
			Integer scoreId = getParaToInt("scoreId");
			if (!StrUtil.checkParamIsNotNull(scoreId, comment)) {
				error("参数不能为空");
				return;
			}
			StudentScore.me.updateCommentById(scoreId, comment);
			success();
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("位置错误");
    }
    
    
    public void emptyIPByClass(){
    	try {
			Integer cid = getParaToInt("cid");
			if(!StrUtil.checkParamIsNotNull(cid)){
				error("班级ID不能为空！");
				return;
			}
			ClassInfo.me.updateIPByClassId(cid,null,null);
			success();
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("未知错误");
    	
    }
    

}
