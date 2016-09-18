package com.jfinalshiromh.module.user;

import com.jfinal.plugin.activerecord.Db;
import com.jfinalshiromh.common.BaseModel;

import java.util.List;



public class RolePermission extends BaseModel<RolePermission> {

    public static final RolePermission me = new RolePermission();

    public List<RolePermission> findByRoleId(Integer roleId) {
        return super.find("select * from jf_tb_role_permission where rid = ?", roleId);
    }

    public void deleteByPermissionId(Integer permissionId) {
        Db.update("delete from jf_tb_role_permission where pid = ?", permissionId);
    }

    public void deleteByRoleId(Integer roleId) {
        Db.update("delete from jf_tb_role_permission where rid = ?", roleId);
    }
}
