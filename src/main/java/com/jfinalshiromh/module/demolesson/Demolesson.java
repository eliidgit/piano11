package com.jfinalshiromh.module.demolesson;

import com.jfinal.plugin.activerecord.Page;
import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.utils.StrUtil;

import java.util.List;



public class Demolesson extends BaseModel<Demolesson> {

    public static final Demolesson me = new Demolesson();

    
    public Page<Demolesson> page(int pageNumber, int pageSize, String name, String author) {
        return page(pageNumber,pageSize,name,author,"");
    }

    public Page<Demolesson> page(int pageNumber, int pageSize, String name, String author,String type) {
        StringBuffer condition = new StringBuffer();
        if (!StrUtil.isBlank(name)) {
            condition.append(" and name like \"%" + name + "%\" ");
        }
        if (!StrUtil.isBlank(author)) {
            condition.append(" and author like \"%" + author + "%\" ");
        }
        if (!StrUtil.isBlank(type)) {
            condition.append(" and type = " + type);
        }
        return super.paginate(pageNumber, pageSize, "select * ",
                "from jf_tb_demolesson where 1 = 1 " + condition + " order by id desc");
    }
    
    public Page<Demolesson> pageByCourse(int pageNumber, int pageSize,Integer courseId){
    	 return super.paginate(pageNumber, pageSize, "select id,name,pic_path ",
                 "from jf_tb_demolesson where course_id=? order by id desc",courseId);
    }
    public Page<Demolesson> pageByName(int pageNumber, int pageSize,String name){
   	 return super.paginate(pageNumber, pageSize, "select id,name,pic_path ",
                "from jf_tb_demolesson where name like ? order by id desc","%"+name+"%");
   }
    public List<Demolesson> list() {
        return super.find("select * from jf_tb_demolesson");
    }


}
