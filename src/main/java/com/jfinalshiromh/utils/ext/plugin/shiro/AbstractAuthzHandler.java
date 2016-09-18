
package com.jfinalshiromh.utils.ext.plugin.shiro;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;


abstract class AbstractAuthzHandler implements AuthzHandler {

    
    protected Subject getSubject() {
        return SecurityUtils.getSubject();
    }
}
