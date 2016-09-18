package com.jfinalshiromh.module.course.coursepart.detail;

import java.util.List;

import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.utils.ext.plugin.tablebind.TableBind;
@TableBind(tableName = "jf_tb_course_part_detail")
public class CoursepartDetail extends BaseModel<CoursepartDetail> {
    
	private static final long serialVersionUID = 1L;
	public static CoursepartDetail me = new CoursepartDetail();
    public static String TABLE_NAME = "jf_tb_course_part_detail";

    public List<CoursepartDetail> getAllByParentPartId(Integer parentPartId){
    	if(parentPartId==null){
    		return null;
    	}
    	return me.find("select id,content,pic_path,name from "+ TABLE_NAME +" where parent_part_id=? order by part_id",parentPartId);
    }

}
