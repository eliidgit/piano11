package com.jfinalshiromh.module.school.teacher;

import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.utils.ext.route.ControllerBind;


@ControllerBind(controllerKey = "school/teacher/result", viewPath = "page/school/teacher/result")
public class TeacherReaultController extends BaseController {

    public void index(){
        success(TeacherResult.me.topN(4));
    }
    public void add(){

    }
    public  void edit() {
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.POST)) {

            if (getModel(TeacherResult.class).update())
                redirect("/school/teacher/detail?id=" + getPara("teacher.id"));
        }
    }
}
