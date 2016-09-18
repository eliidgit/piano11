package com.jfinalshiromh.module.course.coursepart.coursepartunit;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.utils.StrUtil;
import com.jfinalshiromh.utils.ext.plugin.tablebind.TableBind;


@TableBind(tableName = "jf_tb_course_part_unit")
public class CoursepartUnit extends BaseModel<CoursepartUnit> {

    public static String TABLE_NAME = "jf_tb_course_part_unit";

    public Page<Record> page(int pageNumber, int pageSize, String name, String partName) {
        StringBuffer condition = new StringBuffer();
        if (!StrUtil.isBlank(name)) {
            condition.append(" and p.name like \"%" + name + "%\" ");
        }
        if (!StrUtil.isBlank(partName)) {
            condition.append(" and c.name like \"%" + partName + "%\" ");
        }
        


        return Db.paginate(pageNumber, pageSize, "select u.id,u.name,p.unit_index,p.unit_number,c.id cid,c.name cname",
                "from " + TABLE_NAME + " p,jf_tb_course c where 1 = 1 and p.course_id=c.id " + condition + " order by p.id desc");
    }
}
