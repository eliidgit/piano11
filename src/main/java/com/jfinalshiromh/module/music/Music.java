package com.jfinalshiromh.module.music;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.utils.StrUtil;
import com.jfinalshiromh.utils.ext.plugin.tablebind.TableBind;

import java.util.ArrayList;
import java.util.List;


@TableBind(tableName = "jf_tb_music")
public class Music extends BaseModel<Music> {
    public static Music me = new Music();
    public static String TABLE_NAME = "jf_tb_music";

    public Page<Music> page(int pageNumber, int pageSize, String name) {
        StringBuffer condition = new StringBuffer();
        if (!StrUtil.isBlank(name)) {
            condition.append(" and m.name like \"%" + name + "%\" ");
        }

        return super.paginate(pageNumber, pageSize, "select m.*,p.name partname ",
                "from " + TABLE_NAME + " m, jf_tb_course_part p where 1 = 1 " + condition + " and m.course_part_id=p.id order by id desc");
    }

    public Music findByPartId(int partId) {
        return super.findFirst("select * from " + TABLE_NAME + " where course_part_id = ?", partId);
    }

    public List<String> findpathsByPartId(int partId) {
        List<String> staveList = new ArrayList<String>();
        List<String> midiList = new ArrayList<String>();
        List<String> oggList = new ArrayList<String>();

        staveList = Db.query("select stave_path from " + TABLE_NAME + " where course_part_id = ? and stave_path != ''", partId);

        midiList = Db.query("select midi_path from " + TABLE_NAME + " where course_part_id = ? and midi_path != ''", partId);

        oggList = Db.query("select ogg_path from " + TABLE_NAME + " where course_part_id = ? and ogg_path != ''", partId);

        if (null != midiList)
        staveList.addAll(midiList);
        if (null != oggList)
        staveList.addAll(oggList);
        return staveList;
    }
    public Integer getToneIdById(int id){
        return Db.queryInt("select tone_id from " + TABLE_NAME + " where  id = ?", id);
    }
    public Integer getCoursePartIdById(int id){
        return Db.queryInt("select course_part_id from " + TABLE_NAME + " where  id = ?", id);
    }

}
