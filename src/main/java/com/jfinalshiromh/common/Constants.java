package com.jfinalshiromh.common;

import com.jfinal.kit.PathKit;
import com.jfinalshiromh.module.system.SysConfig;


public class Constants {
    
    
    public static final String UPLOAD_DIR = PathKit.getWebRootPath() + "/static/upload";

    public static final String UPLOAD_DIR_ROOT = "/static/upload/";

    public static final String UPLOAD_DIR_VIDEO = "video";
    public static final String UPLOAD_DIR_PIC = "pic";
    public static final String UPLOAD_DIR_MIDI = "midi";
    public static final String UPLOAD_DIR_STAVE = "stave";
    public static final String UPLOAD_DIR_OGG = "ogg";
    public static final String UPLOAD_DIR_TXT = "txt";

    public static final String UPLOAD_DIR_HOMEWORK = "homework";

    public static final String UPLOAD_DIR_AVATAR = "avatar";





    
    public static final String GET = "get";
    public static final String POST = "post";

    
    public static final String USER_COOKIE = "user_token_v2";
    public static final String USER_SESSION = "user";
    public static final String BEFORE_URL = "before_url";

    public static final String SESSION_ADMIN_USERNAME = "admin_username";



    
    public static final String SYSCONFIGCACHE = "sysconfigcache";
    public static final String SHIROCACHE = "shirocache";

    public static final String STUDENT_LIKE_CACHE = "likecache";



    
    
    public static final String SYSCONFIGCACHEKEY = "sysconfigcachekey";


    
    public static final String ROLECACHEKEY = "rolecachekey";
    public static final String PERMISSIONCACHEKEY = "permissioncachekey";

    
    public static final String CODE_SUCCESS = "200";
    public static final String CODE_FAILURE = "201";

    
    public static final String DESC_SUCCESS = "success";
    public static final String DESC_FAILURE = "error";
    public static final String OP_ERROR_MESSAGE = "非法操作";
    public static final String DELETE_FAILURE = "删除失败";

    
    public static final String QQ = "qq";
    public static final String SINA = "sina";

    
    public static final String FORGET_PWD = "forgetpwd";
    public static final String REG = "reg";
    public static final String INIT_PWD = "initpwd";
    public static final String SMS_UPDATE_PHONE = "smsupdatePhone";


    
    public static final int RESULT_TOP_N = 4;



    public static final String USER_TYPE_SCHOOL = "4";
    public static final String USER_TYPE_PARENT = "3";
    public static final String USER_TYPE_TEACHER = "2";
    public static final String USER_TYPE_STUDENT = "1";

    public static final String PART_TYPE_LESSON = "1";
    public static final String PART_TYPE_CHILD = "2";
    public static final String PART_TYPE_RESOURCE_VIDEO = "3";
    public static final String PART_TYPE_RESOURCE_MUSIC = "4";
    public static final String PART_TYPE_RESOURCE_HOMEWORK = "5";



    public static final String baseUrl = "";




    public static String getValue(String key) {
        return SysConfig.me.findByKey(key);
    }


}
