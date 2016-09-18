package com.jfinalshiromh.module.course;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.utils.StrUtil;
import com.jfinalshiromh.utils.ext.plugin.tablebind.TableBind;

import java.util.List;


@TableBind(tableName = "jf_tb_course")
public class Course extends BaseModel<Course> {

    public static Course me = new Course();
    public static String TABLE_NAME = "jf_tb_course";

    public Page<Course> page(int pageNumber, int pageSize, String name) {
        StringBuffer condition = new StringBuffer();
        if (!StrUtil.isBlank(name)) {
            condition.append(" and name like \"%" + name + "%\" ");
        }
        return super.paginate(pageNumber, pageSize, "select * ",
                "from "+  TABLE_NAME +" where 41 = 41 " + condition + " order by id desc");
    }

    public String getNameByid(int id){
        return Db.queryStr("select name from " + TABLE_NAME + " where 1=1 and id = ? " , id);
    }

    public List<Course> list(){
        return super.find("select id,name from " + TABLE_NAME + " order by id desc ");
    }

    
    public int getPartNumById(int id){
        return Db.queryInt("select part_number from " + TABLE_NAME + " where 1=1 and id = ? ", id);
    }

}
