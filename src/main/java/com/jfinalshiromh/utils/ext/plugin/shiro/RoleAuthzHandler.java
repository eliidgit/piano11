
package com.jfinalshiromh.utils.ext.plugin.shiro;

import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;

import java.lang.annotation.Annotation;
import java.util.Arrays;


class RoleAuthzHandler extends AbstractAuthzHandler {

    private final Annotation annotation;

    public RoleAuthzHandler(Annotation annotation) {
        this.annotation = annotation;
    }

    public void assertAuthorized() throws AuthorizationException {
        
        RequiresRoles rrAnnotation = (RequiresRoles) annotation;
        String[] roles = rrAnnotation.value();

        if (roles.length == 1) {
            getSubject().checkRole(roles[0]);
            return;
        }
        if (Logical.AND.equals(rrAnnotation.logical())) {
            getSubject().checkRoles(Arrays.asList(roles));
            return;
        }
        if (Logical.OR.equals(rrAnnotation.logical())) {
            
            boolean hasAtLeastOneRole = false;
            for (String role : roles) if (getSubject().hasRole(role)) hasAtLeastOneRole = true;
            
            if (!hasAtLeastOneRole) getSubject().checkRole(roles[0]);
        }
    }
}
