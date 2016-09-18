package com.jfinalshiromh.module.user;

import com.jfinal.plugin.activerecord.Db;
import com.jfinalshiromh.common.BaseModel;

import java.util.List;


public class UserRole extends BaseModel<UserRole> {

    public static final UserRole me = new UserRole();

    public List<UserRole> findByUserId(Integer userId) {
        return super.find("select * from jf_tb_user_role where uid = ?", userId);
    }

    public void deleteByUserId(Integer userId) {
        Db.update("delete from jf_tb_user_role where uid = ?", userId);
    }

    public void deleteByRoleId(Integer roleId) {
        Db.update("delete from jf_tb_user_role where rid = ?", roleId);
    }

}
