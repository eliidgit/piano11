package com.jfinalshiromh.module.school.grade;

import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.module.user.User;
import com.jfinalshiromh.utils.StrUtil;
import com.jfinalshiromh.utils.ext.route.ControllerBind;


 @ControllerBind(controllerKey = "school/grade")
public class GradeController extends BaseController {
    public void add() {
    	User u = getUser();
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.POST)) {
            if (StrUtil.isBlank(getPara("name")))
                error("参数不能为空");
            else {
                
                String gradeName = getPara("name");

                int gradeId = Grade.me.getIdByName(gradeName,u.getInt("school_id"));
                System.out.println(gradeId);
                if (gradeId != -1) {
                    
                    error("已经存在该年级，请修改年级信息");
                } else {
                    
                    Grade grade = new Grade();
                    grade.set("name", gradeName);
                    grade.set("school_id", u.getInt("school_id"));
                    if (grade.save()) {
                        
                        gradeId = Grade.me.getLastInsertId();
                        grade.set("id", gradeId);
                        success(grade);
                    }
                }
            }
        }
    }
}
