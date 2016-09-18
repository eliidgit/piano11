package com.jfinalshiromh.module.school.student;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.module.course.coursepart.Coursepart;
import com.jfinalshiromh.module.course.coursepart.po.PartNode;
import com.jfinalshiromh.module.homework.Homework;
import com.jfinalshiromh.module.music.Music;
import com.jfinalshiromh.module.notification.Notification;
import com.jfinalshiromh.module.school.classinfo.ClassInfo;
import com.jfinalshiromh.module.school.grade.Grade;
import com.jfinalshiromh.module.school.student.homeworkanswer.StuHomeworkAnswer;
import com.jfinalshiromh.module.school.student.score.StudentScore;
import com.jfinalshiromh.module.user.User;
import com.jfinalshiromh.module.video.Video;
import com.jfinalshiromh.utils.StrUtil;
import com.jfinalshiromh.utils.ext.route.ControllerBind;


@ControllerBind(controllerKey = "/api/student")
public class StudentClientController extends BaseController {
    public void index() {
        success();
    }

    
    public void detail() {
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.POST) || method.equalsIgnoreCase(Constants.GET)) {
            String phone = getPara("phone");
            Student student = Student.me.getStudentByPhone(phone);
            if (student == null) {
                error("该手机号未与学生绑定，请申请学校去绑定手机号");
            } else {
                Map<String, Object> resultMap = new HashMap<String, Object>();
                User u = User.me.findByPhone(student.getStr("phone"));
                String avatar = u.get("avatar");
                resultMap.put("sid", student.getInt("id"));
                resultMap.put("avatar", avatar);
                resultMap.put("name", student.getStr("name"));
                resultMap.put("gender", student.getStr("gender"));
                resultMap.put("level",student.getInt("level"));
                resultMap.put("age",student.getStr("age"));
                resultMap.put("description", student.getStr("description"));
                resultMap.put("score", student.getInt("score"));
                
                resultMap.put("fans", StudentLike.me.getSumFans(student.getStr("phone")));
                resultMap.put("schoolId", u.getInt("school_id"));
                
                resultMap.put("attentions", StudentLike.me.getSumAttention(student.getStr("phone")));
                Object [] objs = Student.me.getGradeAndClassByStuId(student.getInt("id"));
                System.out.println(objs!=null ? objs.length:"kong");
                resultMap.put("cid", objs[0]);
                resultMap.put("cname", objs[1]);
                resultMap.put("gid", objs[2]);
                resultMap.put("gname", objs[3]);
                success(resultMap);
            }
        }
    }
    
    
    public void getLessonByGid(){
    	try {
			Integer gid = getParaToInt("gid");
			if (!StrUtil.checkParamIsNotNull(gid)) {
				error("参数不能为空");
				return;
			}
			List<Coursepart> list = Coursepart.me.getLessonByGid(gid);
			success(list);
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("未知错误");
    }
    
    
    public void getChildCourse(){
    	try {
			Integer id = getParaToInt("id");
			if (!StrUtil.checkParamIsNotNull(id)) {
				error("参数不能为空");
				return;
			}
			List<Coursepart> list = Coursepart.me.getChildsColumnById(id);
			success(list);
			return ;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("未知错误");
    }
    
    
    public void getStuByCid(){
    	Integer cid = getParaToInt("cid");
    	List<Student> stus = Student.me.getByClassId(cid);
    	if(stus==null || stus.size()==0){
    		error("无此班级或此班级下无学生");
    		return;
    	}
    	success(stus);
    }

    public void getNotificationTop() {
        int num = getParaToInt("number", -1);
        if (num <= 0)
            error("请传入前N条参数");
        else
            success(Notification.me.getTopList(num));
    }


    

    

    
    public void  getCourses(){
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET)){
            
            int courseId = Grade.me.getCourseIdById(getParaToInt("grade_id",-1));
            
            List<Coursepart> partList = Coursepart.me.getFirstPartByCid(courseId);
            
            List<PartNode> partNodeList = new ArrayList<PartNode>();

            for (Coursepart part: partList
                 ) {
                int partId = part.getInt("id");
                PartNode partNode = Coursepart.me.getPartNodeById(partId);
                partNodeList.add(partNode);
            }
            success(partNodeList);
        }
    }


    
    public void getResources(){
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET)){
            int resourcePartId =getParaToInt("id",-1);

            String type = getPara("type","");
            if (type.equalsIgnoreCase(Constants.PART_TYPE_RESOURCE_VIDEO)){
                
                success(Video.me.findByPartId(resourcePartId));
            }else  if (type.equalsIgnoreCase(Constants.PART_TYPE_RESOURCE_MUSIC)){
                
                success(Music.me.findByPartId(resourcePartId));
            }else  if (type.equalsIgnoreCase(Constants.PART_TYPE_RESOURCE_HOMEWORK)){
                
                success(Homework.me.findByPartId(resourcePartId));
            }else{
                error("资源类型不正确");
            }
        }
    }

    
    public void getLessonResources(){
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET)){
            int partId =getParaToInt("id",-1);

            List<String> reourcesList = new ArrayList<String>();

            reourcesList = Coursepart.me.itaratePart(partId,reourcesList);

            success(reourcesList);

        }
    }
    
    
    public void getCourseByLessonId(){
    	try {
			Integer id = getParaToInt("id");
			if (!StrUtil.checkParamIsNotNull(id)) {
				error("参数不能为空！");
				return;
			}
			Integer parentId = Coursepart.me.getParentIdbyId(id);
			if(parentId!=0){
				error("此ID非课程ID");
				return;
			}
			PartNode partNode = Coursepart.me.getPartNodeById(id);
			success(partNode);
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("未知错误");
    	
    }
    
    
   
    
    
    public void getIpByClass(){
    	try {
			Integer cid = getParaToInt("cid");
			if (!StrUtil.checkParamIsNotNull(cid)) {
				error("参数不能为空");
				return;
			}
			ClassInfo c = ClassInfo.me.getIpAndPortByCid(cid);
			success(c);
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("未知错误");
    }
    
    
    public void getCurrentLessonByCid(){
    	try {
			Integer cid = getParaToInt("cid");
			if (!StrUtil.checkParamIsNotNull(cid)) {
				error("参数不能为空");
				return;
			}
			ClassInfo ci = ClassInfo.me.findByIdLoadColumns(cid, "lesson_id");
			success(ci.getInt("lesson_id"));
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("未知错误");
    }
    
    
    public void getHomeTaskByLessonId(){
    	try {
			Integer lessonId = getParaToInt("lessonId");
			if (!StrUtil.checkParamIsNotNull(lessonId)) {
				error("参数不能为空");
				return;
			}
			Integer taskId = Coursepart.me.getTaskIdByLessonId(lessonId);
			success(taskId);
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("未知错误");
		
    }
   
    
    public void getStuResult(){
    	try {
			String partIdStrs = getPara("partIds");
			Integer sid = getParaToInt("sid");
			if (!StrUtil.checkParamIsNotNull(partIdStrs, sid)) {
				error("参数不能为空！");
				return;
			}
			String[] partIds = partIdStrs.split("_");
			List<StudentScore> stuScores = new ArrayList<StudentScore>();
			for (String partId : partIds) {
				StudentScore ss=StudentScore.me.getByStuIdAndPartId(sid,
						Integer.parseInt(partId));
				if(ss!=null)
					stuScores.add(ss);
			}
			success(stuScores);
		} catch (Exception e) {
			e.printStackTrace();
			error("未知错误");
		}
    }

    
    public void submitOrUpdateStuHomeworkAnswer(){
    	try {
			Integer id = getParaToInt("id");
			Integer sid = getParaToInt("sid");
			Integer hid = getParaToInt("hid");
			String answer = getPara("answer");
			if (!StrUtil.checkParamIsNotNull(answer)) {
				error("参数不能为空");
				return;
			}
			answer= answer.toUpperCase();
			if (StrUtil.checkParamIsNotNull(id)) {
				StuHomeworkAnswer stuha = new StuHomeworkAnswer(id, answer);
				if (stuha.update())
					success(stuha);
				else
					error("更新答案失败！");
			} else {
				if (!StrUtil.checkParamIsNotNull(sid, hid)) {
					error("参数不能为空");
					return;
				}
				StuHomeworkAnswer stuha = new StuHomeworkAnswer(sid, hid,
						answer);
				if (stuha.save())
					success(stuha);
				else
					error("提交答案失败！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			error("未知错误");
		}
    }
    
    
    public void getStuHomeworkAnswer(){
    	try {
			Integer sid = getParaToInt("sid");
			Integer hid = getParaToInt("hid");
			if (!StrUtil.checkParamIsNotNull(sid, hid)) {
				error("参数不能为空");
				return;
			}
			StuHomeworkAnswer stuha = StuHomeworkAnswer.me.getByHidandSid(sid,
					hid);
			success(stuha);
		} catch (Exception e) {
			e.printStackTrace();
			error("未知错误！");
		}
    }


}
