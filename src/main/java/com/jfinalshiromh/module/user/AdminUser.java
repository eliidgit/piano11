package com.jfinalshiromh.module.user;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinalshiromh.common.BaseModel;


public class AdminUser extends BaseModel<AdminUser> {

    public final static AdminUser me = new AdminUser();

    public Page<AdminUser> page(Integer pageNumber, Integer pageSize) {
        return super.paginate(pageNumber, pageSize, "select * ", "from jf_tb_admin_user order by in_time desc");
    }

    public AdminUser findByUsername(String username) {
        return super.findFirst("select * from jf_tb_admin_user where username = ?", username);
    }

    public void correlationRole(Integer userId, Integer[] roles) {
        
        Db.update("delete from jf_tb_user_role where uid = ?", userId);
        
        for (Integer rid : roles) {
            UserRole userRole = new UserRole();
            userRole.set("uid", userId)
                    .set("rid", rid)
                    .save();
        }
    }
}
