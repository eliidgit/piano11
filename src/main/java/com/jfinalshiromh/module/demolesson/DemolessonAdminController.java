package com.jfinalshiromh.module.demolesson;

import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.utils.Result;
import com.jfinalshiromh.utils.ext.route.ControllerBind;
import org.apache.shiro.authz.annotation.RequiresPermissions;

import java.util.List;


@ControllerBind(controllerKey = "/admin/demolesson", viewPath = "page/admin/demolesson")
public class DemolessonAdminController extends BaseController {
    @RequiresPermissions("demolesson:index")
    public void index() {
        String name = getPara("name");
        String author = getPara("author");
        setAttr("page", Demolesson.me.page(getParaToInt("p", 1), defaultPageSize(), name, author));
        setAttr("name", name);
        setAttr("author", author);
        render("index.ftl");
    }

    @RequiresPermissions("demolesson:add")
    public void add() {
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET)) {
            render("add.ftl");
        } else if (method.equalsIgnoreCase(Constants.POST)) {
            if(getModel(Demolesson.class).save())
                redirect("/admin/demolesson");
            else
                redirect("/admin");
        }
    }

    @RequiresPermissions("demolesson:delete")
    public void delete() {
        if (Demolesson.me.deleteById(getPara("lesson_id")))
            renderJson(new Result(Constants.CODE_SUCCESS, Constants.DESC_SUCCESS, "删除成功"));
        else
            renderJson(new Result(Constants.CODE_FAILURE, Constants.DESC_FAILURE, Constants.DELETE_FAILURE));
    }

    @RequiresPermissions("demolesson:edit")
    public void edit() {

        String method = getRequest().getMethod();
        Integer id = getParaToInt("id");
        if (method.equalsIgnoreCase(Constants.GET)) {
            setAttr("demolesson", Demolesson.me.findById(id));
            render("edit.ftl");
        } else if (method.equalsIgnoreCase(Constants.POST)) {
            getModel(Demolesson.class).update();
            
            redirect("/admin/demolesson");
        }

    }
    @RequiresPermissions("demolesson:get")
    public void info() {

        String method = getRequest().getMethod();
        Integer id = getParaToInt("id");
        if (method.equalsIgnoreCase(Constants.GET)) {
            setAttr("demolesson", Demolesson.me.findById(id));
            render("info.ftl");
        } else if (method.equalsIgnoreCase(Constants.POST)) {
            redirect("/admin/demolesson");
        }

    }


    @RequiresPermissions("demolesson:edit")
    public void uploadPic() {

        String method = getRequest().getMethod();
        Integer id = getParaToInt("id");
        if (method.equalsIgnoreCase(Constants.GET)) {
            setAttr("demolesson", Demolesson.me.findById(id));
            render("edit.ftl");
        } else if (method.equalsIgnoreCase(Constants.POST)) {
            getModel(Demolesson.class).update();
            
            redirect("/admin/demolesson");
        }

    }

}
