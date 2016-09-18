package com.jfinalshiromh.common;

import com.jfinal.core.Controller;
import com.jfinal.plugin.ehcache.CacheKit;
import com.jfinalshiromh.module.user.User;
import com.jfinalshiromh.utils.Result;
import com.jfinalshiromh.utils.StrUtil;



public class BaseController extends Controller {

    public User getUser() {
        return getSessionAttr(Constants.USER_SESSION);
    }

    public Integer defaultPageSize() {
        return StrUtil.str2int(Constants.getValue("pageSize"));
    }

    public void success() {
        success(null);
    }

    public void success(Object object) {
        renderJson(new Result(Constants.CODE_SUCCESS, Constants.DESC_SUCCESS, object));
    }

    public void error(String message) {
        renderJson(new Result(Constants.CODE_FAILURE, message, null));
    }


    public void clearCache(String cacheName, Object cacheKey) {
        if (cacheKey == null) {
            CacheKit.removeAll(cacheName);
        } else {
            CacheKit.remove(cacheName, cacheKey);
        }
    }


    public User getUser(String token) {
        return User.me.findByToken(token);
    }


}
