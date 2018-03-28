package cn.windy.util;

import java.io.IOException;
import java.util.Properties;

public class SystemConfig {

	private static Properties properties = System.getProperties();

	static{
		try {
			properties.load(SystemConfig.class.getResourceAsStream("/system.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static String get(String key){
		return properties.getProperty(key,"");
	}

	public static boolean getBoolean(String key){
		String value = get(key);
		if(StringUtil.isBlank(value)){
			return false;
		}else{
			if("true".equalsIgnoreCase(value)){
				return true;
			}
			return false;
		}
	}

	public static int getInt(String key){
		String value = get(key);
		if(StringUtil.isBlank(value)){
			return 0;
		}else{
			if(StringUtil.isNumber(value))
				return Integer.parseInt(value);
			return 0;
		}
	}

}
