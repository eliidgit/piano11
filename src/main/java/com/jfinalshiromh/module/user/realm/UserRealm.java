package com.jfinalshiromh.module.user.realm;

import com.jfinalshiromh.module.user.AdminUser;
import com.jfinalshiromh.module.user.Permission;
import com.jfinalshiromh.module.user.Role;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;


public class UserRealm extends AuthorizingRealm {

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        String username = (String) principals.getPrimaryPrincipal();

        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        authorizationInfo.setRoles(Role.me.findRoles(username));
        authorizationInfo.setStringPermissions(Permission.me.findPermissions(username));

        return authorizationInfo;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String username = (String) token.getPrincipal();

        AdminUser adminUser = AdminUser.me.findByUsername(username);

        if (adminUser == null) {
            throw new UnknownAccountException();
        }





        
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
                adminUser.getStr("username"), 
                adminUser.getStr("password"), 
                ByteSource.Util.bytes(adminUser.getStr("username") + adminUser.getStr("salt")),
                getName()  
        );
        return authenticationInfo;
    }

}
