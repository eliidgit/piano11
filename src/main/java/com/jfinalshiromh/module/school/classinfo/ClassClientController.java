package com.jfinalshiromh.module.school.classinfo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.module.school.grade.Grade;
import com.jfinalshiromh.utils.ext.route.ControllerBind;
@ControllerBind(controllerKey = "/api/class")
public class ClassClientController extends BaseController {

	
	public void getGradeClass(){
		try {
			Integer schoolId = getParaToInt("schoolId");
			List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
			Map<String, Object> map = null;
			List<Grade> grades = Grade.me.getAllBySchool(schoolId);
			for (Grade grade : grades) {
				map = new HashMap<String, Object>();
				List<ClassInfo> classes = ClassInfo.me.findByGid(grade
						.getInt(("id")));
				map.put("id", grade.getInt("id"));
				map.put("name", grade.getStr("name"));
				map.put("class", classes);
				result.add(map);
			}
			if(result.size()>0)
				success(result);
			else
				error("无数据");
			
			return ;
		} catch (Exception e) {
			e.printStackTrace();
		}
		error("服务器异常");
	}
}
