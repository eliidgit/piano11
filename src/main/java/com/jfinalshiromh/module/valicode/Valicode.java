package com.jfinalshiromh.module.valicode;

import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.utils.DateUtil;

import java.io.Serializable;
import java.util.Date;


 
public class Valicode extends BaseModel<Valicode> implements Serializable {
    public final static Valicode me = new Valicode();

    
    public Valicode findByCodeAndEmail(String code, String email, String type) {
        String nowTime = DateUtil.formatDateTime(new Date());
        return super.findFirst("select * from jf_tb_valicode v where v.status = 0 and v.code = ? and v.target = ? and v.expire_time > ? and v.type = ?", code, email, nowTime, type);
    }

    
    public Valicode findByCodeAndPhone(String code, String phone, String type) {
        String nowTime = DateUtil.formatDateTime(new Date());
        return super.findFirst("select * from jf_tb_valicode v where v.status = 0 and v.code = ? and v.target = ? and v.expire_time > ? and v.type = ?", code, phone, nowTime, type);
    }
}
