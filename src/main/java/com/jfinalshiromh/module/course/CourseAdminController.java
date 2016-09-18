package com.jfinalshiromh.module.course;

import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.module.course.coursepart.Coursepart;
import com.jfinalshiromh.utils.ext.route.ControllerBind;


@ControllerBind(controllerKey = "/admin/course",viewPath = "/page/admin/course")
public class CourseAdminController extends BaseController {
    public void index(){
        String name = getPara("name","");
        setAttr("page",Course.me.page(getParaToInt("p",1),defaultPageSize(),name));
        setAttr("name",name);
        render("index.ftl");
    }

    public void add(){
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET))
            render("add.ftl");
        else{
            if (getModel(Course.class,"course").save())
                redirect("/admin/course");
        }
    }

    public void edit(){
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET)) {
            int id = getParaToInt(0,-1);
            if (id != -1) {
                Course course = Course.me.findById(id);
                if (null != course) {
                    setAttr("course", course);
                    render("edit.ftl");
                }
            }
        }
        else{
            
            
            



            if (getModel(Course.class,"course").update())
                redirect("/admin/course");
        }
    }

    public void delete(){
        int id = getParaToInt("course_id",-1);
        if (id != -1){
            if (Course.me.deleteById(id)) {
                success("删除成功");
            }
        }else{
            error("id不正确");
        }
    }

    public void info(){
        int id = getParaToInt(0,-1);
        if (id != -1){
            Course course = Course.me.findById(id);
            if (null != course) {

                setAttr("course",course);
                render("info.ftl");
            }else{
                renderError(500);
            }
        }
    }
}
