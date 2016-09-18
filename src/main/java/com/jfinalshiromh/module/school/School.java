package com.jfinalshiromh.module.school;

import java.util.Date;
import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.utils.StrUtil;
import com.jfinalshiromh.utils.ext.plugin.tablebind.TableBind;

@TableBind(tableName = "jf_tb_school")
public class School extends BaseModel<School> {
	private static final long serialVersionUID = 1L;
	public static final School me = new School();
	public static String TABLE_NAME = "jf_tb_school";
	
	public Page<School> page(int pageNumber, int pageSize, String name) {
        StringBuffer condition = new StringBuffer();
        if (!StrUtil.isBlank(name)) {
            condition.append(" and name like \"%" + name + "%\" ");
        }

        return super.paginate(pageNumber, pageSize, "select id, name,create_time,validity_day,start_time",
                "from " + TABLE_NAME + " where 1=1 " +condition +" order by id desc");
    }
	
	public Long getCountByName(String name){
		return Db.queryLong("select count(*) from "+TABLE_NAME + " where name=?",name);
	}
	
	public List<School> getAll(){
		return find("select id,name from "+TABLE_NAME+" order by id desc");
	}
	
	public School getDateAndDayById(Integer id){
		return findFirst("select start_time ,validity_day from "+TABLE_NAME+" where id=?",id);
	}
	
	public Long getCount(){
		return Db.queryLong("select count(*) from "+TABLE_NAME);
	}
	
	
	public Boolean checkSchoolIsTimeout(Date date,Integer day){
		Date currentDate = new Date();
		Long diff = currentDate.getTime()/1000-date.getTime()/1000;
		Long longDay = (long) ((day+1)*60*60*24);
		return longDay-diff>=0?true:false;
	}
	
}
