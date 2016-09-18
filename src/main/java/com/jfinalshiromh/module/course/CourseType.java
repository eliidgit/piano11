package com.jfinalshiromh.module.course;

import java.util.List;

import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.utils.ext.plugin.tablebind.TableBind;

@TableBind(tableName = "jf_tb_course_type")
public class CourseType extends BaseModel<CourseType> {
    public static CourseType me = new CourseType();
    public static String TABLE_NAME = "jf_tb_course_type";

    public List<CourseType> getAll(){
    	return find("select * from "+TABLE_NAME + " order by id");
    }


}
