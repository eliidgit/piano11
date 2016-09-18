package com.jfinalshiromh.module.school.piano.malfunction;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.module.school.piano.Piano;
import com.jfinalshiromh.module.school.piano.classroom.Classroom;

public class PianoMalfunction extends BaseModel<PianoMalfunction> {
	private static final long serialVersionUID = 1L;
	public static final PianoMalfunction me = new PianoMalfunction();
	public static String TABLE_NAME = "jf_tb_piano_malfunction";
	
	public Page<PianoMalfunction> page(int pageNumber, int pageSize, Integer schoolId) {
		StringBuilder sb = new StringBuilder();
		if(schoolId!=-1){
			sb.append(" and p.school_id="+schoolId);
		}
        return super.paginate(pageNumber, pageSize, "select m.pid, m.id,m.type,m.description,m.status,m.dispose_mode,m.create_time ,p.piano_id, c.building,c.name",
                " from " + TABLE_NAME + " m ,"+Piano.TABLE_NAME+" p ,"+Classroom.TABLE_NAME+" c where p.id=m.pid and c.id=p.classroom_id "+sb+" order by status,dispose_mode,id");
    }
	
	public List<PianoMalfunction> getTop(int num,Integer schoolId){
		return me.find("select m.pid, m.id,m.type,m.description,m.status,m.dispose_mode,m.create_time ,p.piano_id, c.building,c.name  from " + TABLE_NAME + " m ,"+Piano.TABLE_NAME+" p ,"+Classroom.TABLE_NAME+" c where p.id=m.pid and c.id=p.classroom_id and p.school_id=? order by status,dispose_mode,id limit ?",schoolId,num);
	}
	
	public Integer updateStatus(String status ,Integer id){
		return Db.update("update "+ TABLE_NAME+" set status=? where id=?",status,id);
	}
	
	public PianoMalfunction getByPianoId(Integer schoolId,String pianoId){
		return me.findFirst("select m.pid, m.id,m.type,m.description,m.status,m.dispose_mode,m.create_time ,p.piano_id, c.building,c.name"+
                " from " + TABLE_NAME + " m ,"+Piano.TABLE_NAME+" p ,"+Classroom.TABLE_NAME+" c where p.id=m.pid and c.id=p.classroom_id and p.school_id=? and p.piano_id=?",schoolId,pianoId);
	}
	
	public Integer getIdByPid(Integer pid){
		return Db.queryInt("select id from " +TABLE_NAME+" where pid=?",pid);
	}
	
	
	
	
	
}
