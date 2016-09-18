package com.jfinalshiromh.module.school.piano;

import java.util.Date;
import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Page;
import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.interceptor.UserInterceptor;
import com.jfinalshiromh.module.school.piano.classroom.Classroom;
import com.jfinalshiromh.module.school.piano.malfunction.PianoMalfunction;
import com.jfinalshiromh.module.school.piano.malfunction.detail.PianoMalfunctionDetail;
import com.jfinalshiromh.module.user.User;
import com.jfinalshiromh.utils.StrUtil;
import com.jfinalshiromh.utils.ext.route.ControllerBind;
@Before(UserInterceptor.class)
@ControllerBind(controllerKey = "/school/piano", viewPath = "/page/school/piano")
public class PianoController extends BaseController {
    public void index() {
    	try {
			User u = getUser();
			Integer schoolId = u.getInt("school_id");
			setAttr("classrooms", Classroom.me.getAll(schoolId));
			setAttr("pianos",Piano.me.page(getParaToInt("p", 1), 10, null, schoolId));
			setAttr("malfunctions",PianoMalfunction.me.page(getParaToInt("p", 1), 10, schoolId));
			setAttr("allCount", Piano.me.getPianoCountBySchool(schoolId));
			setAttr("badCount", Piano.me.getBadPianoCountBySchool(schoolId));
		} catch (Exception e) {
			e.printStackTrace();
		}
		render("index.ftl");
    }
    
    public void getPageMalfunction(){
    	try {
			User u = getUser();
			Integer schoolId = u.getInt("school_id");
			Page<PianoMalfunction> malfunction = PianoMalfunction.me.page(getParaToInt("p", 1), 10, schoolId);
			success(malfunction);
		} catch (Exception e) {
			e.printStackTrace();
			error("未知错误");
		}
    }
    
    
    public void getPagePianoByClassroom(){
    	try {
			User u = getUser();
			Integer schoolId = u.getInt("school_id");
			Integer classroomId = getParaToInt("classroomId");
			Page<Piano> pianos = Piano.me.page(getParaToInt("p", 1), 10,classroomId, schoolId);
			success(pianos);
		} catch (Exception e) {
			e.printStackTrace();
			error("未知错误");
		}
    }
    
    
    public void add(){
    	try {
			User u = getUser();
			Integer schoolId = u.getInt("school_id");
			Piano piano = getModel(Piano.class);
			piano.set("school_id", schoolId);
			if(Piano.me.checkIsExistByPianoId(piano.getStr("piano_id"))){
				error("该钢琴ID已存在！");
				return;
			}
			if (piano.save()) {
				success(piano);
			} else {
				error("新增感情失败！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			error("未知错误!");
		}
    }
    
    public void addClassroom(){
    	try {
			User u = getUser();
			Integer schoolId = u.getInt("school_id");
			Classroom c = getModel(Classroom.class);
			c.set("school_id", schoolId);
			if(Classroom.me.checkIsExist(c.getStr("building"),c.getStr("name") ,schoolId)){
				error("该教室已存在！");
				return;
			}
			if (c.save()) {
				success(c);
			} else {
				error("新增感情失败！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			error("未知错误!");
		}
    }
    
    
    public void getMalDetail(){
    	try {
			Integer malId = getParaToInt("malId");
			if(!StrUtil.checkParamIsNotNull(malId)){
	    		error("参数不能为空！");
	    		return;
	    	}
			List<PianoMalfunctionDetail> pmd = PianoMalfunctionDetail.me
					.getAllByMalId(malId);
			success(pmd);
		} catch (Exception e) {
			e.printStackTrace();
			error("未知错误");
		}    	
    }
    
    public void updatePianoStatus(){
    	try {
			Integer pid = getParaToInt("pid");
			Integer id = getParaToInt("id");
			String status = getPara("status");
			if (!StrUtil.checkParamIsNotNull(pid, id, status)) {
				error("参数不能为空！");
				return;
			}
			String pStatus = "3".equals(status) ? "1" : "2";
			Piano.me.updateStatus(pStatus, pid);
			PianoMalfunction.me.updateStatus(status, id);
			success();
		} catch (Exception e) {
			e.printStackTrace();
			error("未知错误");
		}
    }
    
    
    public void searchPiano(){
    	try {
			User u = getUser();
			Integer schoolId = u.getInt("school_id");
			Integer type = getParaToInt("type");
			String pianoId = getPara("pianoId");
			if (!StrUtil.checkParamIsNotNull(type, pianoId)) {
				error("参数不能为空");
				return;
			}
			Object obj = null;
			System.out.println(type+"======");
			if (type==0) {
				obj = PianoMalfunction.me.getByPianoId(schoolId, pianoId);
			} else {
				obj = Piano.me.getByPianoId(schoolId, pianoId);
			}
			success(obj);
		} catch (Exception e) {
			e.printStackTrace();
			error("未知错误");
		}
    }
    
    public void detail(){
    	
    	try {
    		User u = getUser();
			Integer id = getParaToInt(0);
			if (!StrUtil.checkParamIsNotNull(id)) {
				error("参数不能为空！");
				return;
			}
			Piano p = Piano.me.getById(id);
			Date d = p.getDate("create_time");
			if(d!=null){
				@SuppressWarnings("deprecation")
				Integer temp = new Date().getYear()- d.getYear();
				if(temp<1){
					temp=1;
				}
				setAttr("y", temp);
			}
			setAttr("classrooms", Classroom.me.getAll(u.getInt("school_id")));
			setAttr("piano", p);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	render("detail.ftl");
    }
    @SuppressWarnings("deprecation")
	public void edit(){
    	try {
			Piano piano = getModel(Piano.class);
			if (piano.update()) {
				Date d = piano.getDate("create_time");
				Integer temp=null;
				if(d!=null){
					temp = (new Date().getYear()- d.getYear());
					if(temp<1){
						temp=1;
					}
				}
				success(temp);
			} else {
				error("修改参数失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
    public void getClassroom(){
    	try {
			Integer id = getParaToInt("id");
			Classroom croom = Classroom.me.findById(id);
			success(croom);
		} catch (Exception e) {
			e.printStackTrace();
			error("未知错误");
		}
    }
    public void addPianoMal(){
    	try {
    		PianoMalfunction pianoMal = getModel(PianoMalfunction.class);
    		Integer id = PianoMalfunction.me.getIdByPid(pianoMal.getInt("pid"));
    		if(id!=null && id >0){
    			if(pianoMal.set("id", id).set("status", "1").update()){
	    			Piano.me.updateStatus("2", pianoMal.getInt("pid"));
	    			success(pianoMal);
	    			return;
    			}else{
    				error("新增钢琴失败！");
    			}
    		}
			if (pianoMal.save()) {
				Piano.me.updateStatus("2", pianoMal.getInt("pid"));
				success(pianoMal);
			} else {
				error("新增钢琴失败！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			error("未知错误!");
		}
    }

}
