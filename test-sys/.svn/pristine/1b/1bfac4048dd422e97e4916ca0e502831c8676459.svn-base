package cn.windy.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

public class FileUpload {

	
	public static List<String> uploadFile(HttpServletRequest request,
			@RequestParam(required = false) MultipartFile[] pictures,String dirName) throws IllegalStateException, IOException {

		String pathUrl = request.getSession().getServletContext().getRealPath("");// 存放的路径
		List<String> fileList = new ArrayList<>();
		Map<String, String> map = new HashMap<String, String>();
		map.put("jpg", "jpg");
		map.put("jpeg", "jpeg");
		map.put("png", "png");
		map.put("bmp", "bmp");
		map.put("gif", "gif");
		if (pictures.length > 0) {
			for (int i = 0; i < pictures.length; i++) {
				//System.out.println(1111);
				String message = "fail";
				// 原始的文件名
				String filename = pictures[i].getOriginalFilename();
				// 获取扩展名
				String extensionName = filename.substring(filename.lastIndexOf(".") + 1);
				// 文件后缀判断

				if (!map.containsKey(extensionName)) {
					message = "文件格式不正确";
					
				} else {
					// long newfileName = UID.next();
					String newfileName = UUID.randomUUID().toString();
					message = dirName+"/" + newfileName + "." + extensionName;
					/*File file = new File(pathUrl + "\\" + message);*/
					File file = new File(pathUrl.substring(0, pathUrl.lastIndexOf("\\")) + "\\" + message);
					pictures[i].transferTo(file);
				}
				fileList.add(message);
			}
		}
		return fileList;

	}
	public static List<String> uploadFile3(HttpServletRequest request,
			@RequestParam(required = false) MultipartFile[] pictures,String dirName) throws IllegalStateException, IOException {

		String pathUrl = request.getSession().getServletContext().getRealPath("");// 存放的路径
		System.out.println(pathUrl);
		List<String> fileList = new ArrayList<>();
		Map<String, String> map = new HashMap<String, String>();
		map.put("jpg", "jpg");
		map.put("jpeg", "jpeg");
		map.put("png", "png");
		map.put("bmp", "bmp");
		map.put("gif", "gif");
		String bpath="";
		if (pictures.length > 0) {
			for (int i = 0; i < pictures.length; i++) {
				//System.out.println(1111);
				String message = "fail";
				// 原始的文件名
				String filename = pictures[i].getOriginalFilename();
				// 获取扩展名
				String extensionName = filename.substring(filename.lastIndexOf(".") + 1);
				// 文件后缀判断

				if (!map.containsKey(extensionName)) {
					message = "文件格式不正确";
					
				} else {
					// long newfileName = UID.next();
					String newfileName = UUID.randomUUID().toString();
					message = dirName+File.separator + newfileName + "." + extensionName;
					File mulu=new File(pathUrl+File.separator+dirName);
					if(!mulu.exists()){
						mulu.mkdirs();
					}
					bpath=pathUrl.substring(0, pathUrl.lastIndexOf(request.getContextPath())) + File.separator + message;
					File file = new File(bpath);
					pictures[i].transferTo(file);
				}
				fileList.add(message);
			}
		}
		return fileList;

	}
	
	public static List<String> uploadFile0(HttpServletRequest request,
			@RequestParam(required = false) MultipartFile[] pictures,String dirName) throws IllegalStateException, IOException {
		String pathUrl = request.getSession().getServletContext().getRealPath("");// 存放的路径
		int i1=pathUrl.lastIndexOf("w");
		pathUrl=pathUrl.substring(0, i1);
		List<String> fileList = new ArrayList<>();
		Map<String, String> map = new HashMap<String, String>();
		map.put("jpg", "jpg");
		map.put("jpeg", "jpeg");
		map.put("png", "png");
		map.put("bmp", "bmp");
		map.put("gif", "gif");
		String bpath="";
		if (pictures.length > 0) {
			for (int i = 0; i < pictures.length; i++) {
				//System.out.println(1111);
				String message = "fail";
				// 原始的文件名
				String filename = pictures[i].getOriginalFilename();
				// 获取扩展名
				String extensionName = filename.substring(filename.lastIndexOf(".") + 1);
				// 文件后缀判断

				if (!map.containsKey(extensionName)) {
					message = "文件格式不正确";
					
				} else {
					String newfileName = UUID.randomUUID().toString();
					message = dirName+File.separator + newfileName + "." + extensionName;
					File mulu=new File(pathUrl+File.separator+dirName);
					System.out.println("mulu:"+mulu);
					if(!mulu.exists()){
						mulu.mkdirs();
					}
					System.out.println("pathUrl:"+pathUrl);
					String linuxS = request.getContextPath();
					String strLiunx = linuxS.replace("/", File.separator);
					bpath=pathUrl+message;
					System.out.println("bpath:"+bpath);
					File file = new File(bpath);
					pictures[i].transferTo(file);
				}
				fileList.add(message);
			}
		}
		return fileList;

	}

