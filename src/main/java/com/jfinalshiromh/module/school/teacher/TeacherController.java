package com.jfinalshiromh.module.school.teacher;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.swing.plaf.basic.BasicScrollPaneUI.HSBChangeListener;

import com.jfinal.aop.Before;
import com.jfinal.kit.HashKit;
import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.interceptor.UserInterceptor;
import com.jfinalshiromh.module.school.classinfo.ClassInfo;
import com.jfinalshiromh.module.school.classinfo.ClassTeacher;
import com.jfinalshiromh.module.school.grade.Grade;
import com.jfinalshiromh.module.user.User;
import com.jfinalshiromh.module.valicode.Valicode;
import com.jfinalshiromh.utils.DateUtil;
import com.jfinalshiromh.utils.SMSHelper;
import com.jfinalshiromh.utils.StrUtil;
import com.jfinalshiromh.utils.ext.route.ControllerBind;


@Before(UserInterceptor.class)
@ControllerBind(controllerKey = "school/teacher", viewPath = "page/school/teacher")
public class TeacherController extends BaseController {

    public void index() {
    	User u = getUser();
        String name = getPara("name");
        setAttr("page", Teacher.me.pageBySchool(getParaToInt("p", 1), 10, name,u.getInt("school_id")));
        setAttr("gradeList", Grade.me.getAllBySchool(u.getInt("school_id")));
        render("index.ftl");
    }

    public void detail() {

        Integer id = getParaToInt("id");
        Teacher teacher = Teacher.me.getByTid(id);
        if(teacher!=null){
	        List<ClassTeacher> ct = ClassTeacher.me.getClassGradeInfoByTid(teacher.getInt("id")) ;
	        setAttr("ct", ct);
	        setAttr("teacher", teacher);
	        setAttr("tops", TeacherResult.me.topNByTeacherId(teacher.getInt("id")));
        }
        setAttr("gradeList", Grade.me.getAllBySchool(getUser().getInt("school_id")));
        render("detail.ftl");
    }


    public void add() {
    	User u = this.getSessionAttr(Constants.USER_SESSION);
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.POST)) {
            String phone = getPara("teacher.phone", "");
            
            if (StrUtil.isBlank(phone)) {
                error("手机号不能为空");
            } else if (!StrUtil.isMobile(phone)) {
                error("手机号格式不正确");
            } else {
                

                if (!User.me.checkUserIsExist(phone)) {
                    error("手机号已经存在，请确认手机号");
                } else {
                    
                    
                    String valicode = StrUtil.randomNumber(6);
                   
                    
                    String uuid = StrUtil.getUUID();
                    String token = StrUtil.getUUID();
                    String nickname = getPara("teacher.name", "");
                    Date date = new Date();
                    User user = new User();
                    user.set("id", uuid)
                            .set("nickname", StrUtil.noHtml(nickname).trim())
                            .set("password", HashKit.md5(valicode))
                            .set("in_time", date)
                            .set("phone", phone)

                            .set("token", token)
                            .set("avatar", "/static/school/img/teacher/pic2.png")
                            .set("type", Constants.USER_TYPE_TEACHER)
                            .set("school_id", u.getInt("school_id"));
                    try {
                        if (user.save()) {
                        	Teacher tea = getModel(Teacher.class);
                        	tea.set("school_id", u.getInt("school_id"));
                            if (tea.save()){
                            	 Valicode code = new Valicode();
                                 code.set("code", valicode)
                                         .set("type", Constants.INIT_PWD)
                                         .set("in_time", new Date())
                                         .set("status", 0)
                                         .set("expire_time", DateUtil.getMinuteAfter(new Date(), 1))
                                         .set("target", phone)
                                         .save();
                                 Integer tid = tea.getInt("id");
                                 String title = getPara("title");
                                 String content = getPara("content");
                                 Date startDate = getParaToDate("startDate");
                                 Date endDate = getParaToDate("endDate");
                                 
                                TeacherResult.me.save(tid, title, content, startDate, endDate);
                        		Integer [] cids = getParaValuesToInt("cid");
                        		if(cids!=null && cids.length>0){
                        			for(Integer cid : cids){
                        				ClassTeacher.me.addTeacher(tid, cid);
                        			}
                        		}
                                 
                                SMSHelper.messagePost(phone, SMSHelper.contentID_recive_password, valicode);
                                Map<String,Object> map = new HashMap<String, Object>();
                                map.put("info", "保存成功,初始密码已经下发至学生手机");
                                map.put("id", tid);
                                success(map);
                            }
                            else
                                error("教师保存失败");
                        } else {
                            error("教师保存失败");
                        }
                    }catch (Exception e){
                    	e.printStackTrace();
                        error("教师保存失败,所发验证码无效");
                    }

                }
            }
        }
    }

    public void edit() {
        try {
			String method = getRequest().getMethod();
			if (method.equalsIgnoreCase(Constants.POST)) {
				if (getModel(Teacher.class).update())
					success("保存成功");

			}
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        error("未知错误");
    }

    
    public void updateStates(){
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.POST)) {

            String state = getPara("state");
            String[] tids = getParaValues("tids[]");
            
            
            if(Teacher.me.updateStates(tids,state)){
                success("更新成功");
            }else{
                error("更新失败");
            }


        }
    }
    
    
    public void updateClass(){
    	try {
			String[] tids = getParaValues("tids[]");
			String[] cids = getParaValues("cids[]");
			System.out.println(tids);
			System.out.println(tids.length);
			if(tids==null || tids.length==0 || cids==null || cids.length==0){
				error("参数不能为空");
				return;
			}
			for (String cid : cids) {
				for (String tid : tids) {
					ClassTeacher.me.delTeacherAndClass(Integer.parseInt(tid),
							Integer.parseInt(cid));
					ClassTeacher.me.addTeacher(Integer.parseInt(tid),
							Integer.parseInt(cid));
				}
			}
			success();
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("位置错误");
    }
    
    public void delClassTeacherById(){
    	try {
			Integer id = getParaToInt("id");
			ClassTeacher.me.deleteById(id);
			success();
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("未知错误");
    }

    public void addClassTeacher(){
    	try {
			Integer tid = getParaToInt("tid");
			Integer cid = getParaToInt("cid");
			success(ClassTeacher.me.addTeacher(tid, cid));
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("未知错误");
    }
    
    public void updateTeacherResult(){
    	try {
			getModel(TeacherResult.class).update();
			success();
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("未知错误");
    	
    }
    
    public void addTeacherResult(){
    	try {
			TeacherResult tr = getModel(TeacherResult.class);
			tr.save();
			success(tr);
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("未知错误");
    }
}
