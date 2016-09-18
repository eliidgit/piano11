package com.jfinalshiromh.module.system;

import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.utils.StrUtil;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class SysConfig extends BaseModel<SysConfig> {

    public final static SysConfig me = new SysConfig();

    
    public String findByKey(String key) {
        if (!StrUtil.isBlank(key)) {
            Map<String, Object> map = findAll2Map();
            return map.get(key).toString();
        }
        return null;
    }

    public Map<String, Object> findAll2Map() {
        List<SysConfig> list = super.findByCache(
                Constants.SYSCONFIGCACHE,
                Constants.SYSCONFIGCACHEKEY,
                "select * from jf_tb_sys_config"
        );
        Map<String, Object> map = new HashMap<String, Object>();
        for (SysConfig sc : list) {
            map.put(sc.getStr("key"), sc.getStr("value"));
        }
        return map;
    }

    public void update(String key, String value) {
        if (!StrUtil.isBlank(value)) {
            SysConfig sysConfig = findFirst("select * from jf_tb_sys_config where `key` = ?", key);
            if (sysConfig != null) {
                sysConfig.set("value", value);
                sysConfig.update();
            }
        }
    }
}
