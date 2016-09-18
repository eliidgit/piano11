package com.jfinalshiromh.utils;

import com.cloopen.rest.sdk.CCPRestSmsSDK;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.Set;



public class SMSHelper {

    private static final Logger LOGGER = LoggerFactory.getLogger(SMSHelper.class);

    public static String contentID_register = "6756";
    public static String contentID_find_password = "6899";
    public static String contentID_update_password = "6900";
    public static String contentID_recive_password = "6901";
    public static String contentID_common = "93947";


    
    
    @SuppressWarnings("unchecked")
    public static Boolean messagePost(String mobile,String contentId,String smsValicode){
        HashMap<String, Object> result = null;
        
        CCPRestSmsSDK restAPI = new CCPRestSmsSDK();

        
        
        
        
        
        restAPI.init("app.cloopen.com", "8883");

        
        
        
        
        
        restAPI.setAccount("aaf98f894979d7be01497f17999f0441", "c8a57feb6569445aace47afa0e0790b8");


        
        
        
        
        
        restAPI.setAppId("aaf98f894979d7be01497f29cfab0472");


        
        
        
        
        
        
        
        

        
        
        
        
        
        result = restAPI.sendTemplateSMS(mobile,contentId ,new String[]{smsValicode,"1"});
        System.out.println("SDKTestGetSubAccounts result=" + result);
        if("000000".equals(result.get("statusCode"))){
            
            HashMap<String,Object> data = (HashMap<String, Object>) result.get("data");
            Set<String> keySet = data.keySet();
            for(String key:keySet){
                Object object = data.get(key);
                System.out.println(key +" = "+object);
            }
            return true;
        }else{
            
            LOGGER.error("错误码=" + result.get("statusCode") +" 错误信息= "+result.get("statusMsg"));
            return false;
        }
    }
}
