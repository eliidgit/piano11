package com.jfinalshiromh.module.user;

import com.jfinal.aop.Before;
import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.interceptor.ClientInterceptor;
import com.jfinalshiromh.utils.ext.route.ControllerBind;

import java.util.HashMap;
import java.util.Map;


@ControllerBind(controllerKey = "/api/user")
@Before(ClientInterceptor.class)
public class UserClientController extends BaseController {

    public void index() {
        Map<String, Object> map = new HashMap<String, Object>();
        String token = getPara("token");
        User user = getUser(token);
        User resultUser = new User();
        resultUser.set("nickname", user.get("nickname"));
        resultUser.set("signature", user.get("signature"));
        resultUser.set("avatar", user.get("avatar"));
        resultUser.set("score", user.get("score"));
        resultUser.set("url", user.get("url"));
        resultUser.set("in_time", user.get("in_time"));
        map.put("user", resultUser);
        
       
        
        
        success(map);
    }

    public void userinfo() {
        String token = getPara("token");
        User user = getUser(token);
        if (user == null) {
            error("无效令牌");
        } else {
            User resultUser = new User();
            resultUser.set("nickname", user.get("nickname"));
            resultUser.set("signature", user.get("signature"));
            resultUser.set("avatar", user.get("avatar"));
            resultUser.set("score", user.get("score"));
            resultUser.set("url", user.get("url"));
            resultUser.set("in_time", user.get("in_time"));
            success(resultUser);
        }
    }
}
