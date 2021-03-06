
package com.jfinalshiromh.utils.ext.plugin.shiro;

import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.UnauthenticatedException;


class AuthenticatedAuthzHandler extends AbstractAuthzHandler {

    private static AuthenticatedAuthzHandler aah = new AuthenticatedAuthzHandler();

    private AuthenticatedAuthzHandler() {
    }

    public static AuthenticatedAuthzHandler me() {
        return aah;
    }

    public void assertAuthorized() throws AuthorizationException {
        if (!getSubject().isAuthenticated()) {
            throw new UnauthenticatedException("The current Subject is not authenticated.  Access denied.");
        }
    }
}
