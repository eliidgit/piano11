
package com.jfinalshiromh.utils.ext.plugin.shiro;

import org.apache.shiro.authz.AuthorizationException;


interface AuthzHandler {
    
    public void assertAuthorized() throws AuthorizationException;
}
