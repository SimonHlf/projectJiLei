package cn.windy.util.encrypt;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class MD5 {
	static Logger logger = LoggerFactory.getLogger(MD5.class);
    // 全局数组
    private final static String[] strDigits = { "0", "1", "2", "3", "4", "5",
            "6", "7", "8", "9", "a", "b", "c", "d", "e", "f" };

    // 返回形式为数字跟字符串
    private static String byteToArrayString(byte bByte) {
        int iRet = bByte;
        // System.out.println("iRet="+iRet);
        if (iRet < 0) {
            iRet += 256;
        }
        int iD1 = iRet / 16;
        int iD2 = iRet % 16;
        return strDigits[iD1] + strDigits[iD2];
    }

    // 返回形式只为数字
    private static String byteToNum(byte bByte) {
        int iRet = bByte;
        if (iRet < 0) {
            iRet += 256;
        }
        return String.valueOf(iRet);
    }

    // 转换字节数组为16进制字串
    private static String byteToString(byte[] bByte) {
        StringBuffer sBuffer = new StringBuffer();
        for (int i = 0; i < bByte.length; i++) {
            sBuffer.append(byteToArrayString(bByte[i]));
        }
        return sBuffer.toString();
    }

    public static String encode(String strObj) {
        String resultString = null;
        try {
            resultString = new String(URLEncoder.encode(strObj, "gbk"));
            MessageDigest md = MessageDigest.getInstance("MD5");
            // md.digest() 该函数返回值为存放哈希值结果的byte数组
            resultString = byteToString(md.digest(strObj.getBytes()));
        } catch (NoSuchAlgorithmException ex) {
            ex.printStackTrace();
        } catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
        logger.info(resultString);
        return resultString;
    }

    /**
     * 密码加密
     * @param message
     * @return
     */
    public static String getMD5Big(String message) {
        MessageDigest messageDigest = null;
        StringBuffer md5StrBuff = new StringBuffer();
        try {
            messageDigest = MessageDigest.getInstance("MD5");
            messageDigest.reset();
            messageDigest.update(message.getBytes("UTF-8"));
            byte[] byteArray = messageDigest.digest();
            for (int i = 0; i < byteArray.length; i++){
                if (Integer.toHexString(0xFF & byteArray[i]).length() == 1)
                    md5StrBuff.append("0").append(Integer.toHexString(0xFF & byteArray[i]));
                else
                    md5StrBuff.append(Integer.toHexString(0xFF & byteArray[i]));
            }
        } catch (Exception e) {
            throw new RuntimeException();
        }
        return md5StrBuff.toString().toUpperCase();
    }

    
    public static void main(String[] args) throws UnsupportedEncodingException {
    	System.out.println(URLEncoder.encode("订单", "gbk"));
		//System.out.println(encode("appid=wx345c72e0274426f5&body=订单支付&mch_id=1491103042&nonce_str=6718474388129089781&notify_url=http://f.chuizhijiaoyu.com/windy/weChat/pay_back.htm&openid=o3bhT1AypIvKBfM5vRpzaWksjXMQ&out_trade_no=6718474388129089781&spbill_create_ip=122.114.161.157&total_fee=100&trade_type=JSAPI&key=1234567890qazqaz1234567890wertyh"));
	}
}
