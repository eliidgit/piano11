package com.jfinalshiromh.module.school.classinfo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.interceptor.UserInterceptor;
import com.jfinalshiromh.module.course.coursepart.Coursepart;
import com.jfinalshiromh.module.schedule.Schedule;
import com.jfinalshiromh.module.school.classinfo.vo.ClassInfoVO;
import com.jfinalshiromh.module.school.grade.Grade;
import com.jfinalshiromh.module.school.student.Student;
import com.jfinalshiromh.module.school.student.score.StudentScore;
import com.jfinalshiromh.module.school.teacher.Teacher;
import com.jfinalshiromh.module.user.User;
import com.jfinalshiromh.utils.StrUtil;
import com.jfinalshiromh.utils.ext.route.ControllerBind;


@Before(UserInterceptor.class)
@ControllerBind(controllerKey = "/school/class", viewPath = "/page/school/class")
public class ClassController extends BaseController {
    @Before(UserInterceptor.class)
    public void index() {
        
    	User u = getUser();
        List<ClassInfoVO> voList = new ArrayList<ClassInfoVO>();
        
        String name = getPara("class_name", "").trim();
        int gradeId = getParaToInt("grade_id", -1);
        int classId = getParaToInt("class_id", -1);
        
        Page<ClassInfo> classInfoPage = ClassInfo.me.pageBySchool(getParaToInt("p", 1), defaultPageSize(), name, gradeId, classId,u.getInt("school_id"));
        int pageNumber = classInfoPage.getPageNumber();
        int pageSize = classInfoPage.getPageSize();
        int totalPage = classInfoPage.getTotalPage();
        int totalRow = classInfoPage.getTotalRow();
        
        List<ClassInfo> classInfoList = classInfoPage.getList();
        for (ClassInfo info : classInfoList) {
        	Integer cid=info.getInt("cid");
            ClassInfoVO classInfoVO = new ClassInfoVO();
            classInfoVO.setGradeClass(info.getStr("gname")+" "+info.getStr("cname"));
            Integer lessonId= info.getInt("lesson_id");
            if(lessonId!=null){
            	Coursepart cp  = Coursepart.me.getById(lessonId);
				if (cp.getInt("part_index")!=null){
					classInfoVO.setNowLesson(cp.getInt("part_index"));

				}
            }
            System.out.println(info.getInt("part_number")!=null);
            if(info.getInt("part_number")!=null)
            	classInfoVO.setAllLesson(info.getInt("part_number"));
            
            classInfoVO.setStudentNum(Student.me.getAllStutentNumByClass(cid));
            
            classInfoVO.setTeacherNum(Teacher.me.getAllTeacherNumByClass(cid));
            classInfoVO.setId(cid);
            voList.add(classInfoVO);
        }
        Page<ClassInfoVO> classInfoVOPage = new Page<ClassInfoVO>(voList, pageNumber, pageSize, totalPage, totalRow);
        setAttr("voPage", classInfoVOPage);
        
        setAttr("gradeList", Grade.me.getAllBySchool(u.getInt("school_id")));

        render("index.ftl");
    }

