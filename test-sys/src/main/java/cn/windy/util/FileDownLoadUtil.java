package cn.windy.util;


import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;
/**
 * 
 * 该工具类实现文件的下载，文档、图片均可
 *@
 */
public class FileDownLoadUtil {
	/**
	 * 
	 * @param response
	 * @param fileName 完整文件路径
	 * @param downloadFilename 在下载框默认显示的文件名--中文是没有问题的,带后缀名
	 
	 * 注意：文件名拼接的时候注意，不同的系统的斜杠不同，使用File.separator自动识别
	 * @throws IOException 
	 * Controller中返回null
	 */
	public static void downLoad(HttpServletResponse response,String fileName,String downloadFilename) throws IOException{
		
		// 对默认下载的文件名编码。不编码的结果就是，在客户端下载时文件名乱码  
        downloadFilename = URLEncoder.encode(downloadFilename, "UTF-8");  
        
        File file = new File(fileName);  
        if (file.exists()) {  
            // 写明要下载的文件的大小  
            response.setContentLength((int) file.length());
            // 设置在下载框默认显示的文件名  
            response.setHeader("Content-Disposition", "attachment;filename="  
                    + downloadFilename);
            // 指明response的返回对象是文件流  
            response.setContentType("application/octet-stream");
            // 读出文件到response  
            // 这里是先需要把要把文件内容先读到缓冲区  
            // 再把缓冲区的内容写到response的输出流供用户下载  
            FileInputStream fileInputStream = new FileInputStream(file);  
            BufferedInputStream bufferedInputStream = new BufferedInputStream(  
                    fileInputStream);  
            byte[] b = new byte[bufferedInputStream.available()];  
            bufferedInputStream.read(b);  
            OutputStream outputStream = response.getOutputStream();  
            outputStream.write(b);  
            // 人走带门 
            bufferedInputStream.close();  
            outputStream.flush();  
            outputStream.close();  
        }

		
	}
	

	
	
}
