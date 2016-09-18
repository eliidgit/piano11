package com.jfinalshiromh.module.parents;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.jfinal.aop.Before;
import com.jfinal.kit.HashKit;
import com.jfinal.kit.PathKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.common.WeiXinTicket;
import com.jfinalshiromh.common.WeiXinToken;
import com.jfinalshiromh.interceptor.UserInterceptor;
import com.jfinalshiromh.module.course.coursepart.Coursepart;
import com.jfinalshiromh.module.homework.Homework;
import com.jfinalshiromh.module.school.classinfo.ClassInfo;
import com.jfinalshiromh.module.school.student.Student;
import com.jfinalshiromh.module.school.student.homeworkanswer.StuHomeworkAnswer;
import com.jfinalshiromh.module.school.student.score.StudentScore;
import com.jfinalshiromh.module.user.User;
import com.jfinalshiromh.module.valicode.Valicode;
import com.jfinalshiromh.utils.StrUtil;
import com.jfinalshiromh.utils.WeiXinUtil;
import com.jfinalshiromh.utils.ext.route.ControllerBind;

@ControllerBind(controllerKey="/parents",viewPath="/page/parents")
public class ParentController extends BaseController {
	@Before(UserInterceptor.class)
	public void index(){
		
		User user = (User) this.getSession().getAttribute(Constants.USER_SESSION);
		if(!"1".equals(user.getStr("type"))){
			redirect("/parents/login");
			return;
		}
		Student stu = Student.me.getStudentByPhone(user.getStr("phone"));
		setSessionAttr("stu", stu);
		Integer stuClassId = stu.getInt("class_id");
		if(stuClassId==null){
			removeSessionAttr(Constants.USER_SESSION);
			removeCookie(Constants.USER_COOKIE);
			redirect("/parents/login");
			return;
		}
		Object [] cgName = ClassInfo.me.getGradeAndClassNameById(stuClassId);
		setAttr("sGrade", cgName[0]);
		setAttr("sClass", cgName[1]);
		setAttr("stu", stu);
		
		
		
		Integer courseId=(Integer) cgName[2];
		setAttr("courseId", courseId);
		ClassInfo ci = ClassInfo.me.findById(stuClassId);
		Integer lessonId=ci.getInt("lesson_id");
		setAttr("lessonId", lessonId);
		
		Coursepart prevCP = Coursepart.me.getPrevByIdAndGrade(lessonId, courseId);
		Coursepart nextCP = Coursepart.me.getNextByIdAndGrade(lessonId, courseId);
		Integer sid = user.getInt("sid");
		StudentScore score=StudentScore.me.getByPhoneAndPId(sid, lessonId);
		StudentScore prevScore=null;
		if(prevCP!=null){
			prevScore=StudentScore.me.getByPhoneAndPId(sid, prevCP.getInt("id"));
		}
		setAttr("prevScore", prevScore);
		setAttr("score", score);
		setAttr("nextCP", nextCP);
		StudentScore prevTask = null;
		if(prevCP!=null){
			prevTask = StudentScore.me.getZuoYeByPartIdAndPhone(sid, prevCP.getInt("id"));
		}
		StudentScore task = StudentScore.me.getZuoYeByPartIdAndPhone(sid, lessonId);
		
		setAttr("prevTask", prevTask);
		setAttr("task", task);
		
		render("index.ftl");
	}
	
	public void login(){
		User user = (User) this.getSession().getAttribute(Constants.USER_SESSION);
		if(user!=null){
			if("1".equals(user.getStr("type"))){
				redirect("/parents/index");
				return;
			}else{
				removeSessionAttr(Constants.USER_SESSION);
				removeCookie(Constants.USER_COOKIE);
			}
		}
		render("html/login.ftl");
	}
	public void loginI(){
		if("1".equals(getPara("type"))){
			removeSessionAttr(Constants.USER_SESSION);
			removeCookie(Constants.USER_COOKIE);
		}
		User user = (User) this.getSession().getAttribute(Constants.USER_SESSION);
		if(user!=null){
			if("1".equals(user.getStr("type"))){
				redirect("/parents/center");
				return;
			}else{
				removeSessionAttr(Constants.USER_SESSION);
				removeCookie(Constants.USER_COOKIE);
			}
		}
		render("html/loginI.ftl");
	}
	
	public void findPass(){
		render("html/find.ftl");
	}
	
	public void resetPassHtml(){
		String phone = getSessionAttr("phone");
		if(phone!=null)
			render("html/reset.ftl");
		else{
			redirect("/parents/login");
		}
	}
	@Before(UserInterceptor.class)
	public void changeAddrHtml(){
		User user = getSessionAttr(Constants.USER_SESSION);
		Student student = Student.me.findFirst("select address from jf_tb_student where phone = ? ", user.getStr("phone"));
		setAttr("address", student.getStr("address"));
		render("html/change_add.ftl");
	}
	
