package com.jfinalshiromh.utils;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Formatter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.jfinal.kit.HttpKit;
import com.jfinalshiromh.common.WeiXinTicket;

public class WeiXinUtil {
    private static String tokenURL="https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=SECRET";
    private static String ticketURL="https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=TOKEN&type=jsapi";

    public static final String APP_ID="wx62b3c2d10763666a";
    public static final String SECRET="99e368a9b2e393e667f7ac8adcd03581";

    public static Map<String,String> getToken(){
        Map<String, String> result =new  HashMap<String, String>();
        tokenURL=tokenURL.replace("APPID", APP_ID).replace("SECRET", SECRET);
        String str = HttpKit.get(tokenURL);
        result=new Gson().fromJson(str, new TypeToken<Map<String, String>>() {}.getType());
        return result;
    }
    public static Map<String,String> getTicket(String token){
        Map<String, String> result =new  HashMap<String, String>();
        ticketURL=ticketURL.replace("TOKEN", token);
        String str = HttpKit.get(ticketURL);
        result=new Gson().fromJson(str, new TypeToken<Map<String, String>>() {}.getType());
        return result;
    }

    public static Map<String, String> sign(String jsapi_ticket, String url) {
        Map<String, String> ret = new HashMap<String, String>();
        String nonce_str = create_nonce_str();
        String timestamp = create_timestamp();
        String string1;
        String signature = "";

        
        string1 = "jsapi_ticket=" + jsapi_ticket +
                "&noncestr=" + nonce_str +
                "&timestamp=" + timestamp +
                "&url=" + url;
        System.out.println(string1);

        try
        {
            MessageDigest crypt = MessageDigest.getInstance("SHA-1");
            crypt.reset();
            crypt.update(string1.getBytes("UTF-8"));
            signature = byteToHex(crypt.digest());
        }
        catch (NoSuchAlgorithmException e)
        {
            e.printStackTrace();
        }
        catch (UnsupportedEncodingException e)
        {
            e.printStackTrace();
        }

        ret.put("url", url);
        ret.put("ticket", jsapi_ticket);
        ret.put("nonceStr", nonce_str);
        ret.put("timestamp", timestamp);
        ret.put("sign", signature);

        return ret;
    }

    private static String byteToHex(final byte[] hash) {
        Formatter formatter = new Formatter();
        for (byte b : hash)
        {
            formatter.format("%02x", b);
        }
        String result = formatter.toString();
        formatter.close();
        return result;
    }

    private static String create_nonce_str() {
        return UUID.randomUUID().toString();
    }

    private static String create_timestamp() {
        return Long.toString(System.currentTimeMillis() / 1000);
    }
}
