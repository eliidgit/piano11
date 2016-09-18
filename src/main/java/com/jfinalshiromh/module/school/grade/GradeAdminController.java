package com.jfinalshiromh.module.school.grade;

import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.module.course.Course;
import com.jfinalshiromh.module.course.coursepart.Coursepart;
import com.jfinalshiromh.module.course.coursepart.po.TreeViewNode;
import com.jfinalshiromh.utils.ext.route.ControllerBind;

import java.util.ArrayList;
import java.util.List;


@ControllerBind(controllerKey = "/admin/grade", viewPath = "/page/admin/grade")
public class GradeAdminController extends BaseController {

    public void index() {
    	Integer schoolId = getParaToInt("schoolId");
        Page<Record> recordPage = Grade.me.pageRocord(getParaToInt("p", 1), defaultPageSize(), getPara("name", ""),schoolId);
        setAttr("schoolId", schoolId);
        List<Record> list = recordPage.getList();

        for (Record record : list) {
            if (null != record.getInt("course_id")) {
                record.set("cname", Course.me.getNameByid(record.getInt("course_id")));
            }else{
                record.set("cname", "暂无匹配课程");
            }
        }


        setAttr("page", recordPage);
        render("index.ftl");

    }

    
    public void edit() {

        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET)) {
            int id = getParaToInt(0, -1);
            if (id == -1) {
            } else {
                Grade grade = Grade.me.findById(id);
                if (grade == null) {
                    renderError(500);
                } else {
                    
                    List<Course> courseList = Course.me.list();
                    setAttr("grade", grade);
                    setAttr("courseList", courseList);
                    render("select_course.ftl");
                }
            }

        } else if (method.equalsIgnoreCase(Constants.POST)) {
            
            if (getModel(Grade.class, "grade").update())
                redirect("/admin/grade");
            else
                redirect("/admin");
        }
    }


}
