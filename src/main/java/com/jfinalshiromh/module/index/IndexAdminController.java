package com.jfinalshiromh.module.index;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;

import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.module.school.School;
import com.jfinalshiromh.module.school.student.Student;
import com.jfinalshiromh.module.school.teacher.Teacher;
import com.jfinalshiromh.utils.ext.route.ControllerBind;


@ControllerBind(controllerKey = "/admin", viewPath = "page/admin")
public class IndexAdminController extends BaseController {

    @RequiresPermissions("menu:index")
    public void index() {
    	setAttr("schoolCount", School.me.getCount()); 
    	setAttr("teacherCount", Teacher.me.getCount()); 
    	setAttr("studentCount", Student.me.getCount()); 
        render("index.ftl");
    }

    public void logout() {
        SecurityUtils.getSubject().logout();
        redirect("/adminlogin");
    }
}
