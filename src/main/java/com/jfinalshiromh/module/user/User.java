package com.jfinalshiromh.module.user;

import com.jfinal.kit.HashKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.utils.DateUtil;
import com.jfinalshiromh.utils.StrUtil;

import java.util.Date;
import java.util.List;


public class User extends BaseModel<User> {
    public static final User me = new User();

    public User findByOpenID(String openId, String type) {
        String sql = "";
        if (type.equalsIgnoreCase(Constants.QQ)) {
            sql = "select u.* from jf_tb_user u where u.qq_open_id = ?";
        } else if (type.equalsIgnoreCase(Constants.SINA)) {
            sql = "select u.* from jf_tb_user u where u.sina_open_id = ?";
        }
        return super.findFirst(sql, openId);
    }

    public User findByToken(String token) {
        return super.findFirst("select u.* from jf_tb_user u where u.token = ?", token);
    }







    public User localLogin(String email, String password) {
        return super.findFirst("select * from jf_tb_user where email = ? and password = ?", email, password);
    }

    public User localPhoneLogin(String phone, String password, String type) {
        return super.findFirst("select u.*,t.id tid from jf_tb_user u ,jf_tb_teacher t where t.phone=u.phone and u.phone = ? and u.password = ? and u.type = ?", phone, password, type);
    }
    
    public User localStuPhoneLogin(String phone, String password, String type) {
        return super.findFirst("select u.*,g.name gname,g.id gid,c.id cid,c.name cname,s.id sid  from jf_tb_user u,jf_tb_student s,jf_tb_class c ,jf_tb_grade g "
        		+ "where u.phone=s.phone and s.class_id=c.id and c.gid=g.id and u.phone = ? and u.password = ? and u.type = ?", phone, password, type);
    }

    
    public User schoolPhoneLogin(String phone, String password) {
        return super.findFirst("select * from jf_tb_user where phone = ? and password = ? and type in ('4','2') ", phone, password);
    }


    public User findByEmail(String email) {
        return super.findFirst("select * from jf_tb_user where email = ?", email);
    }

    public User findByPhone(String phone) {
        return super.findFirst("select * from jf_tb_user where phone = ?", phone);
    }

    public User findByNickname(String nickname) {
        return super.findFirst("select * from jf_tb_user where nickname = ?", nickname);
    }

    
    public Integer findDayByAuthorId(String authorId) {
        String startTime = DateUtil.formatDateTime(new Date(), DateUtil.FORMAT_DATE);
        String endTime = DateUtil.formatDateTime(new Date(), DateUtil.FORMAT_DATE) + " 23:59:59";
        return Db.queryInt("select max(day) from jf_tb_mission where author_id = ? and (in_time between ? and ?)", authorId, startTime, endTime);
    }

    public int countUsers() {
        return super.find("select id from jf_tb_user").size();
    }

    
    public Page<User> page(int pageNumber, int pageSize, String nickname, String email,String type,Integer schoolId) {
        StringBuffer condition = new StringBuffer();
        if (!StrUtil.isBlank(nickname)) {
            condition.append(" and nickname like \"%" + nickname + "%\" ");
        }
        if (!StrUtil.isBlank(email)) {
            condition.append(" and email like \"%" + email + "%\" ");
        }
        if (!StrUtil.isBlank(type)) {
            condition.append(" and type = "+ type);
        }
        if (schoolId!=null && schoolId!=0) {
            condition.append(" and school_id = "+ schoolId);
        }
        return super.paginate(pageNumber, pageSize, "select * ",
                "from jf_tb_user where 1 = 1 " + condition + " order by in_time desc");
    }

    public List<User> list() {
        return super.find("select * from jf_tb_user");
    }

    public List<User> findToday() {
        String start = DateUtil.formatDate(new Date()) + " 00:00:00";
        String end = DateUtil.formatDate(new Date()) + " 23:59:59";
        return super.find("select nickname, email, qq_nickname, sina_nickname, qq_avatar, sina_avatar, in_time " +
                "from jf_tb_user where in_time between ? and ? order by in_time desc", start, end);
    }

    

    public int updatePhoneByPhone(String newPhone, String phone) {
        return Db.update("update jf_tb_user set phone=? where phone=?", newPhone, phone);
    }
    
    public int updatePicUrlByPhone(String picUrl,String phone){
    	return Db.update("update jf_tb_user set avatar=? where phone=?", picUrl, phone);
    }
    
    public int updateNameByPhone(String phone,String name){
    	return Db.update("update jf_tb_user set nickname=? where phone=?", name, phone);
    }
    
    
    public Boolean checkUserIsExist(String phone){
    	if(Db.queryLong("select count(*) from jf_tb_user where phone=?",phone)>0){
    		return false;
    	}
    	return true;
    }
    
    
    public int updatePassword(String phone,String password){
    	return Db.update("update jf_tb_user set password=? where phone=?",HashKit.md5(password),phone);

    }
    public int updatePasswordAndName(String phone,String password,String nickname){
    	return Db.update("update jf_tb_user set password=? ,nickname =? where phone=?",HashKit.md5(password),nickname,phone);
    }
    
    public int updateFirst(String phone){
    	return Db.update("update jf_tb_user set first_login=2 where phone=?",phone);
    }
    

}
