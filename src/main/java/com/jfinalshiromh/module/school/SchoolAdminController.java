package com.jfinalshiromh.module.school;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.plugin.activerecord.Page;
import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.utils.DateUtil;
import com.jfinalshiromh.utils.ext.route.ControllerBind;


@ControllerBind(controllerKey = "/admin/school", viewPath = "/page/admin/school")
public class SchoolAdminController extends BaseController {
    public void index() {
        String name = getPara("name");
        Page<School> page = School.me.page(getParaToInt("p", 1), defaultPageSize(), name);
        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        Calendar cal = Calendar.getInstance();
        Date d = new Date();
        for(School item :page.getList()){
        	Map<String, Object> map = new HashMap<String,Object>();
        	map.put("id", item.getInt("id"));
        	map.put("create_time", item.getDate("create_time"));
        	map.put("name", item.getStr("name"));
        	Integer day = item.getInt("validity_day");
        	Date startTime=item.getDate("start_time");
        	cal.setTime(startTime);
        	cal.add(Calendar.DAY_OF_YEAR, day);
        	map.put("end_time", cal.getTime());
        	
    		Long d1 = DateUtil.string2Date(DateUtil.formatDateTime(startTime), DateUtil.FORMAT_DATE).getTime();
    		Long d2 = DateUtil.string2Date(DateUtil.formatDateTime(d), DateUtil.FORMAT_DATE).getTime();
    		Long num = day-(d2-d1)/(1000*60*60*24);
    		map.put("day",num<0?0:num);
        	list.add(map);
        }
        setAttr("page", new Page<Map<String,Object>>(list, page.getPageNumber(), page.getPageSize(), page.getTotalPage(), page.getTotalRow()));
        setAttr("name", name);
        render("index.ftl");
    }
    

    public void del() {
        try {
			int id = getParaToInt("id", -1);
			if (id != -1) {
				if (School.me.deleteById(id))
					success("删除成功");
				else
					error("删除失败");
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		error("ID不正确");
    }

    public void info() {
    	try {
			int id = getParaToInt(0);
			Date date = new Date();
			Calendar cal = Calendar.getInstance();
			School school = School.me.findById(id);
        	Integer day = school.getInt("validity_day");
        	Date startTime=school.getDate("start_time");
        	cal.setTime(startTime);
        	cal.add(Calendar.DAY_OF_YEAR, day);
        	setAttr("end_time", cal.getTime());
        	
    		Long d1 = DateUtil.string2Date(DateUtil.formatDateTime(startTime), DateUtil.FORMAT_DATE).getTime();
    		Long d2 = DateUtil.string2Date(DateUtil.formatDateTime(date), DateUtil.FORMAT_DATE).getTime();
    		Long num = day-(d2-d1)/(1000*60*60*24);
    		
    		setAttr("day",num<0?0:num);
			setAttr("school", school);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	render("info.ftl");
    }
    
    public void add(){
    	if(Constants.POST.equalsIgnoreCase(this.getRequest().getMethod())){
    		School school =  getModel(School.class);
    		school.set("start_time", new Date()).save();
    		redirect("/admin/school");
    	}else{
    		render("add.ftl");
    	}
    }
    
    public void edit(){
    	if(Constants.POST.equalsIgnoreCase(this.getRequest().getMethod())){
    		School school = getModel(School.class);
    		school.set("start_time", new Date());
    		school.update();
    		redirect("/admin/school");
    	}else{
    		int id = getParaToInt(0);
    		School s = School.me.findById(id);
    		Date start = s.getDate("start_time");
    		Long d1 = DateUtil.string2Date(DateUtil.formatDateTime(start), DateUtil.FORMAT_DATE).getTime();
    		Long d2 = DateUtil.string2Date(DateUtil.formatDateTime(new Date()), DateUtil.FORMAT_DATE).getTime();
    		Long day = s.getInt("validity_day")-(d2-d1)/(1000*60*60*24);
    		setAttr("day", day<0?0:day);
    		setAttr("school", s);
    		render("edit.ftl");
    	}
    }
    
    public void checkSchoolNameIsExits(){
    	String name=getPara("name");
    	Long count = School.me.getCountByName(name);
    	if(count>0)
    		error("此学校已存在");
    	else{
    		success();
    	}
    }
    
    public void getSchool(){
    	success(School.me.getAll());
    }
    
   
}
