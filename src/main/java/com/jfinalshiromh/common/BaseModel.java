package com.jfinalshiromh.common;

import com.jfinal.plugin.activerecord.Model;
import org.ocpsoft.prettytime.PrettyTime;

import java.util.Date;
import java.util.Locale;



public class BaseModel<T extends Model> extends Model<T>{
    public String formatDate(Date date) {
        String dateStr = "";
        if (date != null) {
            PrettyTime prettyTime = new PrettyTime(Locale.CHINA);
            dateStr = prettyTime.format(date);
        }
        return dateStr.replace(" ", "");
    }

}
