package cn.itsoha.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class WeUtils {
    /**
     * uuid
     */
    public static String getUUID(){
        UUID uuid=UUID.randomUUID();
        String str = uuid.toString();
        String uuidStr=str.replace("-", "");
        return uuidStr;
    }

    public static String getDate() {
        SimpleDateFormat dateFormat = (SimpleDateFormat) SimpleDateFormat.getDateInstance();
        dateFormat.applyPattern("yyyy-MM-dd HH:mm:ss");
        return dateFormat.format(new Date());
    }
}