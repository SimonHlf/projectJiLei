package cn.windy.util;

public class StringUtil {

    public static boolean isNumber(String str){
        boolean result = false;
        char []chars = str.toCharArray();
        for(int i=0;i<chars.length;i++){
            if(chars[i]>='0' && chars[i]<='9'){
                result = true;
            }else{
                result = false;
                return result;
            }
        }
        return result;
    }

    public static boolean isBlank(String str){
        if(null == str) return true;
        if("".equals(str.trim())) return true;
        return false;
    }

    /**
     *
     * @param str str的内容是不是 字符串 null，而不是空null
     * @return
     */
    public static boolean isNull(String str){
        if(isBlank(str)) return false;
        if("null".equalsIgnoreCase(str)) return true;
        return false;
    }

    public static String clearNull(String str){
        if(isBlank(str) || "null".equalsIgnoreCase(str)) return "";
        return str.trim();
    }

    public static String getGetMethod(String property){
        return "get"+property.substring(0,1).toUpperCase() + property.substring(1);
    }

}
