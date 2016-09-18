package com.jfinalshiromh.module.school;

import java.util.Date;
import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.kit.HashKit;
import com.jfinal.upload.UploadFile;
import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.interceptor.UserInterceptor;
import com.jfinalshiromh.module.school.suggest.Suggest;
import com.jfinalshiromh.module.user.User;
import com.jfinalshiromh.module.valicode.Valicode;
import com.jfinalshiromh.utils.ImageUtil;
import com.jfinalshiromh.utils.StrUtil;
import com.jfinalshiromh.utils.ext.route.ControllerBind;


@ControllerBind(controllerKey = "school/user",viewPath = "page/school/user")
public class SchoolUserController extends BaseController {
    public void index() {
        String id = getPara(0);
        User user = User.me.findById(id);
        if (user != null) {
            setAttr("current_user", user);
            render("index.ftl");
        } else {
            renderText(Constants.OP_ERROR_MESSAGE);
        }
    }
    @Before(UserInterceptor.class)
    public void setting() throws InterruptedException {
    	List<Suggest> s = Suggest.me.getAllBySchool(getUser().getInt("school_id"));
    	setAttr("s", s);
        render("setting.ftl");
    }

    @Before(UserInterceptor.class)
    public void uploadAvatar() throws Exception {

        UploadFile uploadFile = getFile("avatar", Constants.UPLOAD_DIR_AVATAR);
        String path = Constants.UPLOAD_DIR_ROOT + Constants.UPLOAD_DIR_AVATAR + "/" + uploadFile.getFileName();
        User user = (User) getSession().getAttribute(Constants.USER_SESSION);
        user.set("avatar", path).update();
        
        String realPath = Constants.UPLOAD_DIR + "/avatar/" + uploadFile.getFileName();
        ImageUtil.zoomImage(realPath, realPath, 100, 100);
        redirect("/school/user/setting");
    }


    public void changePassword(){
        String method = getRequest().getMethod();
       if (method.equalsIgnoreCase(Constants.POST)) {
            User user = getSessionAttr(Constants.USER_SESSION);
           String new_password = getPara("new_password");
           String new_password2 = getPara("new_password2");
           if(!StrUtil.checkParamIsNotNull(new_password,new_password2)){
        	   error("参数不能为空！");
        	   return;
           }
           if(!new_password.equals(new_password2)){
        	   error("两次密码不一致");
        	   return;
           }
            User.me.updatePassword(user.getStr("phone"), new_password);
            setAttr("firstLogin", "");
            success();
        }else {
           error("请求方法不正确");
       }
    }
    
    public void editPassword(){
       try {
			String method = getRequest().getMethod();
			if (method.equalsIgnoreCase(Constants.POST)) {
				User user = getSessionAttr(Constants.USER_SESSION);
	
				String password = getPara("password");
				String new_password = getPara("new_password");
				String new_password2 = getPara("new_password2");
				String nickname = getPara("nickname");
				if (!StrUtil.checkParamIsNotNull(password, new_password,
						new_password2, nickname)) {
					error("参数不能为空！");
					return;
				}
				if (!new_password.equals(new_password2)) {
					error("两次密码不一致");
					return;
				}
				if (User.me.schoolPhoneLogin(user.getStr("phone"), HashKit.md5(password)) == null) {
					error("原密码不正确！");
					return;
				}
				User.me.updatePasswordAndName(user.getStr("phone"), new_password,
						nickname);
				user.set("nickname", nickname);
				success();
			} else {
				error("请求方法不正确");
			}
		} catch (Exception e) {
			e.printStackTrace();
			error("未知错误");
		}
    }
    @Before(UserInterceptor.class)
    public void addSuggest(){
    	try {
			Suggest s = getModel(Suggest.class);
			s.set("school_id", getUser().getInt("school_id"));
			s.set("create_time", new Date());
			s.save();
			success(s);
		} catch (Exception e) {
			e.printStackTrace();
			error("未知错误");
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
                    	setSessionAttr("school-phone", phone);
                        success("验证码通过");
                    }
                }
            }
        } else {
            error("请求方式不对，请使用POST");
        }
    }
    public void resetPass(){
		String phone = getSessionAttr("school-phone");
		System.out.println(phone);
		if(phone!=null)
			render("confirm.ftl");
		else{
			redirect("/school/login");
		}
	}
    public void changePass(){
		String pass = getPara("pass");
		String pass2 = getPara("pass2");
		if(!StrUtil.checkParamIsNotNull(pass,pass2)){
			error("密码不能为空");
			return;
		}
		if(!pass.equals(pass2)){
			error("两次密码不一致");
			return;
		}
		String phone = getSessionAttr("school-phone");
		if(phone!=null){
			User user = User.me.findByPhone(phone);
            if (user == null) {
                error("该手机号未被注册，请先注册");
            } else {
                user.set("password", HashKit.md5(pass)).update();
                removeSessionAttr("school-phone");
                success("success");
            }
		}else{
			error("手机号码不存在");
			removeSessionAttr("school-phone");
		}
	}
}
