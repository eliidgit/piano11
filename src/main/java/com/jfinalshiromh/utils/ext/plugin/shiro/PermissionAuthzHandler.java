
package com.jfinalshiromh.utils.ext.plugin.shiro;

import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;

import java.lang.annotation.Annotation;


class PermissionAuthzHandler extends AbstractAuthzHandler {
    private final Annotation annotation;

    public PermissionAuthzHandler(Annotation annotation) {
        this.annotation = annotation;
    }

    public void assertAuthorized() throws AuthorizationException {
        if (!(annotation instanceof RequiresPermissions))
            return;

        RequiresPermissions rpAnnotation = (RequiresPermissions) annotation;
        String[] perms = rpAnnotation.value();
        Subject subject = getSubject();

        if (perms.length == 1) {
            subject.checkPermission(perms[0]);
            return;
        }
        if (Logical.AND.equals(rpAnnotation.logical())) {
            getSubject().checkPermissions(perms);
            return;
        }
        if (Logical.OR.equals(rpAnnotation.logical())) {
            
            
            boolean hasAtLeastOnePermission = false;
            for (String permission : perms)
                if (getSubject().isPermitted(permission))
                    hasAtLeastOnePermission = true;
            
            
            if (!hasAtLeastOnePermission)
                getSubject().checkPermission(perms[0]);

        }

    }

}
