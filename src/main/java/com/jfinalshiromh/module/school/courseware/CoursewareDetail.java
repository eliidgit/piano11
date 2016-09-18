package com.jfinalshiromh.module.school.courseware;

import com.jfinal.plugin.activerecord.Page;
import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.utils.StrUtil;

import java.util.List;



public class CoursewareDetail extends BaseModel<CoursewareDetail> {

    public static CoursewareDetail me = new CoursewareDetail();

    private static String TABLE_NAME = "jf_tb_courseware_detail";

    
    public List<CoursewareDetail> listByCid(int cid){
        return super.find("select * from " + TABLE_NAME + " where 1=1 and course_id = ? ",cid);
    }

}