    @Before(UserInterceptor.class)
    public void buildClass() {
    	User u = getUser();
    	Integer schoolId=u.getInt("school_id");
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET)) {
        	
            setAttr("teacherPage", Teacher.me.pageBySchool(getParaToInt("p", 1), 10,null,schoolId));

            Page<Student> studentPage = Student.me.pageByNotCid(getParaToInt("p", 1), 10, schoolId);
           
            setAttr("studentPage",studentPage );

            
            setAttr("gradeList", Grade.me.getAllBySchool(schoolId));

            render("buildclass.ftl");
        }
    }
    
    public void getTeacherByPage(){
    	try {
			User u = getUser();
			Integer schoolId = u.getInt("school_id");
			Page<Teacher> page = Teacher.me.pageBySchool(getParaToInt("p", 1),10, null, schoolId);
			success(page);
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("未知错误");
    }
    
    public void getStuByPage(){
    	try {
			User u = getUser();
			Integer schoolId = u.getInt("school_id");
			Page<Student> page = Student.me.pageByNotCid(getParaToInt("p", 1), 10, schoolId);
			success(page);
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("未知错误");
    }
    
    public void getClassStuByPage(){
    	try {
			Integer cid=getParaToInt("cid");
			Page<Student> page =  Student.me.pageByCid(getParaToInt("p", 1), 10, cid);
			success(page);
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("未知错误");
    }
    
    public void notCurrentClassTeacher(){
    	try {
			Integer cid = getParaToInt("cid");
			if (!StrUtil.checkParamIsNotNull(cid)) {
				error("参数不能为空");
				return;
			}
			Page<Teacher> page = Teacher.me.pageByNotCid(getParaToInt("p", 1),
					10, getUser().getInt("school_id"), cid);
			success(page);
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("未知错误");
    }

    @Before(Tx.class)
    public void add() {
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.POST)) {
            if (getParaToInt("grade.id", -1) < 0 || StrUtil.isBlank(getPara("classInfo.name")))
                error("参数不能为空");
            else {
                
                int gradeId = getParaToInt("grade.id");
                String classInfoName = getPara("classInfo.name");
                
                ClassInfo info = ClassInfo.me.queryByConditions(gradeId, classInfoName);
                if (info != null) {
                    
                    error("已经存在此班级，请重新录入班级信息");
                } else {

                    ClassInfo classInfo = new ClassInfo();
                    classInfo.set("name", classInfoName);
                    classInfo.set("gid", gradeId);
                    if (classInfo.save()) {
                        int cid = ClassInfo.me.getId(classInfoName);
                        success(cid);
                    } else {
                        error("保存失败");
                    }
                }
            }
        }
    }


    

    @Before(Tx.class)
    public void addClassTeachers() {
        try {
			String method = getRequest().getMethod();
			if (method.equalsIgnoreCase(Constants.POST)) {
				boolean re = true;
				
				String class_id = getPara("class_id");
				if (!StrUtil.checkParamIsNotNull(class_id)) {
					error("请先新增班级");
					return;
				}
				String[] tids = getParaValues("tids[]");
				Record record = new Record();
				for (String tid : tids) {
					record.clear();
					record.set("cid", class_id);
					record.set("tid", tid);
					
					

					if (!Db.save("jf_tb_class_teacher", record))
						re = false;
				}
				if (re)
					success(class_id);
				else
					error("保存失败");
			}
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
        error("保存失败");
    }


    @Before(Tx.class)
    public void addClassStudents() {
        try {
			String method = getRequest().getMethod();
			if (method.equalsIgnoreCase(Constants.POST)) {
				boolean re = true;
				
				Integer class_id = getParaToInt("class_id");
				Integer[] sids = getParaValuesToInt("sids[]");
				if(!StrUtil.checkParamIsNotNull(class_id)){
					error("请先新增班级");
					return;
				}
				for (Integer tid : sids) {
					if (Student.me.updateStuClass(tid,class_id) <= 0) {
						re = false;
					}
				}
				if (re)
					success(class_id);
				else
					error("保存失败");
			}
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
        error("保存失败");
    }

    
    @Before(Tx.class)
    public void delete() {
        int classId = getParaToInt("class_id");
        
        
        
        if ((ClassTeacher.me.deleteByCid(classId) > -1)
                && (ClassStudent.me.deleteByCid(classId) > -1)
                && ClassInfo.me.deleteById(classId))
            success();
        else
            error("删除失败");
    }


    public void getClassesByGid() {
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.POST)) {

            int gid = getParaToInt("grade_id", -1);
            if (gid != -1) {
                List<ClassInfo> listClass = ClassInfo.me.findByGid(gid);
                success(listClass);
            } else {
                error("传参失败");
            }

        }
    }

    
    public void detail() {
    	User u = getUser();
        int id = getParaToInt(0);
        Integer nowLesson = getParaToInt(1);
        Integer allLesson = getParaToInt(2);
        
        ClassInfo classInfo = ClassInfo.me.findById(id);
        ClassInfoVO classInfoVO = new ClassInfoVO();
        classInfoVO.setId(id);
        
        Grade g = Grade.me.getGradeById(classInfo.getInt("gid"));
        setAttr("courseId", g.getInt("course_id"));
        classInfoVO.setGradeClass(g.getStr("name") + "&nbsp;" + classInfo.get("name"));
        classInfoVO.setNowLesson(nowLesson);
        classInfoVO.setAllLesson(allLesson);
        setAttr("classVO", classInfoVO);


        
        List<Teacher> classTeacher = Teacher.me.getByCid(id);
        setAttr("classTeacher", classTeacher);

        
        Page<Student> classPageStudent = Student.me.pageByCid(getParaToInt("p", 1), 10, id);
        setAttr("classPageStudent", classPageStudent);

        
        setAttr("teacherPage", Teacher.me.pageByNotCid(getParaToInt("p", 1), 10, u.getInt("school_id"),id));

        
        setAttr("studentPage", Student.me.pageByNotCid(getParaToInt("p", 1), 10,u.getInt("school_id")));

        setAttr("gradeList", Grade.me.getAllBySchool(u.getInt("school_id")));
        
        List<Coursepart> list = Coursepart.me.getLessonByGid(classInfo.getInt("gid"));
        List<StudentScore> ss = null;
        if(list !=null && list.size()>0){
        	ss = StudentScore.me.getStuScoreByClassAndPartId(id, list.get(0).getInt("id"));
        }
        setAttr("stuScores", ss);
        
        
        List<Schedule> classLesson  = Schedule.me.getAllByCid(id);
        Map<String, Schedule> amLessonMap = new HashMap<String, Schedule>();
        Map<String, Schedule> pmLessonMap = new HashMap<String, Schedule>();
        for(Schedule item : classLesson){
        	if("1".equals(item.get("am_pm"))){
        		amLessonMap.put(item.getInt("week").toString(), item);
        	}else if ("2".equals(item.get("am_pm"))){
        		pmLessonMap.put(item.getInt("week").toString(), item);
        	}
        }
        setAttr("amLesson", amLessonMap);
        setAttr("pmLesson", pmLessonMap);
        render("detail.ftl");
    }

    
    public void relieveClassTeacher(){
    	try {
			Integer cid = getParaToInt("cid");
			Integer[] tids = getParaValuesToInt("tids[]");
			if (!StrUtil.checkParamIsNotNull(cid) || tids == null
					|| tids.length == 0) {
				error("参数不能为空");
				return;
			}
			for (Integer tid : tids) {
				ClassTeacher.me.delTeacherAndClass(tid, cid);
			}
			success();
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("未知错误");
    }
    
    
    public void assignClassTeacher(){
    	try {
			Integer cid = getParaToInt("cid");
			Integer[] tids = getParaValuesToInt("tids[]");
			if (!StrUtil.checkParamIsNotNull(cid) || tids == null
					|| tids.length == 0) {
				error("参数不能为空");
				return;
			}
			for (Integer tid : tids) {
				ClassTeacher.me.addTeacher(tid, cid);
			}
			success();
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("未知错误");
    }
    
    
    public void getAllStuScoreByLessonName(){
    	try {
			Integer courseId = getParaToInt("courseId");
			Integer cid = getParaToInt("cid");
			String lessonName = getPara("lessonName");
			if (!StrUtil.checkParamIsNotNull(courseId, cid, lessonName)) {
				error("参数不能为空");
				return;
			}
			Integer lessonId = Coursepart.me
					.getLessonIdByLessonNameAndCourseId(lessonName, courseId);
			if (lessonId == null) {
				error("该课程不存在！");
				return;
			}
			List<StudentScore> s = StudentScore.me.getStuScoreByClassAndPartId(
					cid, lessonId);
			success(s);
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("未知错误");
    }
    
    
    public void  saveClassLesson(){
    	Schedule lesson = getModel(Schedule.class);
    	if(lesson.getInt("id")==null){
    		lesson.save();
    	}else{
    		lesson.update();
    	}
    	success(lesson);
    }
}
