
package com.jfinalshiromh.utils.ext.plugin.shiro;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.kit.StrKit;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.UnauthenticatedException;

public class ShiroInterceptor implements Interceptor {

    public void intercept(Invocation ai) {
        AuthzHandler ah = ShiroKit.getAuthzHandler(ai.getActionKey());
        
        if (ah != null) {
            try {
                
                ah.assertAuthorized();
            } catch (UnauthenticatedException lae) {
                
                
                if (StrKit.notBlank(ShiroKit.getLoginUrl())) {
                    
                    if (ai.getController().getRequest().getMethod().equalsIgnoreCase("GET")) {
                        ai.getController().setSessionAttr(ShiroKit.getSavedRequestKey(), ai.getActionKey());
                    }
                    ai.getController().redirect(ShiroKit.getLoginUrl());
                } else {
                    ai.getController().renderError(401);
                }
                return;
            } catch (AuthorizationException ae) {
                
                
                if (StrKit.notBlank(ShiroKit.getUnauthorizedUrl())) {

                    ai.getController().renderError(401);
                } else {
                    ai.getController().renderError(403);
                }
                return;
            }
        }
        
        ai.invoke();
    }
}
