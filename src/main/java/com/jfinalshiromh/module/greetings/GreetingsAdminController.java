
package com.jfinalshiromh.module.greetings;

import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.utils.ext.route.ControllerBind;

@ControllerBind(controllerKey = "/admin/greetings",viewPath = "/page/admin/greetings")
public class GreetingsAdminController extends BaseController {

    public void index() {
        String client_type = getPara("client_type");
        String type = getPara("type");
        String content = getPara("content");

        setAttr("page", Greetings.me.page(getParaToInt("p", 1), defaultPageSize(), content, client_type, type));
        setAttr("client_type", client_type);
        setAttr("type", type);
        setAttr("content", content);
        render("index.ftl");

    }

    public void add() {


        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET))
            render("add.ftl");
        else if (getModel(Greetings.class, "greetings").save()) {
            String client_type = getPara("greetings.client_type");

            GreetingsVersion.me.updateByType(client_type);
            redirect("/admin/greetings");
        }
    }



    public void edit() {

        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET)) {
            int id = getParaToInt(0,-1);
            if (id != -1) {
                Greetings greetings = Greetings.me.findById(id);

                if (null != greetings) {
                    setAttr("greetings", greetings);
                    render("edit.ftl");
                }
            }else{
                redirect("/admin/greetings");
            }
        } else {

            if (getModel(Greetings.class, "greetings").update()) {
                String client_type = getPara("greetings.client_type");
                GreetingsVersion.me.updateByType(client_type);

                redirect("/admin/greetings");
            }
        }
    }

    public void delete() {
        int id = getParaToInt("greetings_id", -1);
        String client_type = getPara("greetings_type");
        if (id != -1) {
            if (Greetings.me.deleteById(id)) {
                GreetingsVersion.me.updateByType(client_type);
                success("删除成功");
            } else {
                error("id不正确");
            }
        }
    }

    public void info() {
        int id = getParaToInt(0, -1);
        if (id != -1) {
            Greetings greetings = Greetings.me.findById(id);
            if (null != greetings) {
                setAttr("greetings", greetings);
                render("info.ftl");
            } else {
                renderError(500);
            }
        }
    }

    public void getGreetings(){
        success(Greetings.me.getAll());
    }
}
