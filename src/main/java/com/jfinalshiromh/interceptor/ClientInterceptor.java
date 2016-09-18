package com.jfinalshiromh.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.module.user.User;
import com.jfinalshiromh.utils.Result;
import com.jfinalshiromh.utils.StrUtil;
import com.jfinalshiromh.utils.Result;



public class ClientInterceptor implements Interceptor {

    public void intercept(Invocation inv) {
        String token = inv.getController().getPara("token");
        Result result = new Result(Constants.CODE_SUCCESS, Constants.DESC_SUCCESS, null);
        if (StrUtil.isBlank(token)) {
            result.setCode(Constants.CODE_FAILURE);
            result.setDescription("用户令牌不能为空");
            inv.getController().renderJson(result);
        } else {
            
            User user = User.me.findByToken(token);
            if (user == null) {
                result.setCode(Constants.CODE_FAILURE);
                result.setDescription("用户令牌无效");
                inv.getController().renderJson(result);
            } else {
                inv.invoke();
            }
        }
    }
}
