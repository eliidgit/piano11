package com.jfinalshiromh.module.homework;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.utils.StrUtil;
import com.jfinalshiromh.utils.ext.plugin.tablebind.TableBind;

import java.util.ArrayList;
import java.util.List;


@TableBind(tableName = "jf_tb_homework")
public class Homework extends BaseModel<Homework> {
    public static String TABLE_NAME = "jf_tb_homework";
    public static Homework me = new Homework();

    public Page<Homework> page(int pageNumber, int pageSize, String name) {
        StringBuffer condition = new StringBuffer();
        if (!StrUtil.isBlank(name)) {
            condition.append(" and h.name like \"%" + name + "%\" ");
        }
        return super.paginate(pageNumber, pageSize, "select h.*, c.name cname,p.name pname ",
                "from " + TABLE_NAME + " h,jf_tb_course_part p,jf_tb_course c " +
                        "where p.id=h.course_part_id and p.course_id=c.id  " + condition + " order by id desc");
    }

    public Homework findByPartId(int partId){
        return super.findFirst("select * from " + TABLE_NAME + " where course_part_id = ?",partId);
    }

    public Homework findOneByPartId(int partId){
        return super.findFirst("select * from " + TABLE_NAME + " where course_part_id = ?",partId);
    }



    public List<String> findpathsByPartId(int partId){
        List<String> aList = new ArrayList<String>();
        List<String> bList = new ArrayList<String>();
        List<String> cList = new ArrayList<String>();
        List<String> dList = new ArrayList<String>();

        aList = Db.query("select answer_a from " + TABLE_NAME + " where course_part_id = ? and answer_type = '2' ",partId);
        bList = Db.query("select answer_b from " + TABLE_NAME + " where course_part_id = ? and answer_type = '2' ",partId);
        cList = Db.query("select answer_c from " + TABLE_NAME + " where course_part_id = ? and answer_type = '2' ",partId);
        dList = Db.query("select answer_d from " + TABLE_NAME + " where course_part_id = ? and answer_type = '2' ",partId);



        aList.addAll(bList);
        aList.addAll(cList);
        aList.addAll(dList);
        return aList;

    }
    
    
    public List<Homework> getAllByPartId(Integer pid){
    	return find("select * from jf_tb_homework where course_part_id in ("+
				"select id from jf_tb_course_part where parent_id in("+
				"select id from jf_tb_course_part where parent_id=? order by part_index) and type=5) order by source_index",pid);
    }

    public Integer getCoursePartIdById(int id){
        return Db.queryInt("select course_part_id from " + TABLE_NAME + " where  id = ?", id);
    }


















}