	public void changeAddr(){
		User user = getSessionAttr(Constants.USER_SESSION);
		if(user==null){
			error("请先登录");
			return;
		}
		String addr = getPara("addr");
		if(StrUtil.isBlank(addr)){
			 error("请完善注册信息");
			 return;
		}
		System.out.println(addr);
		
		if(Db.update("update jf_tb_student set address=? where phone=?", addr,user.getStr("phone"))>0){
			success();
		}else{
			 error("修改地址失败");
		}
		
	}
	@Before(UserInterceptor.class)
	public void changePassHtml(){
		render("html/chang_pwd.ftl");
	}
	
	@Before(UserInterceptor.class)
	public void changePass(){
		User user = getSessionAttr(Constants.USER_SESSION);
		if(user==null){
			error("请先登录");
			return;
		}
		String pass = getPara("pass");
		String newPass=getPara("newPass");
		if (StrUtil.isBlank(pass) || StrUtil.isBlank(newPass)) {
            error("请完善注册信息");
            return;
        }
		user = User.me.findById(user.getStr("id"));
		if(!user.getStr("password").equalsIgnoreCase(HashKit.md5(pass))){
			error("密码不正确");
            return;
		}
		user.set("password", HashKit.md5(newPass)).update();
		removeSessionAttr(Constants.USER_SESSION);
		removeCookie(Constants.USER_COOKIE);
		success();
	}
	@Before(UserInterceptor.class)
	public void changePhoneHtml(){
		render("html/change_phone.ftl");
	}
	public void bindPhone(){
		User user = getSessionAttr(Constants.USER_SESSION);
		if(user==null){
			error("请先登录");
			return;
		}
		String phone = user.getStr("phone");
		String pass = getPara("pass");
		String newPhone = getPara("newPhone");
		String code = getPara("code");
		if (StrUtil.isBlank(pass) || StrUtil.isBlank(newPhone) || StrUtil.isBlank(code)) {
            error("请完善注册信息");
            return;
        }
		User u = User.me.localPhoneLogin(phone, HashKit.md5(pass), "1");
		if(u==null){
			error("密码不正确，请重新输入");
			return;
		}
		if(Valicode.me.findByCodeAndPhone(code,newPhone,"reg")==null){
			error("验证码不正确");
			return;
		}
		
		Db.update("update jf_tb_user set phone=? where phone=?", newPhone,phone);
		Db.update("update jf_tb_student set phone=? where phone=?", newPhone,phone);
		removeSessionAttr(Constants.USER_SESSION);
		removeCookie(Constants.USER_COOKIE);
		success();
		
	}
	
	public void resetPass(){
		String pass = getPara("pass");
		String phone = getSessionAttr("phone");
		if(phone!=null){
			User user = User.me.findByPhone(phone);
            if (user == null) {
                error("该手机号未被注册，请先注册");
            } else {
                user.set("password", HashKit.md5(pass)).update();
                removeSessionAttr("phone");
                removeSessionAttr(Constants.USER_SESSION);
        		removeCookie(Constants.USER_COOKIE);
                success("success");
            }
		}else{
			error("手机号码不存在");
			removeSessionAttr("phone");
		}
	}
	
