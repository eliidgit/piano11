package com.jfinalshiromh.module.demolesson;

import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.utils.ext.route.ControllerBind;


@ControllerBind(controllerKey = "/api/demolesson")
public class DemolessonClientController extends BaseController {

        public void index(){
            String name = getPara("name");
            String author = getPara("author");
            String type = getPara("type");
            success(Demolesson.me.page(getParaToInt("p", 1), defaultPageSize(), name, author,type));
        }

    public void getById(){
        String id = getPara("id");
        Demolesson lesson = Demolesson.me.findById(id);
        if (lesson == null){
            error("找不到该示范课程，请核对ID");
        }else{
            success(lesson);
        }
    }
}
