package cn.windy.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class CanConfigUtil {




	
	public static String DRIVER = canshu("jdbc.driver");
	/**
	 * 短信所需
	 */
	public static final String accessKeyId = canshu("accessKeyId");
	public static final String accessKeySecret = canshu("accessKeySecret");
	//短信签名
	public static String signName = canshu("signName");
	//短信签名
	public static String templateCode = canshu("templateCode");
	
	
	/**
	 * 支付宝支付所需
	 * @param str
	 * @return
	 */
	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = canshu("app_id");

	// 商户私钥，您的PKCS8格式RSA2私钥
	public static String merchant_private_key = canshu("merchant_private_key");

	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm
	// 对应APPID下的支付宝公钥。
	public static String alipay_public_key = canshu("alipay_public_key");

	// 服务器异步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = canshu("notify_url"); //"http://工程公网访问地址/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = canshu("return_url"); //"http://工程公网访问地址/alipay.trade.page.pay-JAVA-UTF-8/return_url.jsp";

	// 签名方式
	public static String sign_type = "RSA2";

	// 字符编码格式
	public static String charset = "utf-8";

	// 支付宝网关 调试：http://openapi.alipaydev.com/gateway.do 线上：https://openapi.alipay.com/gateway.do 
	public static String gatewayUrl = canshu("gatewayUrl"); //"https://openapi.alipay.com/gateway.do";

	// 日志存放路径
	public static String log_path = canshu("log_path"); //"C:\\";
	
	public static String canshu(String str){
		
		Properties pro = new Properties();
		InputStream is = null;
		
		is = CanConfigUtil.class.getClassLoader().getResourceAsStream("system.properties");
		try {
			pro.load(is);
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		return pro.getProperty(str);
		
	}
	
	
	
}
