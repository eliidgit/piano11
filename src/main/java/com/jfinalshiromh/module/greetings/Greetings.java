package com.jfinalshiromh.module.greetings;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.utils.StrUtil;
import com.jfinalshiromh.utils.ext.plugin.tablebind.TableBind;

import java.util.List;

@TableBind(tableName = "jf_tb_greetings")
public class Greetings extends BaseModel<Greetings> {
    private static final long serialVersionUID = 1L;
    public static final Greetings me = new Greetings();
    public static String TABLE_NAME = "jf_tb_greetings";


    public Page<Greetings> page(int pageNumber, int pageSize, String content,String client_type,String type) {
        StringBuffer condition = new StringBuffer();
        if (!StrUtil.isBlank(content)) {
            condition.append(" and content like \"%" + content + "%\" ");
        }

        if (!StrUtil.isBlank(client_type)) {
            condition.append(" and client_type =" + client_type );
        }
        if (!StrUtil.isBlank(type)) {
            condition.append(" and type =" + type );
        }
        return super.paginate(pageNumber, pageSize, "select * ",
                "from "+  TABLE_NAME +" where 21 = 21 " + condition + " order by id desc");
    }



    public List<Greetings> getAllByClientTypeAndType(String clientType,String type){
        return find("select content from jf_tb_greetings where client_type=? and type=?",clientType,type);
    }

    public List<String> getTypesByClientType(String clientType){
        return Db.query("select type from jf_tb_greetings where client_type=? group by type",clientType);
    }
    public List<Object> getClientTypeById(Integer id){
        return Db.query("select clientType from jf_tb_greetings where id=? group by clientType",id);
    }

    public List<Greetings> getAllByClientType(String clientType){
        return find("select content,type from jf_tb_greetings where client_type=?",clientType);
    }
    public String getTypeById(Integer id){
        return Db.queryStr("select clientType from jf_tb_greetings where id=?",id);
    }

    public List<Greetings> getAll(){
        return find("select * from "+TABLE_NAME+" order by id desc");
    }


}
