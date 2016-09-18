package com.jfinalshiromh.module.index;

import com.jfinal.kit.HashKit;
import com.jfinalshiromh.common.BaseController;

import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.module.system.SysConfig;
import com.jfinalshiromh.module.user.User;
import com.jfinalshiromh.module.valicode.Valicode;
import com.jfinalshiromh.utils.DateUtil;
import com.jfinalshiromh.utils.EmailSender;
import com.jfinalshiromh.utils.SMSHelper;
import com.jfinalshiromh.utils.StrUtil;
import com.jfinalshiromh.utils.ext.route.ControllerBind;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Date;


@ControllerBind(controllerKey = "/", viewPath = "page")
public class IndexController extends BaseController {
    private static Logger LOGGER = LoggerFactory.getLogger(IndexController.class);
    
    public void index() {

































        redirect("/school");
    }

    
    public void logout() {
        removeCookie(Constants.USER_COOKIE);
        removeSessionAttr(Constants.USER_SESSION);
        SecurityUtils.getSubject().logout();
        redirect("/");
    }

    
    public void adminlogin() {
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET)){
            render("front/adminlogin.ftl");
        } else if(method.equalsIgnoreCase(Constants.POST)){
            String username = getPara("username");
            String password = getPara("password");
            Subject subject = SecurityUtils.getSubject();
            UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken(username, password);
            try {
                subject.login(usernamePasswordToken);
                setSessionAttr(Constants.SESSION_ADMIN_USERNAME, username);
                redirect("/admin/index");
            } catch (AuthenticationException e) {
                LOGGER.error("登录失败:用户名或密码错误,"+e.getMessage());
                setAttr("error", "用户名或密码错误");
                render("front/adminlogin.ftl");
            }
        }
    }

    
    public void phonelogin() {
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET)) {
            render("front/user/phonelogin.ftl");
        } else if (method.equalsIgnoreCase(Constants.POST)) {
            String phone = getPara("phone");
            String password = getPara("password");
            String userType = getPara("user_type");
            if (StrUtil.isBlank(userType) ||StrUtil.isBlank(phone) || StrUtil.isBlank(password)) {
                error("手机号/密码/用户类型都不能为空");
            } else {
                User user = User.me.localPhoneLogin(phone, HashKit.md5(password),userType);
                if (user == null) {
                    error("手机号/密码/类型错误");
                } else {
                    setSessionAttr(Constants.USER_SESSION, user);
                    setCookie(Constants.USER_COOKIE, StrUtil.getEncryptionToken(user.getStr("token")), 30 * 24 * 60 * 60);
                    success();
                }
            }
        }
    }
    
    public void login() {
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET)) {
            render("front/user/login.ftl");
        } else if (method.equalsIgnoreCase(Constants.POST)) {
            String email = getPara("email");
            String password = getPara("password");
            if (StrUtil.isBlank(email) || StrUtil.isBlank(password)) {
                error("邮箱/密码都不能为空");
            } else {
                User user = User.me.localLogin(email, HashKit.md5(password));
                if (user == null) {
                    error("邮箱/密码错误");
                } else {
                    setSessionAttr(Constants.USER_SESSION, user);
                    setCookie(Constants.USER_COOKIE, StrUtil.getEncryptionToken(user.getStr("token")), 30 * 24 * 60 * 60);
                    success();
                }
            }
        }
    }

    
    public void phonereg() {
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET)) {
            String third = getPara("third");
            if (StrUtil.isBlank(third)) {
                removeSessionAttr("open_id");
                removeSessionAttr("thirdlogin_type");
                removeSessionAttr("unsave_user");
            }
            render("front/user/phonereg.ftl");
        } else if (method.equalsIgnoreCase(Constants.POST)) {
            String phone = getPara("reg_phone");
            String password = getPara("reg_password");
            String nickname = getPara("reg_nickname");
            String valicode = getPara("valicode");
            String open_id = (String) getSession().getAttribute("open_id");
            if (StrUtil.isBlank(phone) || StrUtil.isBlank(password) || StrUtil.isBlank(nickname) || StrUtil.isBlank(valicode)) {
                error("请完善注册信息");
            } else {
                if (!StrUtil.isMobile(phone)) {
                    error("请输入正确的手机号码");
                } else {
                    Valicode code = Valicode.me.findByCodeAndPhone(valicode, phone, Constants.REG);

                    if (code == null) {
                        error("验证码不存在或已使用(已过期)");
                    } else {
                        User user = User.me.findByPhone(phone);
                        if (user != null) {
                            error("手机号已经注册，请直接登录");
                        } else if (User.me.findByNickname(nickname) != null) {
                            error("昵称已经被注册，请更换其他昵称");
                        } else {
                            String uuid = StrUtil.getUUID();
                            String token = StrUtil.getUUID();
                            Date date = new Date();
                            if (StrUtil.isBlank(open_id)) {
                                user = new User();
                                user.set("id", uuid)
                                        .set("nickname", StrUtil.noHtml(nickname).trim())
                                        .set("password", HashKit.md5(password))
                                        .set("score", 0)
                                        .set("mission", date)
                                        .set("in_time", date)
                                        .set("phone", phone)
                                        .set("email", StrUtil.noHtml(nickname).trim()+"@null.null")
                                        .set("token", token)
                                        .set("avatar", "/static/img/default_avatar.png")
                                        .save();
                            } else {
                                user = getSessionAttr("unsave_user");
                                if (user == null) {
                                    user = new User();
                                    user.set("id", uuid)
                                            .set("nickname", StrUtil.noHtml(nickname).trim())
                                            .set("password", HashKit.md5(password))
                                            .set("score", 0)
                                            .set("mission", date)
                                            .set("in_time", date)
                                            .set("phone", phone)
                                            .set("email", StrUtil.noHtml(nickname).trim()+"@null.null")
                                            .set("token", token)
                                            .set("avatar", "/static/img/default_avatar.png")
                                            .save();
                                } else {
                                    user.set("nickname", StrUtil.noHtml(nickname).trim())
                                            .set("password", HashKit.md5(password))
                                            .set("mission", date)
                                            .set("phone", phone)
                                            .set("email", StrUtil.noHtml(nickname).trim()+"@null.null")
                                            .set("token", token)
                                            .set("in_time", date)
                                            .set("score", 0)
                                            .set("avatar", "/static/img/default_avatar.png")
                                            .save();
                                }
                                removeSessionAttr("unsave_user");
                                removeSessionAttr("open_id");
                                removeSessionAttr("thirdlogin_type");
                            }
                            setSessionAttr(Constants.USER_SESSION, user);
                            setCookie(Constants.USER_COOKIE, StrUtil.getEncryptionToken(user.getStr("token")), 30 * 24 * 60 * 60);
                            
                            code.set("status", 1).update();
                            success();
                        }
                    }
                }
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

                    SMSHelper.messagePost(phone,SMSHelper.contentID_find_password,valicode);

                    success();
                }
            } else if (type.equalsIgnoreCase(Constants.REG)) {
                User user = User.me.findByPhone(phone);
                if (user != null) {
                    error("手机号已经注册");
                } else {
                    Valicode code = new Valicode();
                    code.set("code", valicode)
                            .set("type", type)
                            .set("in_time", new Date())
                            .set("status", 0)
                            .set("expire_time", DateUtil.getMinuteAfter(new Date(), 1))
                            .set("target", phone)
                            .save();
                    SMSHelper.messagePost(phone,SMSHelper.contentID_register,valicode);
                    success();
                }
            }
        }
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
            render("front/user/reg.ftl");
        } else if (method.equalsIgnoreCase(Constants.POST)) {
            String email = getPara("reg_email");
            String password = getPara("reg_password");
            String nickname = getPara("reg_nickname");
            String valicode = getPara("valicode");
            String open_id = (String) getSession().getAttribute("open_id");
            if (StrUtil.isBlank(email) || StrUtil.isBlank(password) || StrUtil.isBlank(nickname) || StrUtil.isBlank(valicode)) {
                error("请完善注册信息");
            } else {
                if (!StrUtil.isEmail(email)) {
                    error("请输入正确的邮箱地址");
                } else {
                    Valicode code = Valicode.me.findByCodeAndEmail(valicode, email, Constants.REG);

                    if (code == null) {
                        error("验证码不存在或已使用(已过期)");
                    } else {
                        User user = User.me.findByEmail(email);
                        if (user != null) {
                            error("邮箱已经注册，请直接登录");
                        } else if (User.me.findByNickname(nickname) != null) {
                            error("昵称已经被注册，请更换其他昵称");
                        } else {
                            String uuid = StrUtil.getUUID();
                            String token = StrUtil.getUUID();
                            Date date = new Date();
                            if (StrUtil.isBlank(open_id)) {
                                user = new User();
                                user.set("id", uuid)
                                        .set("nickname", StrUtil.noHtml(nickname).trim())
                                        .set("password", HashKit.md5(password))
                                        .set("score", 0)
                                        .set("mission", date)
                                        .set("in_time", date)
                                        .set("email", email)
                                        .set("token", token)
                                        .set("avatar", "/static/img/default_avatar.png")
                                        .save();
                            } else {
                                user = getSessionAttr("unsave_user");
                                if (user == null) {
                                    user = new User();
                                    user.set("id", uuid)
                                            .set("nickname", StrUtil.noHtml(nickname).trim())
                                            .set("password", HashKit.md5(password))
                                            .set("score", 0)
                                            .set("mission", date)
                                            .set("in_time", date)
                                            .set("email", email)
                                            .set("token", token)
                                            .set("avatar", "/static/img/default_avatar.png")
                                            .save();
                                } else {
                                    user.set("nickname", StrUtil.noHtml(nickname).trim())
                                            .set("password", HashKit.md5(password))
                                            .set("mission", date)
                                            .set("email", email)
                                            .set("token", token)
                                            .set("in_time", date)
                                            .set("score", 0)
                                            .set("avatar", "/static/img/default_avatar.png")
                                            .save();
                                }
                                removeSessionAttr("unsave_user");
                                removeSessionAttr("open_id");
                                removeSessionAttr("thirdlogin_type");
                            }
                            setSessionAttr(Constants.USER_SESSION, user);
                            setCookie(Constants.USER_COOKIE, StrUtil.getEncryptionToken(user.getStr("token")), 30 * 24 * 60 * 60);
                            
                            code.set("status", 1).update();
                            success();
                        }
                    }
                }
            }
        }
    }

    
    public void sendValiCode() {
        String email = getPara("email");
        if (StrUtil.isBlank(email)) {
            error("邮箱不能为空");
        } else if (!StrUtil.isEmail(email)) {
            error("邮箱格式不正确");
        } else {
            String type = getPara("type");
            String valicode = StrUtil.randomString(6);
            String emailSender = SysConfig.me.findByKey("siteTitle");
            if(StrUtil.isBlank(emailSender)){
                emailSender = "eli P";
            }
            if (type.equalsIgnoreCase(Constants.FORGET_PWD)) {
                User user = User.me.findByEmail(email);
                if (user == null) {
                    error("该邮箱未被注册，请先注册");
                } else {
                    Valicode code = new Valicode();
                    code.set("code", valicode)
                            .set("type", type)
                            .set("in_time", new Date())
                            .set("status", 0)
                            .set("expire_time", DateUtil.getMinuteAfter(new Date(), 30))
                            .set("target", email)
                            .save();
                    StringBuffer mailBody = new StringBuffer();
                    mailBody.append("You retrieve the password verification code is: ")
                            .append(valicode)
                            .append("<br/>The code can only be used once, and only valid for 30 minutes.");
                    EmailSender.sendMail(emailSender + "－Forgot password codes",
                            new String[]{email}, mailBody.toString());
                    success();
                }
            } else if (type.equalsIgnoreCase(Constants.REG)) {
                User user = User.me.findByEmail(email);
                if (user != null) {
                    error("邮箱已经注册，请直接登录");
                } else {
                    Valicode code = new Valicode();
                    code.set("code", valicode)
                            .set("type", type)
                            .set("in_time", new Date())
                            .set("status", 0)
                            .set("expire_time", DateUtil.getMinuteAfter(new Date(), 30))
                            .set("target", email)
                            .save();
                    StringBuffer mailBody = new StringBuffer();
                    mailBody.append("Register your account verification code is: ")
                            .append(valicode)
                            .append("<br/>The code can only be used once, and only valid for 30 minutes.");
                    EmailSender.sendMail(emailSender + "－Registered Account codes", new String[]{email}, mailBody.toString());
                    success();
                }
            }
        }
    }

    
    public void phoneforgetpwd() {
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET)) {
            render("front/user/phoneforgetpwd.ftl");
        } else if (method.equalsIgnoreCase(Constants.POST)) {
            String phone = getPara("phone");
            String valicode = getPara("valicode");
            String newpwd = getPara("newpwd");
            if (StrUtil.isBlank(phone) || StrUtil.isBlank(valicode) || StrUtil.isBlank(newpwd)) {
                error("请完善信息");
            } else {
                Valicode code = Valicode.me.findByCodeAndPhone(valicode,phone,Constants.FORGET_PWD);
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



    
    public void apitest() {
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET)) {
            render("front/user/apitest.ftl");
        }
    }


    
    public void forgetpwd() {
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET)) {
            render("front/user/forgetpwd.ftl");
        } else if (method.equalsIgnoreCase(Constants.POST)) {
            String email = getPara("email");
            String valicode = getPara("valicode");
            String newpwd = getPara("newpwd");
            if (StrUtil.isBlank(email) || StrUtil.isBlank(valicode) || StrUtil.isBlank(newpwd)) {
                error("请完善信息");
            } else {
                Valicode code = Valicode.me.findByCodeAndEmail(valicode, email, Constants.FORGET_PWD);
                if (code == null) {
                    error("验证码不存在或已使用(已过期)");
                } else {
                    User user = User.me.findByEmail(email);
                    if (user == null) {
                        error("该邮箱未被注册，请先注册");
                    } else {
                        user.set("password", HashKit.md5(newpwd)).update();
                        code.set("status", 1).update();
                        success();
                    }
                }
            }
        }
    }

    public void upload() {

















    }





    public void service() {
        render("front/service.ftl");
    }


    public void testTreeView() {
        render("/static/bootstrap-treeview-master/index.ftl");
    }
}
