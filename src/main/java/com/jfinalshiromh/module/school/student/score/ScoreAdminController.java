package com.jfinalshiromh.module.school.student.score;

import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.utils.ext.route.ControllerBind;
import org.apache.shiro.authz.annotation.RequiresPermissions;


@ControllerBind(controllerKey = "/admin/score", viewPath = "/page/admin/score")
public class ScoreAdminController extends BaseController {
    @RequiresPermissions("score:index")
    public void index() {
        String name = getPara("name");
        setAttr("page", StudentScore.me.page(getParaToInt("p", 1), defaultPageSize(), name));
        setAttr("name", name);
        render("index.ftl");
    }

    public void edit() {
        
    }

    @RequiresPermissions("score:delete")
    public void delete() {
        int id = getParaToInt("score_id", -1);
        if (id != -1) {
            if (StudentScore.me.deleteById(id))
                success("删除成功");
            else
                error("删除失败");
            
            
        } else {
            error("作业ID不正确");
        }
    }

    public void info() {
        
    }
}
