package com.jfinalshiromh.module.school.piano;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.module.school.piano.classroom.Classroom;
import com.jfinalshiromh.utils.StrUtil;

public class Piano extends BaseModel<Piano> {
	private static final long serialVersionUID = 1L;
	public static final Piano me = new Piano();
	public static String TABLE_NAME = "jf_tb_piano";
	
	public Page<Piano> page(int pageNumber, int pageSize, Integer classroomId,Integer schoolId) {
		StringBuilder condition = new StringBuilder();
		if(StrUtil.checkParamIsNotNull(classroomId)){
			condition.append(" and classroom_id = "+classroomId);
		}

        return super.paginate(pageNumber, pageSize, "select id,piano_id,status,classroom_id ",
                "from " + TABLE_NAME + " where school_id=? "+condition+" order by status desc, id desc",schoolId);
    }
	public Page<Piano> page(int pageNumber, int pageSize,Integer schoolId) {
		StringBuilder condition = new StringBuilder();
		if(schoolId!=-1){
			condition.append(" and school_id = "+schoolId);
		}
        return super.paginate(pageNumber, pageSize, "select id,piano_id,status,classroom_id ,create_time ",
                "from " + TABLE_NAME + " where 1=1  "+condition+" order by status desc, id desc");
    }
	
	
	public boolean checkIsExistByPianoId(String painoId){
		if(painoId==null){
			return false;
		}
		return Db.queryLong("select count(*) from "+ TABLE_NAME+ " where  piano_id=?",painoId)>0?true:false;
	}
	
	
	public Long getPianoCountBySchool(Integer schoolId){
		return Db.queryLong("select count(*) from "+TABLE_NAME+" where school_id=?",schoolId);
	}
	
	public Long getBadPianoCountBySchool(Integer schoolId){
		return Db.queryLong("select count(*) from "+TABLE_NAME+" where school_id=? and status='2'",schoolId);
	}
	
	
	public Integer updateStatus(String status,Integer id){
		return Db.update("update "+TABLE_NAME+" set status=? where id=?",status,id);
	}
	
	public Piano getByPianoId(Integer schoolId,String pianoId){
		return me.findFirst("select id,piano_id,status,classroom_id "+
                " from " + TABLE_NAME + " where school_id=? and piano_id=?",schoolId,pianoId);
	}
	
	
	public Piano getById(Integer id){
		return me.findFirst("select p.id, p.classroom_id, p.piano_id,r.building,r.name,p.create_time,p.description from "+TABLE_NAME+" p , "+
						Classroom.TABLE_NAME+" r where r.id=p.classroom_id and p.id=?",id);
	}
	
	
}
