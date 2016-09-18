package com.jfinalshiromh.module.school.student;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.jfinal.aop.Before;
import com.jfinal.kit.HashKit;
import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.interceptor.UserInterceptor;
import com.jfinalshiromh.module.school.grade.Grade;
import com.jfinalshiromh.module.user.User;
import com.jfinalshiromh.module.valicode.Valicode;
import com.jfinalshiromh.utils.DateUtil;
import com.jfinalshiromh.utils.SMSHelper;
import com.jfinalshiromh.utils.StrUtil;
import com.jfinalshiromh.utils.ext.route.ControllerBind;


@Before(UserInterceptor.class)
@ControllerBind(controllerKey = "school/student", viewPath = "page/school/student")
public class StudentController extends BaseController {
    public void index() {
    	User u = getUser();
        int gradeId = getParaToInt("grade_id", -1);
        int classId = getParaToInt("class_id", -1);
        String name = getPara("name","");
        if (gradeId != -1)
            setAttr("page", Student.me.pageByGid(getParaToInt("p", 1), 10, gradeId));
        else if(!"".equals(name)) {
        	setAttr("page", Student.me.pageBySchoolAndName(getParaToInt("p", 1), 10, name,u.getInt("school_id")));
        }else if(classId!=-1){
        	setAttr("page", Student.me.pageByCid(getParaToInt("p", 1), 10, classId));
        }else{
        	setAttr("page", Student.me.pageBySchool(getParaToInt("p", 1), 10,u.getInt("school_id")));
        }
        setAttr("showTitle", getPara("showTitle","全部学生"));
        
        setAttr("gradeList", Grade.me.getAllBySchool(u.getInt("school_id")));
        setAttr("grade_id", gradeId);
        setAttr("class_id", classId);
        render("index.ftl");
    }

    public void add() {




    	User u = this.getSessionAttr(Constants.USER_SESSION);
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.POST)) {

            String phone = getPara("student.phone", "");

            

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
                    String nickname = getPara("student.name", "");
                    Date date = new Date();
                    User user = new User();
                    user.set("id", uuid)
                            .set("nickname", StrUtil.noHtml(nickname).trim())
                            .set("password", HashKit.md5(valicode))
                            .set("in_time", date)
                            .set("phone", phone)

                            .set("token", token)
                            .set("avatar", "/static/img/default_avatar.png")
                            .set("type", Constants.USER_TYPE_STUDENT)
                            .set("school_id", u.getInt("school_id"));
                    if (user.save()) {
                    	Student stu = getModel(Student.class);
                    	stu.set("school_id", u.getInt("school_id"));
                        if (stu.save()){
                             Valicode code = new Valicode();
                             code.set("code", valicode)
                                     .set("type", Constants.INIT_PWD)
                                     .set("in_time", new Date())
                                     .set("status", 0)
                                     .set("expire_time", DateUtil.getMinuteAfter(new Date(), 1))
                                     .set("target", phone)
                                     .save();

                             
                             SMSHelper.messagePost(phone, SMSHelper.contentID_recive_password, valicode);
                             Map<String,Object> map = new HashMap<String, Object>();
                             map.put("info", "保存成功,初始密码已经下发至学生手机");
                             map.put("id", stu.getInt("id"));
                            success(map);
                        }
                        else
                            error("学生保存失败");
                    } else {
                        error("学生保存失败");
                    }

                }
            }
        }
    }

    public void detail() {
    	
        String method = getRequest().getMethod();
        Integer id = getParaToInt("id");
        if (method.equalsIgnoreCase(Constants.GET)) {
        	User u =  getUser();
            Student student = Student.me.getStuInfoById(id);
            setAttr("student", student);
            setAttr("gradeList", Grade.me.getAllBySchool(u.getInt("school_id")));
            render("detail.ftl");
        } else if (method.equalsIgnoreCase(Constants.POST)) {
            getModel(Student.class).update();
        }

    }

    public void edit() {
	    try {
			if (getModel(Student.class).update()) {
				String name = getPara("student.name");
				String phone = Student.me.getPhoneById(getParaToInt("student.id"));
				User.me.updateNameByPhone(phone, name);
				success("成功");
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	    error("修改失败");
	    
    }
    public void editParentName() {
    	try {
			String phone = getPara("phone");
			Integer stuId = getParaToInt("stuId");
			String parentName = getPara("parentName");
			String parentType = getPara("parentType");
			if (!StrUtil.checkParamIsNotNull(phone, stuId, parentName,
					parentType)) {
				error("参数不能为空！");
				return;
			}
			String oldPhone = Student.me.getPhoneById(stuId);
			if (!oldPhone.equals(phone)) {
				if (!User.me.checkUserIsExist(phone)) {
					error("此号码已存在！");
					return;
				}
			}
			Student.me.updatePhoneAndParent(stuId, phone, parentType,
					parentName);
			User.me.updatePhoneByPhone(phone, oldPhone);
			success();
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("未知错误");
    }

    
    public void pageByClass() {
        int classId = getParaToInt("classId");

        setAttr("page", Student.me.pageByCid(getParaToInt("p", 1), defaultPageSize(), classId));
        setAttr("showTitle", getPara("showTitle"));
        
        setAttr("gradeList",  Grade.me.getAllBySchool(getUser().getInt("school_id")));
        render("index.ftl");
    }


    
    public void updateStates() {
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.POST)) {

            String state = getPara("state");
            String[] sids = getParaValues("sids[]");
            
            if (Student.me.updateStates(sids, state)) {
                success("更新成功");
            } else {
                error("更新失败");
            }
        }
    }
    
    
    public void updateClass(){
        try {
			Integer cid = getParaToInt("cid");
			Integer[] sids = getParaValuesToInt("sids[]");
			if (!StrUtil.checkParamIsNotNull(cid) || sids == null
					|| sids.length == 0) {
				error("参数不能为空");
				return;
			}
			for (Integer sid : sids) {
				Student.me.updateStuClass(sid, cid);
			}
			success();
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
        error("未知错误");
    }
}
