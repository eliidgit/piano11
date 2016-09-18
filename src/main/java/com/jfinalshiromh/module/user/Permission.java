package com.jfinalshiromh.module.user;

import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.common.Constants;

import java.util.HashSet;
import java.util.List;
import java.util.Set;


public class Permission extends BaseModel<Permission> {

    public static final Permission me = new Permission();

    public List<Permission> findByPid(Object pid) {
        return super.find("select * from jf_tb_permission where pid = ?", pid);
    }

    public List<Permission> findAll() {
        List<Permission> permissions = this.findByPid(0);
        for (Permission p : permissions) {
            List<Permission> permissionList = this.findByPid(p.get("id"));
            p.put("childPermission", permissionList);
        }
        return permissions;
    }

    public Set<String> findPermissions(String username) {
        List<Permission> permissions = super.findByCache(Constants.SHIROCACHE, Constants.PERMISSIONCACHEKEY + username,
                "select p.* from jf_tb_admin_user u, jf_tb_role r, jf_tb_permission p, " +
                        "jf_tb_user_role ur, jf_tb_role_permission rp where u.id = ur.uid and r.id = ur.rid and r.id = rp.rid and p.id = rp.pid and u.username = ?", username);
        Set<String> set = new HashSet<String>();
        for (Permission p : permissions) {
            set.add(p.getStr("name"));
        }
        return set;
    }
}