	public static List<String> uploadFile2(HttpServletRequest request,
		      @RequestParam(required = false) MultipartFile[] pictures,String dirName) throws IllegalStateException, IOException {

		   String pathUrl = request.getSession().getServletContext().getRealPath("");// 存放的路径
		   System.out.println(pathUrl);
		   int i1=pathUrl.lastIndexOf("w");
		   pathUrl=pathUrl.substring(0, i1);
		   System.out.println(pathUrl);
		   List<String> fileList = new ArrayList<>();
		   Map<String, String> map = new HashMap<String, String>();
		   map.put("jpg", "jpg");
		   map.put("jpeg", "jpeg");
		   map.put("png", "png");
		   map.put("bmp", "bmp");
		   map.put("gif", "gif");
		   String bpath="";
		   if (pictures.length > 0) {
		      for (int i = 0; i < pictures.length; i++) {
		         //System.out.println(1111);
		         String message = "fail";
		         // 原始的文件名
		         String filename = pictures[i].getOriginalFilename();
		         // 获取扩展名
		         String extensionName = filename.substring(filename.lastIndexOf(".") + 1);
		         // 文件后缀判断

		         if (!map.containsKey(extensionName)) {
		            message = "文件格式不正确";
		            
		         } else {
		            // long newfileName = UID.next();
		            String newfileName = UUID.randomUUID().toString();
		            message = dirName+"\\" + newfileName + "." + extensionName;
		            File mulu=new File(pathUrl+"\\"+dirName);
		            if(!mulu.exists()){
		               mulu.mkdirs();
		            }
		            if(pathUrl.lastIndexOf("\\")!=-1){
		                   bpath=pathUrl.substring(0, pathUrl.lastIndexOf("\\")) + "/" + message;
		            }
		            File file = new File(bpath);
		            pictures[i].transferTo(file);
		         }
		         fileList.add(message);
		      }
		   }
		   return fileList;

		}
	//选美  Windows上传图片
			public static List<String> uploadFile4(HttpServletRequest request,
												  @RequestParam(required = false) MultipartFile[] pictures,String dirName) throws IllegalStateException, IOException {

				String pathUrl = request.getSession().getServletContext().getRealPath("");// 存放的路径
				int i1=pathUrl.lastIndexOf("w");
				pathUrl=pathUrl.substring(0, i1);
				List<String> fileList = new ArrayList<>();
				Map<String, String> map = new HashMap<String, String>();
				map.put("jpg", "jpg");
				map.put("jpeg", "jpeg");
				map.put("png", "png");
				map.put("bmp", "bmp");
				map.put("gif", "gif");
				if (pictures.length > 0) {
					for (int i = 0; i < pictures.length; i++) {
						String message = "fail";
						String newmessage="fail";
						// 原始的文件名
						String filename = pictures[i].getOriginalFilename();
						// 获取扩展名
						String extensionName = filename.substring(filename.lastIndexOf(".") + 1);
						// 文件后缀判断

						if (!map.containsKey(extensionName)) {
							message = "文件格式不正确";

						} else {
							String newfileName = UUID.randomUUID().toString();
							message = dirName+"/" + newfileName + "." + extensionName;
							File file = new File(pathUrl.substring(0, pathUrl.lastIndexOf("\\")) + "\\" + message);
							pictures[i].transferTo(file);
							//图片等比例压缩  还放在之前的目录下
							/*newmessage=ThumbnailatorUtils.ImgThumb((pathUrl.substring(0, pathUrl.lastIndexOf("\\")) + "\\" + message),200,300);*/
							newmessage=ThumbnailatorUtils.ImgScale((pathUrl.substring(0, pathUrl.lastIndexOf("\\")) + "\\" + message),0.5);
						}
						fileList.add(dirName+"/"+newmessage);
					}
				}
				return fileList;

			}
	public static void deleteFile(HttpServletRequest request,String filePath){
		String pathUrl = request.getSession().getServletContext().getRealPath("");// 存放的路径
		File file = new File(pathUrl.substring(0, pathUrl.lastIndexOf("\\")) +"\\"+filePath);
		if (file.exists()) {
			file.delete();
		}
	}
	
	public static void main(String[] args) {
		System.out.println("abcdef0000".substring(0,"abcdef0000".lastIndexOf("0000")));
	}
	
}
