package com.jfinalshiromh.module.school.courseware;

import com.jfinal.plugin.activerecord.Page;
import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.utils.StrUtil;



public class Courseware extends BaseModel<Courseware> {
    public static Courseware me = new Courseware();

    private static final String TABLE_NAME = "jf_tb_courseware";

    
    public Page<Courseware> page(int pageNumber, int pageSize, String index, String name) {
        StringBuffer condition = new StringBuffer();
        if (!StrUtil.isBlank(index)) {
            condition.append(" and index like \"%" + index + "%\" ");
        }

        if (!StrUtil.isBlank(name)) {
            condition.append(" and name like \"%" + name + "%\" ");
        }
        return super.paginate(pageNumber, pageSize, "select * ",
                "from " + TABLE_NAME + " where 1 = 1 " + condition + " order by id desc");
    }

}
