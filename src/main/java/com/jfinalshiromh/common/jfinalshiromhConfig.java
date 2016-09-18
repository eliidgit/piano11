package com.jfinalshiromh.common;

import com.jagregory.shiro.freemarker.ShiroTags;
import com.jfinal.config.Constants;
import com.jfinal.config.*;
import com.jfinal.core.JFinal;
import com.jfinal.ext.handler.ContextPathHandler;
import com.jfinal.ext.interceptor.SessionInViewInterceptor;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.jfinal.render.FreeMarkerRender;
import com.jfinalshiromh.handler.HtmlHandler;
import com.jfinalshiromh.interceptor.CommonInterceptor;
import com.jfinalshiromh.utils.ext.plugin.shiro.ShiroInterceptor;
import com.jfinalshiromh.utils.ext.plugin.shiro.ShiroPlugin;
import com.jfinalshiromh.utils.ext.plugin.tablebind.AutoTableBindPlugin;
import com.jfinalshiromh.utils.ext.plugin.tablebind.ParamNameStyles;
import com.jfinalshiromh.utils.ext.route.AutoBindRoutes;


 
public class jfinalshiromhConfig extends JFinalConfig {
    private Routes routes;
    
    @Override
    public void configConstant(Constants me) {
        
        loadPropertyFile("config.properties");
        me.setDevMode(getPropertyToBoolean("devMode",false));
        me.setFreeMarkerViewExtension("ftl");
        me.setBaseUploadPath(com.jfinalshiromh.common.Constants.UPLOAD_DIR);
        me.setMaxPostSize(2048000);
        me.setFreeMarkerTemplateUpdateDelay(0);

        me.setErrorView(401,"/adminlogin");
        me.setErrorView(403,"/adminlogin");
        me.setError401View("/page/front/401.html");
        me.setError403View("/page/front/403.html");
        me.setError500View("/page/front/500.html");

        FreeMarkerRender.getConfiguration().setSharedVariable("shiro",new ShiroTags());



    }

    
    @Override
    public void configRoute(Routes me) {
        this.routes = me;
        me.add(new AutoBindRoutes());
    }

    
    @Override
    public void configPlugin(Plugins me) {
        
        DruidPlugin druidPlugin = new DruidPlugin(getProperty("jdbcUrl"), getProperty("user"), getProperty("password").trim());
        druidPlugin.setFilters("stat,wall");
        me.add(druidPlugin);
        me.add(new EhCachePlugin());
/*
        AutoTableBindPlugin atbp = new AutoTableBindPlugin(druidPlugin, ParamNameStyles.lowerUnderlineModule("lkk"));*/

        AutoTableBindPlugin atbp = new AutoTableBindPlugin(druidPlugin, ParamNameStyles.lowerUnderlineModule("jf_tb"));
        atbp.addExcludeClasses(BaseModel.class);
        atbp.setShowSql(getPropertyToBoolean("showSql", true));

        me.add(atbp);

        ShiroPlugin shiroPlugin = new ShiroPlugin(routes);
        me.add(shiroPlugin);
    }

    
    @Override
    public void configInterceptor(Interceptors me) {
        me.add(new SessionInViewInterceptor());
        me.add(new ShiroInterceptor());
        me.add(new CommonInterceptor());
    }

    
    @Override
    public void configHandler(Handlers me) {
        me.add(new HtmlHandler());
        me.add(new ContextPathHandler("baseUrl"));
    }

    
    public static void main(String[] args) {


        JFinal.start("src/main/webapp", 8080, "/", 5);

    }
}
