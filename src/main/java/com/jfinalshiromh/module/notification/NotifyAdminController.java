package com.jfinalshiromh.module.notification;

import java.util.List;

import org.apache.commons.httpclient.methods.GetMethod;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.module.school.School;
import com.jfinalshiromh.utils.ext.route.ControllerBind;


@ControllerBind(controllerKey = "/admin/notify", viewPath = "/page/admin/notify")
public class NotifyAdminController extends BaseController {

    private static Logger LOGGER = LoggerFactory.getLogger(NotifyAdminController.class);

    public void index() {
    	Integer schoolId = getParaToInt("schoolId",-1);
        setAttr("page", Notification.me.page(getParaToInt("p", 1), defaultPageSize(),schoolId));
        setAttr("schoolId", schoolId);
        render("index.ftl");
    }
    
    public void add(){
    	if(this.getRequest().getMethod().equalsIgnoreCase(Constants.GET)){
    		List<School> schools = School.me.getAll();
    		setAttr("schools", schools);
    		render("add.ftl");
    	}else{
    		if(getModel(Notification.class).save()){
    			redirect("index");
    		}else{
    			render("add.ftl");
    		}
    	}
    }
    public void del(){
    	try {
			Integer id = getParaToInt("id");
			if (Notification.me.deleteById(id)) {
				success();
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("删除失败");
    }



}
