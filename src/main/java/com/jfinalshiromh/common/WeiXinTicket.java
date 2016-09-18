package com.jfinalshiromh.common;

import java.util.Date;
import java.util.Map;

import com.jfinalshiromh.utils.WeiXinUtil;

public class WeiXinTicket {

	private String ticket;
	private Integer expires;
	private Long createTime;
	
	private static WeiXinTicket weiXinTicket;
	private WeiXinTicket(){};
	
	private static boolean isTokenExpires(){
		Long time = new Date().getTime()/1000;
		if(weiXinTicket==null){
			return false;
		}else if((time-weiXinTicket.createTime)>(weiXinTicket.expires-200)){
			return false;
		}
		return true;
	}
	public static WeiXinTicket getWXTicket(){
		if(!isTokenExpires()){
			synchronized (WeiXinTicket.class) {
				if(!isTokenExpires()){
					Long time = new Date().getTime()/1000;
					Map<String, String> temp = WeiXinUtil.getTicket(WeiXinToken.getWXToken().getToken());
					weiXinTicket = new WeiXinTicket();
					weiXinTicket.setTicket(temp.get("ticket").toString());
					weiXinTicket.setExpires(Integer.parseInt(temp.get("expires_in")));
					weiXinTicket.setCreateTime(time);
				}
			}
		}
		return weiXinTicket;
	}

	public Integer getExpires() {
		return expires;
	}

	public void setExpires(Integer expires) {
		this.expires = expires;
	}

	public Long getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Long createTime) {
		this.createTime = createTime;
	}

	public void setTicket(String ticket) {
		this.ticket = ticket;
	}

	public String getTicket() {
		return ticket;
	}

	
	
	
	
}
