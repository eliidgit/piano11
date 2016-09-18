
package com.jfinalshiromh.utils.ext.plugin.shiro;

import java.util.concurrent.ConcurrentMap;



public class ShiroKit {

    
    private static String successUrl = "/admin/index";

    
    private static String loginUrl = "/adminlogin";


    
    private static String unauthorizedUrl = "/401.html";


    
    private static String SAVED_REQUEST_KEY = "jfinalShiroSavedRequest";


    
    private static ConcurrentMap<String, AuthzHandler> authzMaps = null;

    
    private ShiroKit() {
    }

    static void init(ConcurrentMap<String, AuthzHandler> maps) {
        authzMaps = maps;
    }

    static AuthzHandler getAuthzHandler(String actionKey) {
        /*
		if(authzMaps.containsKey(controllerClassName)){
			return true;
		}*/
        return authzMaps.get(actionKey);
    }

    public static final String getSuccessUrl() {
        return successUrl;
    }

    public static final void setSuccessUrl(String successUrl) {
        ShiroKit.successUrl = successUrl;
    }

    public static final String getLoginUrl() {
        return loginUrl;
    }

    public static final void setLoginUrl(String loginUrl) {
        ShiroKit.loginUrl = loginUrl;
    }

    public static final String getUnauthorizedUrl() {
        return unauthorizedUrl;
    }

    public static final void setUnauthorizedUrl(String unauthorizedUrl) {
        ShiroKit.unauthorizedUrl = unauthorizedUrl;
    }

    
    public static final String getSavedRequestKey() {
        return SAVED_REQUEST_KEY;
    }
}
