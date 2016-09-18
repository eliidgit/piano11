
package com.jfinalshiromh.utils.ext.plugin.shiro;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;


public class ShiroMethod {

    private static final String NAMES_DELIMETER = ",";

    
    private ShiroMethod() {
    }

    
    protected static Subject getSubject() {
        return SecurityUtils.getSubject();
    }

    
    public static boolean hasRole(String roleName) {
        return getSubject() != null && roleName != null
                && roleName.length() > 0 && getSubject().hasRole(roleName);
    }

    
    public static boolean lacksRole(String roleName) {
        return !hasRole(roleName);
    }

    
    public static boolean hasAnyRoles(String roleNames) {
        boolean hasAnyRole = false;
        Subject subject = getSubject();
        if (subject != null && roleNames != null && roleNames.length() > 0) {
            
            
            for (String role : roleNames.split(NAMES_DELIMETER)) {
                if (subject.hasRole(role.trim())) {
                    hasAnyRole = true;
                    break;
                }
            }
        }
        return hasAnyRole;
    }

    
    public static boolean hasAllRoles(String roleNames) {
        boolean hasAllRole = true;
        Subject subject = getSubject();
        if (subject != null && roleNames != null && roleNames.length() > 0) {
            
            
            for (String role : roleNames.split(NAMES_DELIMETER)) {
                if (!subject.hasRole(role.trim())) {
                    hasAllRole = false;
                    break;
                }
            }
        }
        return hasAllRole;
    }

    
    public static boolean hasPermission(String permission) {
        return getSubject() != null && permission != null
                && permission.length() > 0
                && getSubject().isPermitted(permission);
    }

    
    public static boolean lacksPermission(String permission) {
        return !hasPermission(permission);
    }

    
    public static boolean authenticated() {
        return getSubject() != null && getSubject().isAuthenticated();
    }

    
    public static boolean notAuthenticated() {
        return !authenticated();
    }

    
    public static boolean user() {
        return getSubject() != null && getSubject().getPrincipal() != null;
    }

    
    public static boolean guest() {
        return !user();
    }

    
    public String principal() {
        if (getSubject() != null) {
            
            Object principal = getSubject().getPrincipal();
            return principal.toString();
        }
        return "Guest";
    }
}
