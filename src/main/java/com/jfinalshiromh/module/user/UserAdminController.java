package com.jfinalshiromh.module.user;

import com.jfinal.kit.HashKit;
import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.module.school.School;
import com.jfinalshiromh.module.school.student.Student;
import com.jfinalshiromh.module.valicode.Valicode;
import com.jfinalshiromh.utils.DateUtil;
import com.jfinalshiromh.utils.SMSHelper;
import com.jfinalshiromh.utils.StrUtil;
import com.jfinalshiromh.utils.ext.route.ControllerBind;

import org.apache.shiro.authz.annotation.RequiresPermissions;

import java.util.Date;
import java.util.List;


@ControllerBind(controllerKey = "/admin/user", viewPath = "page/admin/user")
public class UserAdminController extends BaseController {

    @RequiresPermissions("menu:user")
    public void index() {
        String nickname = getPara("nickname");
        Integer schoolId=getParaToInt("schoolId");
        String email = getPara("email");
        String type = getPara("type","");
        setAttr("page", User.me.page(getParaToInt("p", 1), defaultPageSize(), nickname, email,type,schoolId));
        setAttr("nickname", nickname);
        setAttr("email", email);
        setAttr("type", type);
        setAttr("schoolId", schoolId);

        render("index.ftl");
    }

    @RequiresPermissions("user:disabled")
    public void disabled() {
        
    }

    @RequiresPermissions("user:delete")
    public void delete() {
        String userId = getPara("user_id");

        if(User.me.deleteById(userId))
            success();
        else
            error("数据库删除失败");

    }

    public void detail(){
        String id = getPara(0);
        User user = User.me.findById(id);
        if (user != null) {
            setAttr("user", user);
            render("detail.ftl");
        } else {
            renderText(Constants.OP_ERROR_MESSAGE);
        }
    }

    
    public void addSchoolUser(){

        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET)){
        	List<School> schools = School.me.getAll();
        	setAttr("schools", schools);
        }else  if (method.equalsIgnoreCase(Constants.POST)) {

            String phone = getPara("phone", "");

            

            if (StrUtil.isBlank(phone)) {
                error("手机号不能为空");
            } else if (!StrUtil.isMobile(phone)) {
                error("手机号格式不正确");
            } else {
                
                User school = User.me.findByPhone(phone);
                if (school != null) {
                    error("手机号已经存在，请确认手机号");
                } else {
                    
                    
                    String valicode = StrUtil.randomNumber(6);
                    Valicode code = new Valicode();
                    code.set("code", valicode)
                            .set("type", Constants.INIT_PWD)
                            .set("in_time", new Date())
                            .set("status", 0)
                            .set("expire_time", DateUtil.getMinuteAfter(new Date(), 1))
                            .set("target", phone)
                            .save();

                    
                    SMSHelper.messagePost(phone, SMSHelper.contentID_recive_password, valicode);


                    


                    String uuid = StrUtil.getUUID();
                    String token = StrUtil.getUUID();
                    String nickname = getPara("name", "");
                    Date date = new Date();
                    User user = new User();
                    user.set("id", uuid)
                            .set("nickname", StrUtil.noHtml(nickname).trim())
                            .set("password", HashKit.md5(valicode))
                            .set("in_time", date)
                            .set("phone", phone)
                            .set("email", StrUtil.noHtml(nickname).trim() + "@null.null")
                            .set("token", token)
                            .set("avatar", "/static/img/default_avatar.png")
                            .set("type", Constants.USER_TYPE_SCHOOL)
                            .set("school_id", getParaToInt("schoolId"))
                    ;
                    if (user.save()) {
                        if (getModel(Student.class).save())
                            success("保存成功,初始密码已经下发至学校用户手机");
                        else
                            error("学校用户保存失败");
                    } else {
                        error("学校用户保存失败");
                    }

                }
            }
        }
    }
}
