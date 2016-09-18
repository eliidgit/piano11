package com.jfinalshiromh.interceptor;

import java.util.Date;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.utils.DateUtil;



public class CommonInterceptor implements Interceptor {

    public void intercept(Invocation ai) {
        








        Controller controller = ai.getController();
        
        controller.setSessionAttr("today", DateUtil.formatDate(new Date()));

        controller.setAttr("siteTitle", Constants.getValue("siteTitle"));

        ai.invoke();
    }
}