	public void isVelicodeRight() {
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.POST)) {
            String phone = getPara("phone");
            String valicode = getPara("valicode");
            if (StrUtil.isBlank(phone) || StrUtil.isBlank(valicode)) {
                error("请完善信息");
            } else {
                Valicode code = Valicode.me.findByCodeAndPhone(valicode, phone, Constants.FORGET_PWD);
                if (code == null) {
                    error("验证码不存在或已使用(已过期)");
                } else {
                    User user = User.me.findByPhone(phone);
                    if (user == null) {
                        error("该手机号未被注册，请先注册");
                    } else {
                    	setSessionAttr("phone", phone);
                        success("验证码通过");
                    }
                }
            }
        } else {
            error("请求方式不对，请使用POST");
        }
    }
	@Before(UserInterceptor.class)
	public void showLessonInfo(){
		User user = getSessionAttr(Constants.USER_SESSION);
		Integer sid = user.getInt("sid");
		String phone = user.getStr("phone");
		Integer courseId=getParaToInt("courseId");
		Integer lessonId=getParaToInt("lessonId");
		List<Map<String,Object>> ls = new ArrayList<Map<String,Object>>();
		List<StudentScore> lessons= StudentScore.me.getAllLessonByStu(courseId, lessonId,sid);
		Map<String,Object> lesson =null;
		for(StudentScore item : lessons){
			List<StudentScore> lessonUnits = StudentScore.me.getAllLessonUnitByStuAndLessonId(item.getInt("part_id"), courseId, sid);
			lesson = new HashMap<String, Object>();
			lesson.put("lesson", item);
			lesson.put("lessonUnits", lessonUnits);
			ls.add(lesson);
		}
		setAttr("lessons", ls);
		render("html/lesson_info.ftl");
	}
	
	@Before(UserInterceptor.class)
	public void center(){
		User user = getSessionAttr(Constants.USER_SESSION);
		Student student = Student.me.getStudentByPhone(user.getStr("phone"));
		setAttr("stu", student);
		render("html/my.ftl");
	}
	@Before(UserInterceptor.class)
	public void stuTaskH(){
		User user = getSessionAttr(Constants.USER_SESSION);
		Integer sid = user.getInt("sid");
		Integer courseId=getParaToInt("courseId");
		Integer lessonId=getParaToInt("lessonId");
		List<Map<String,Object>> ls = new ArrayList<Map<String,Object>>();
		List<StudentScore> tasks= StudentScore.me.getAllTaskByStu(courseId, lessonId,sid);
		Map<String,Object> map = null;
		for(StudentScore item : tasks){
			map = new HashMap<String, Object>();
			map.put("part_id", item.getInt("part_id"));
			map.put("score", item.getInt("score"));
			map.put("comment", item.getStr("comments"));
			map.put("name", Coursepart.me.getNameById(item.getInt("parentId")));
			map.put("task", StudentScore.me.getTasksByLessonId(item.getInt("part_id"), sid));
			ls.add(map);
		}
		
		Coursepart nextCP = Coursepart.me.getNextByIdAndGrade(lessonId, courseId);
		Integer taskId = Coursepart.me.getTaskIdByLessonId(nextCP.getInt("id"));
		List<Coursepart> nextTasks = Coursepart.me.getChildsById(taskId);
		setAttr("nextCP", nextCP);
		setAttr("nextTasks", nextTasks);
		setAttr("tasks", ls);
		
		
		render("html/job.ftl");
	}
	@Before(UserInterceptor.class)
	public void stuNewTaskDetail(){
		Integer pid = getParaToInt("pid");
		List<Homework> homeworks = Homework.me.getAllByPartId(pid);
		setAttr("homeworks", homeworks);
		render("html/job_detail_new.ftl");
	}
	@Before(UserInterceptor.class)
	public void stuTaskDetail(){
		User user = getSessionAttr(Constants.USER_SESSION);
		Integer sid = user.getInt("sid");
		String phone = user.getStr("phone");
		Integer pid = getParaToInt("pid");
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> map = null;
		List<StudentScore> tasks =  StudentScore.me.getTasksByLessonId(pid, sid);
		for(int i=0;i<tasks.size();i++){
			map = new HashMap<String, Object>();
			map.put("task", tasks.get(i));
			if(i==0){
				List<Map<String,Object>> hws = new ArrayList<Map<String,Object>>();
				Map<String,Object> hw = null;
				List<Homework> homeworks = Homework.me.getAllByPartId(tasks.get(i).getInt("part_id"));
				for(Homework homework :homeworks){
					hw = new HashMap<String, Object>();
					String answer = StuHomeworkAnswer.me.getAnswerByHomeworkAndStu(sid, homework.getInt("id"));
					hw.put("right_answer", answer);
					hw.put("content", homework.getStr("content"));
					hw.put("answer_a", homework.getStr("answer_a"));
					hw.put("answer_b", homework.getStr("answer_b"));
					hw.put("answer_c", homework.getStr("answer_c"));
					hw.put("answer_d", homework.getStr("answer_d"));
					hw.put("answer", homework.getStr("answer"));
					hw.put("answer_type", homework.getStr("answer_type"));
					hws.add(hw);
				}
				
				map.put("xzt", hws);
			}
			list.add(map);
		}
		setAttr("tasks", list);
		render("html/job_detail.ftl");
	}
	
	
	
	public void shareH(){
		render("html/share.ftl");	
	}
	
	public void getSignInfo(){
		String url = getPara("url");
		WeiXinTicket w = WeiXinTicket.getWXTicket();
		Map<String, String> map = WeiXinUtil.sign(w.getTicket(), url);
		map.put("appId", WeiXinUtil.APP_ID);
		
		renderText(new Gson().toJson(map));
	}
	
	public void saveImg()throws Exception{
		User user = getSessionAttr(Constants.USER_SESSION);
		String mediaId=getPara("mediaId");
		String urlStr ="http://file.api.weixin.qq.com/cgi-bin/media/get?access_token=ACCESS_TOKEN&media_id=MEDIA_ID";
		URL url = new URL(urlStr.replace("ACCESS_TOKEN", WeiXinToken.getWXToken().getToken()).replace("MEDIA_ID", mediaId));  
        URLConnection con = url.openConnection(); 
		InputStream inputStream = con.getInputStream();
		String picUrl=Constants.UPLOAD_DIR_ROOT+Constants.UPLOAD_DIR_AVATAR+"/"+new Date().getTime()+".jpg";
		OutputStream outputStream = new FileOutputStream(PathKit.getWebRootPath()+picUrl);
		int bytesWritten = 0;
		int byteCount = 0;
		byte[] bytes = new byte[1024*2];
		while ((byteCount = inputStream.read(bytes)) != -1) {
			outputStream.write(bytes, bytesWritten, byteCount);
		}
		inputStream.close();
		outputStream.close();
		User.me.updatePicUrlByPhone(picUrl, user.getStr("phone"));
		User u = getUser();
		if(u!=null){
			u.set("avatar", picUrl);
		}
		renderText("true");
	}
	public void intro(){
		render("html/angle_introduce.ftl");
	}
	
}
