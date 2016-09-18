package com.jfinalshiromh.module.course.coursepart.coursepartunit;

import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.module.course.Course;
import com.jfinalshiromh.module.course.coursepart.Coursepart;
import com.jfinalshiromh.utils.ext.route.ControllerBind;

import java.util.List;


@ControllerBind(controllerKey = "/admin/coursepartunit",viewPath = "/page/admin/coursepartunit")
public class CoursepartunitAdminController extends BaseController{
    public void index() {








    }

    public void add() {
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET)) {
            


            setAttr("courseList", Course.me.list());



            render("add.ftl");
        } else {
            if (getModel(Coursepart.class, "coursepart").save())
                redirect("/admin/coursepart");
        }
    }

    public void edit() {
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET)) {
            int id = getParaToInt(0, -1);
            if (id != -1) {
                Coursepart coursepart = Coursepart.me.findById(id);
                if (null != coursepart) {
                    

                    
                    setAttr("courseList",Course.me.list());
                    
                    List<Integer> partsIndexList  = Coursepart.me.getUnuseIndex(coursepart.getInt("course_id"));
                    setAttr("partsIndexList",partsIndexList);
                    setAttr("coursepart", coursepart);
                    render("edit.ftl");
                }
            }
        } else {
            if (getModel(Coursepart.class, "coursepart").update())
                redirect("/admin/coursepart");
        }

    }

    public void info() {
    }

    public void delete() {
        int id = getParaToInt("coursepart_id",-1);
        if (id != -1){
            if (Coursepart.me.deleteById(id)) {
                success("删除成功");
            }
        }else{
            error("id不正确");
        }
    }

    public void getParts(){
        
        int id = getParaToInt("course_id",-1);
        List<Integer> partsList = Coursepart.me.getUnuseIndex(id);
        if (null != partsList)
            success(partsList);
        else
            error("course_id错误");
    }
}
