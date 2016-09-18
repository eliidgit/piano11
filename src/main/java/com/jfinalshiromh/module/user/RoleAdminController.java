package com.jfinalshiromh.module.user;

import com.jfinal.aop.Before;
import com.jfinal.kit.LogKit;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.utils.ext.route.ControllerBind;
import org.apache.shiro.authz.annotation.RequiresPermissions;


@ControllerBind(controllerKey = "/admin/role", viewPath = "page/admin/sysconfig/role")
public class RoleAdminController extends BaseController {

    @RequiresPermissions("setting:role")
    public void index() {
        setAttr("page", Role.me.page(getParaToInt("p", 1), defaultPageSize()));
        render("index.ftl");
    }

    @RequiresPermissions("setting:role")
    @Before(Tx.class)
    public void add() {
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET)) {
            setAttr("permissions", Permission.me.findAll());
            render("add.ftl");
        } else if (method.equalsIgnoreCase(Constants.POST)) {
            Role role = getModel(Role.class);
            role.save();
            Integer[] pids = getParaValuesToInt("permissions");
            Role.me.correlationPermission(role.getInt("id"), pids);
            redirect("/admin/role");
        }
    }

    @RequiresPermissions("setting:role")
    public void edit() {
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET)) {
            Integer id = getParaToInt("id");
            if (id != null) {
                Role role = Role.me.findById(id);
                setAttr("role", role);
                setAttr("permissions", Permission.me.findAll());
                setAttr("rolePermissions", RolePermission.me.findByRoleId(id));
                render("edit.ftl");
            } else {
                LogKit.error("角色ID不能为空");
                renderError(500);
            }
        } else if (method.equalsIgnoreCase(Constants.POST)) {
            Role role = getModel(Role.class);
            role.update();
            Integer[] pids = getParaValuesToInt("permissions");
            Role.me.correlationPermission(role.getInt("id"), pids);
            
            clearCache(Constants.SHIROCACHE, null);
            redirect("/admin/role");
        }
    }

    @RequiresPermissions("setting:role")
    @Before(Tx.class)
    public void delete() {
        Integer roleId = getParaToInt("id");
        if (roleId == null) {
            renderError(500);
        } else {
            Role.me.deleteById(roleId);
            
            UserRole.me.deleteByRoleId(roleId);
            
            RolePermission.me.deleteByRoleId(roleId);
            success();
        }
    }
}
