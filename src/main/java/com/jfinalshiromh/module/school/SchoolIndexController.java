package com.jfinalshiromh.module.school;

import java.util.Date;

import org.apache.shiro.SecurityUtils;

import com.jfinal.aop.Before;
import com.jfinal.kit.HashKit;
import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.interceptor.UserInterceptor;
import com.jfinalshiromh.module.notification.Notification;
import com.jfinalshiromh.module.school.detail.SchoolDetail;
import com.jfinalshiromh.module.school.piano.Piano;
import com.jfinalshiromh.module.school.piano.malfunction.PianoMalfunction;
import com.jfinalshiromh.module.user.User;
import com.jfinalshiromh.module.valicode.Valicode;
import com.jfinalshiromh.utils.DateUtil;
import com.jfinalshiromh.utils.SMSHelper;
import com.jfinalshiromh.utils.StrUtil;
import com.jfinalshiromh.utils.ext.route.ControllerBind;


@ControllerBind(controllerKey = "/school", viewPath = "page/school")
public class SchoolIndexController extends BaseController {
    
    @Before(UserInterceptor.class)
    public void index() {
    	User u = getUser();
    	Integer schoolId = u.getInt("school_id");
    	School school = School.me.getDateAndDayById(schoolId);
		if(!School.me.checkSchoolIsTimeout(school.getDate("start_time"), school.getInt("validity_day"))){
			removeAttr(Constants.USER_SESSION);
			removeCookie(Constants.USER_COOKIE);
			setAttr("error", "本校时限已到，已关闭登陆功能！");
			render("user/login.ftl");
			return;
		}
    	setAttr("notifys", Notification.me.getTop(8, schoolId));
    	setAttr("pianoMals", PianoMalfunction.me.getTop(3,schoolId));
	    	if("1".equals(u.getStr("first_login"))){
	    	setAttr("firstLogin", "1");
	    	User.me.updateFirst(u.getStr("phone"));
	    	u.set("first_login", "2");
    	}
    }

    
    public void logout() {
        removeCookie(Constants.USER_COOKIE);
        removeSessionAttr(Constants.USER_SESSION);
        SecurityUtils.getSubject().logout();
        render("user/login.ftl");
    }

    
    public void reg() {
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET)) {
            String third = getPara("third");
            if (StrUtil.isBlank(third)) {
                removeSessionAttr("open_id");
                removeSessionAttr("thirdlogin_type");
                removeSessionAttr("unsave_user");
            }
            render("user/reg.ftl");
        }
    }

    
    public void login() {
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET)) {
            String third = getPara("third");
            if (StrUtil.isBlank(third)) {
                removeSessionAttr("open_id");
                removeSessionAttr("thirdlogin_type");
                removeSessionAttr("unsave_user");
            }
            render("user/login.ftl");
        } else if (method.equalsIgnoreCase(Constants.POST)) {
            String phone = getPara("phone");
            String password = getPara("password");
            User user = User.me.schoolPhoneLogin(phone, HashKit.md5(password));
            if (user == null) {
            	setAttr("phone", phone);
                setAttr("error", "用户名或密码错误");
                render("user/login.ftl");
            } else {
            	
            	
                setSessionAttr(Constants.USER_SESSION, user);
                setCookie(Constants.USER_COOKIE, StrUtil.getEncryptionToken(user.getStr("token")), 30 * 24 * 60 * 60);
                redirect("index");
            }

        }
    }

        

    public void sendSMSValiCode() {
        String phone = getPara("phone");
        if (StrUtil.isBlank(phone)) {
            error("手机号不能为空");
        } else if (!StrUtil.isMobile(phone)) {
            error("手机格式不正确");
        } else {
            String type = getPara("type");
            String valicode = StrUtil.randomString(6);

            if (type.equalsIgnoreCase(Constants.FORGET_PWD)) {
                User user = User.me.findByPhone(phone);
                if (user == null) {
                    error("该手机号未被注册，请先注册");
                } else {
                    Valicode code = new Valicode();
                    code.set("code", valicode)
                            .set("type", type)
                            .set("in_time", new Date())
                            .set("status", 0)
                            .set("expire_time", DateUtil.getMinuteAfter(new Date(), 1))
                            .set("target", phone)
                            .save();

                    SMSHelper.messagePost(phone, SMSHelper.contentID_find_password, valicode);

                    success();
                }
            } else if (type.equalsIgnoreCase(Constants.REG)) {
                User user = User.me.findByPhone(phone);
                if (user != null) {
                    error("手机号已经注册，请直接登录");
                } else {
                    Valicode code = new Valicode();
                    code.set("code", valicode)
                            .set("type", type)
                            .set("in_time", new Date())
                            .set("status", 0)
                            .set("expire_time", DateUtil.getMinuteAfter(new Date(), 1))
                            .set("target", phone)
                            .save();
                    SMSHelper.messagePost(phone, SMSHelper.contentID_register, valicode);
                    success();
                }
            }
        }
    }

    
    public void forgetpwd() {
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET)) {
            render("user/forgetpwd.ftl");
        } else if (method.equalsIgnoreCase(Constants.POST)) {
            String phone = getPara("phone");
            String valicode = getPara("valicode");
            String newpwd = getPara("newpwd");
            if (StrUtil.isBlank(phone) || StrUtil.isBlank(valicode) || StrUtil.isBlank(newpwd)) {
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
                        user.set("password", HashKit.md5(newpwd)).update();
                        code.set("status", 1).update();
                        success();
                    }
                }
            }
        }
    }
    @Before(UserInterceptor.class)
    public void notification(){
    	setAttr("notify", Notification.me.pageBySchool(getParaToInt("p",1), 10, getUser().getInt("school_id")));
    	render("notify/index.ftl");
    }
    
    public void updateNotifyRead(){
    	try {
			Integer id = getParaToInt("id");
			if (!StrUtil.checkParamIsNotNull(id)) {
				error("id不能为空！");
				return;
			}
			Notification.me.updateRead(id);
			success();
		} catch (Exception e) {
			e.printStackTrace();
			error("未知错误！");
		}
    	
    }
    @Before(UserInterceptor.class)
    public void share(){
    	SchoolDetail school = SchoolDetail.me.findById(getUser().getInt("school_id"));
    	setAttr("school", school);
    	render("user/share.ftl");
    }
}
