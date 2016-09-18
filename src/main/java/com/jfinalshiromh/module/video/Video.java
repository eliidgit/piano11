package com.jfinalshiromh.module.video;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.utils.StrUtil;
import com.jfinalshiromh.utils.ext.plugin.tablebind.TableBind;

import java.util.List;


@TableBind(tableName = "jf_tb_video")
public class Video extends BaseModel<Video> {
    public static Video me = new Video();
    public static String TABLE_NAME = "jf_tb_video";

    public Page<Video> page(int pageNumber, int pageSize, String name, String authorName) {
        StringBuffer condition = new StringBuffer();
        if (!StrUtil.isBlank(name)) {
            condition.append(" and v.name like \"%" + name + "%\" ");
        }
        if (!StrUtil.isBlank(authorName)) {
            condition.append(" and v.author_name like \"%" + authorName + "%\" ");
        }
        return super.paginate(pageNumber, pageSize, "select v.*,p.name partname ",
                "from " + TABLE_NAME + " v, jf_tb_course_part p where 1 = 1 " + condition + " and v.course_part_id=p.id order by id desc");
    }


    public Video findByPartId(int partId){
        return super.findFirst("select * from " + TABLE_NAME + " where course_part_id = ?",partId);
    }

    public List<String> findPathByPartId(int partId){
        return Db.query("select path from " + TABLE_NAME + " where course_part_id = ?",partId);
    }
    public Integer getCoursePartIdById(int id){
        return Db.queryInt("select course_part_id from " + TABLE_NAME + " where  id = ?", id);
    }


}
