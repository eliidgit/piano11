package com.jfinalshiromh.module.user;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.common.Constants;

import java.util.HashSet;
import java.util.List;
import java.util.Set;


public class Role extends BaseModel<Role> {

    public static final Role me = new Role();

    public Page<Role> page(Integer pageNumber, Integer pageSize) {
        return super.paginate(pageNumber, pageSize, "select * ", "from jf_tb_role");
    }

    public List<Role> findAll() {
        return super.find("select * from jf_tb_role");
    }

    public Set<String> findRoles(String username) {
        List<Role> roles = super.findByCache(Constants.SHIROCACHE, Constants.ROLECACHEKEY + username,
                "select r.* from jf_tb_admin_user u, jf_tb_role r, jf_tb_user_role ur where u.id = ur.uid and r.id = ur.rid and u.username = ?", username);
        Set<String> set = new HashSet<String>();
        for (Role r : roles) {
            set.add(r.getStr("name"));
        }
        return set;
    }

    public void correlationPermission(Integer roleId, Integer[] permissionIds) {
        
        Db.update("delete from jf_tb_role_permission where rid = ?", roleId);
        
        for (Integer pid : permissionIds) {
            RolePermission rolePermission = new RolePermission();
            rolePermission.set("rid", roleId)
                    .set("pid", pid)
                    .save();
        }
    }
}
