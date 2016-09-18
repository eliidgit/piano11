package com.jfinalshiromh.module.school.courseware;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Page;
import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.interceptor.UserInterceptor;
import com.jfinalshiromh.module.course.coursepart.Coursepart;
import com.jfinalshiromh.module.course.coursepart.detail.CoursepartDetail;
import com.jfinalshiromh.module.demolesson.Demolesson;
import com.jfinalshiromh.module.school.grade.Grade;
import com.jfinalshiromh.module.user.User;
import com.jfinalshiromh.utils.StrUtil;
import com.jfinalshiromh.utils.ext.route.ControllerBind;


@Before(UserInterceptor.class)
@ControllerBind(controllerKey = "/school/courseware",viewPath = "/page/school/courseware")
public class CoursewareController extends BaseController {

   /* public void index(){
        

        String index = getPara("index","");
        String name = getPara("name","");

        Page<Courseware> cPage = Courseware.me.page(getParaToInt("p", 1), defaultPageSize(), index,name);
        
        setAttr("page", Courseware.me.page(getParaToInt("p", 1), defaultPageSize(), index,name));

        
        String demolessonName = getPara("demolesson_name");
        String author = getPara("author");
        setAttr("pageDemolesson", Demolesson.me.page(getParaToInt("p", 1), defaultPageSize(), demolessonName, author));


        render("index.ftl");
    }*/
	public void index(){
		try {
			User u = getUser();
			List<Grade> gradeList = Grade.me.getAllBySchool(u
					.getInt("school_id"));
			setAttr("gradeList", gradeList);
			if (gradeList != null && gradeList.size() > 0) {
				Grade grade = gradeList.get(0);
				if (grade != null
						&& StrUtil.checkParamIsNotNull(grade
								.getInt("course_id"))) {
					Integer courseId = grade.getInt("course_id");
					List<Coursepart> courseParts = Coursepart.me
							.getAllLessonByCourseId(courseId);
					setAttr("courseParts", courseParts);

					setAttr("pageDemolesson", Demolesson.me.pageByCourse(
							getParaToInt("p", 1), defaultPageSize(), courseId));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		render("index.ftl");
	}
	
	
	public void getAllLessonByCourseId(){
		try {
			Integer courseId = getParaToInt("course_id");
			List<Coursepart> courseParts = new ArrayList<Coursepart>();
			if(courseId!=null){
				courseParts=Coursepart.me.getAllLessonByCourseId(courseId);
			}
			success(courseParts);
		} catch (Exception e) {
			e.printStackTrace();
			error("未知错误！");
		}
	}
	
	public void getPageDemoLessonByCourseId(){
		try {
			Integer courseId = getParaToInt("course_id");
			Page<Demolesson> page = null;
			if(courseId!=null){
				page = Demolesson.me.pageByCourse(getParaToInt("p", 1), defaultPageSize(), courseId);
			}
			success(page);
		} catch (Exception e) {
			e.printStackTrace();
			error("未知错误！");
		}
	}
	
	public void getPageDemoLessonByName(){
		try {
			String name = getPara("name");
			Page<Demolesson> page = null;
			if(name!=null){
				page = Demolesson.me.pageByName(getParaToInt("p", 1), defaultPageSize(), name);
			}
			success(page);
		} catch (Exception e) {
			e.printStackTrace();
			error("未知错误！");
		}
	}

    
    public void detail(){
        try {
			int lessonId = getParaToInt(0);
			setAttr("lessonName", getPara(1,""));
			
			setAttr("lessonDetail",
					CoursepartDetail.me.getAllByParentPartId(lessonId));
		} catch (Exception e) {
			e.printStackTrace();
		}
		render("detail.ftl");
    }

    
    public void demoDetail(){
        try {
			int id = getParaToInt(0);
			setAttr("demolesson", Demolesson.me.findById(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		render("demolesson_detail.ftl");
    }
}
