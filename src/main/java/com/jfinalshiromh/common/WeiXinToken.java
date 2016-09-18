package com.jfinalshiromh.common;

import com.jfinalshiromh.utils.WeiXinUtil;

import java.util.Date;
import java.util.Map;

public class WeiXinToken {

	private String token;
	private Integer expires;
	private Long createTime;
	private static WeiXinToken weiXinToken;
	private WeiXinToken(){};
	
	private static boolean isTokenExpires(){
		Long time = new Date().getTime()/1000;
		if(weiXinToken==null){
			return false;
		}else if((time-weiXinToken.createTime)>(weiXinToken.expires-200)){
			return false;
		}
		return true;
	}
	public static WeiXinToken getWXToken(){
		if(!isTokenExpires()){
			synchronized (WeiXinToken.class) {
				if(!isTokenExpires()){
					Long time = new Date().getTime()/1000;
					Map<String, String> temp = WeiXinUtil.getToken();
					weiXinToken = new WeiXinToken();
					weiXinToken.setToken(temp.get("access_token"));
					weiXinToken.setExpires(Integer.parseInt(temp.get("expires_in")));
					weiXinToken.setCreateTime(time);
				}
			}
		}
		return weiXinToken;
	}

	public Integer getExpires() {
		return expires;
	}

	public void setExpires(Integer expires) {
		this.expires = expires;
	}

/*	public Long getCreateTime() {
		return createTime;
	}*/

	public void setCreateTime(Long createTime) {
		this.createTime = createTime;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getToken() {
		return token;
	}
	
	
	
}
