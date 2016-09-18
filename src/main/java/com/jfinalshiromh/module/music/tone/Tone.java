package com.jfinalshiromh.module.music.tone;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinalshiromh.common.BaseModel;

import com.jfinalshiromh.utils.StrUtil;
import com.jfinalshiromh.utils.ext.plugin.tablebind.TableBind;



@TableBind(tableName = "jf_tb_tone")
public class Tone extends BaseModel<Tone> {

    private static final long serialVersionUID = 1L;
    public static Tone me = new Tone();
    public static String TABLE_NAME = "jf_tb_tone";

    public Page<Tone> page(int pageNumber, int pageSize, String name,String englishName,Integer parentId,String clientType) {
        StringBuffer condition = new StringBuffer();
        if (!StrUtil.isBlank(name)) {
            condition.append(" and a.name like \"%" + name + "%\" ");
        }
        if (!StrUtil.isBlank(englishName)) {
            condition.append(" and a.english_name like \"%" + englishName + "%\" ");
        }
        if (parentId!=null){
            condition.append(" and b.id = " + parentId + " ");
        }
        if (!StrUtil.isBlank(clientType)) {
            condition.append(" and a.client_type= " + clientType + " ");
        }

        return super.paginate(pageNumber, pageSize, "select a.id,a.name,a.english_name,b.name as parent_id,a.tone_id,a.client_type  ",
                "from jf_tb_tone as a,jf_tb_tone as b where a.parent_id=b.id" + condition + " order by a.id desc");
    }




    
    public List<Tone> getAllParentTone(){
        return find("select * from "+ TABLE_NAME+" where parent_id=0 order by id ");
    }
    
    public List<Tone> getAllChildToneByParentId(Integer parentId){
        return find("select * from "+ TABLE_NAME+" where parent_id=? order by id",parentId);
    }
    public List<Tone> getAllByClientType(String type){
        return find("select tone_id,name from "+ TABLE_NAME+" where client_type=? and parent_id!=0 order by id",type);
    }
    
    public Long getCountByClientType(String type){
        return Db.queryLong("select count(*) from "+ TABLE_NAME+" where client_type=? and parent_id!=0 order by id",type);
    }

    public List<Tone> getNameByParentIdAndType(Integer parent_id ,String client_type){
        return find("select name，english_name from jf_tb_tone where parent_id=? and client_type=?",parent_id,client_type);
    }

    public List<String> getNameByClientType(String clientType){
        return Db.query("select name,english_name from jf_tb_tone where client_type=? group by type",clientType);
    }
    public List<Object> getClientTypeById(Integer id){
        return Db.query("select client_type from jf_tb_tone where id=? group by client_type",id);
    }
    public List<Tone> getAll(){
        return find("select * from "+TABLE_NAME+" order by id desc");
    }

    public Tone checkToneNameisExist(String name){
        return findFirst("select * from "+TABLE_NAME+" where name=?",name);
    }
    public Tone checkToneEnglishNameisExist(String name){
        return findFirst("select * from "+TABLE_NAME+" where english_name=?",name);
    }

    public Tone checkToneIdisExist(Integer toneId){
        return findFirst("select * from "+TABLE_NAME+" where tone_id=?",toneId);
    }
    public  String getParentNameByParentId(Integer parentId){


        if (parentId!=null){
            return Db.queryStr( "select  name  from jf_tb_tone where id=?",parentId);
        }
        return null;


    }
    public Integer getParentIdByToneId(Integer toneId){
        if (toneId!=null) {
            return Db.queryInt("select parent_id from jf_tb_tone where tone_id=?", toneId);
        } else{
            System.out.println("toneId==null!!!");
        }
         return null;
    }
    public String getToneNameByToneId(Integer toneId){
        if (toneId!=null) {
            return Db.queryStr("select name from jf_tb_tone where tone_id=?", toneId);
        } else{
            System.out.println("toneId==null!!!");
        }
        return null;
    }

    public List<Tone> getByParentId(Integer Id){

            return find("select tone_id as ids ,name from jf_tb_tone where parent_id =? order by tone_id desc", Id);

    }


}
