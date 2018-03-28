package cn.windy.module.examination.controller;

import cn.windy.module.admin.hibernate.model.Org;
import cn.windy.module.admin.hibernate.model.User;
import cn.windy.module.admin.service.IOrgService;
import cn.windy.module.core.controller.BaseController;
import cn.windy.module.examination.inter.InterJson;
import cn.windy.module.examination.mybatis.model.FrontUser;
import cn.windy.module.examination.mybatis.model.WindyOrg;
import cn.windy.module.examination.service.IFrontUserService;
import cn.windy.module.examination.service.IWindyOrgService;
import cn.windy.module.examination.service.QuesTypeService;
import cn.windy.module.examination.service.impl.WindyOrgService;
import cn.windy.module.util.WindyConstants;
import cn.windy.util.DateUtil;
import cn.windy.util.FileDownLoadUtil;
import cn.windy.util.Pagination;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import cn.windy.util.StringUtil;
import cn.windy.util.encrypt.MD5;

import com.alibaba.fastjson.JSON;

import org.hibernate.annotations.common.util.StringHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/admin/frontuser")
public class FrontUserController extends BaseController {

    @Autowired
    private IFrontUserService frontUserService;

    @Autowired
	private IOrgService orgService;

	@Autowired
	private QuesTypeService quesTypeService;

	@Autowired
	private IWindyOrgService windyOrgService;
    /**
     * 列表，条件查询可用
     * @param frontUser
     * @param page
     * @param nickName
     * @param theSignature
     * @param orgId
     * @param mm
     * @return
     */
    @RequestMapping("/list")
    public String list(FrontUser frontUser, Pagination page,String nickName,String theSignature,String attr0,Long orgId,ModelMap mm){

		User user=(User) getSession(WindyConstants.SESSION_USER);
    	//判断后台登录的是否有权限查看所有机构的考试数据
		boolean s=quesTypeService.getRole(user.getId());
		List<Map<String,Object>> list;
		List<WindyOrg> windyOrgList;
		if(s){
			//if(!StringUtil.isBlank(attr0)){
				list = frontUserService.findAll(page,nickName,theSignature,attr0,orgId);
				page.setTotal(frontUserService.countAll(nickName,theSignature,attr0,orgId));
				mm.put("list",list);
			//}
			windyOrgList = windyOrgService.findAll();
		} else {
			//if(!StringUtil.isBlank(attr0)){
			//	list = frontUserService.findAll(page,nickName,theSignature,attr0,user.getUpdateUser());
			//	page.setTotal(frontUserService.countAll(nickName,theSignature,attr0,user.getUpdateUser()));
			//	mm.put("list",list);
			//}
			List<Org> lists = orgService.findByChild(user.getUpdateUser());//所有子级对象
			List<Long> ids = new ArrayList<Long>();
			for (Org org : lists) {
				ids.add(org.getId());
			}
			ids.add(user.getUpdateUser());
			try {
				mm.put("list",frontUserService.ztreeMenuTable(page,ids,attr0));
			} catch (Exception e) {
				e.printStackTrace();
			}
			Pagination countPage = new Pagination();
			countPage.setPageSize(0);
			page.setTotal((Long) frontUserService.ztreeMenuTable(countPage,ids,attr0).get(0).get("TOTAL"));
			windyOrgList = windyOrgService.findByInsId(user.getUpdateUser());
		}
		String nodes = JSON.toJSONString(windyOrgList);
		mm.put("nodes",nodes.replaceAll("icon","_icon_"));

        mm.put("page",page);
        mm.put("nickName",nickName);
        mm.put("theSignature",theSignature);
        if(attr0!=null){
        	mm.put("attr0",attr0);
        }
        return "admin/examination/frontuser/list";
    }

    /**
     * 添加前查找所有机构
     * @return
     */
    @RequestMapping("/getWindyOrgList")
    public  String getWindyOrgList(ModelMap map){
    	List<WindyOrg> windyOrgList=frontUserService.getWindyOrgList();
    	map.put("windyOrgList", windyOrgList);
    	return "admin/examination/frontuser/add";
    }
    
    
    /**
     * 添加
     * @param frontUser
     * @param page
     * @param picture
     * @param ma
     * @param request
     * @return
     * @throws IllegalStateException
     * @throws IOException
     */
    @RequestMapping(value = "/add")
//    @ResponseBody
    public String add(FrontUser frontUser,Pagination page,ModelMap mm,@RequestParam(required = false, value = "headImages") MultipartFile[] picture) throws IllegalStateException, IOException{
        
//    	String pathUrl = request.getSession().getServletContext().getRealPath("");// 存放的路径
//    	String result="false";
//    	Map<String,Object> mm=new HashMap<>();
    	/*for (int i = 0; i < picture.length; i++) {
			// 原始的文件名
			String filename = picture[i].getOriginalFilename();
			// 获取扩展名
			String extensionName = filename.substring(filename.lastIndexOf(".") + 1);
			Map<String, String> map = new HashMap<String, String>();
			map.put("jpg", "jpg");
			map.put("jpeg", "jpeg");
			map.put("png", "png");
			map.put("bmp", "bmp");
			map.put("gif", "gif");
			// 文件后缀判断
			if (!map.containsKey(extensionName)) {
				*//*System.out.println(extensionName);*//*
				result = "pictureErroe";
				mm.put("result", result);
				return mm;
				// 文件读入
			} else {
				String newfileName = UUID.randomUUID().toString();// 创建随机的图片名称

				String pictureurl = "image" + File.separator + newfileName + "." + extensionName;// 图片的全路径

				frontUser.setHeadPortrait(pictureurl);// 图片只有地址没有名称
				map.put("imgUrl",pictureurl);
				String resultUrl = pathUrl.substring(0, pathUrl.lastIndexOf(File.separator));
				resultUrl = resultUrl.substring(0,resultUrl.lastIndexOf(File.separator)) + File.separator + pictureurl;
				File fi = new File(resultUrl);
				picture[i].transferTo(fi);// 文件写入
				// long newfileName = UID.next();
			*//*	String newfileName = UUID.randomUUID().toString();// 创建随机的图片名称
						*//**//*String.valueOf(UID.next());*//**//*
				String pictureurl = "image/" + newfileName + "." + extensionName;// 图片的全路径
				frontUser.setHeadPortrait(pictureurl);// 图片只有地址没有名称
				pathUrl = pathUrl.substring(0, pathUrl.lastIndexOf("\\"));
				
				File fi = new File(pathUrl + "\\image\\" + newfileName + "." + extensionName);
				*//**//*System.out.println(pathUrl);*//*

			}
		}*/
		frontUser.setRegTime(DateUtil.getDate());
    	frontUser.setPassword(MD5.getMD5Big("123456"));
    	frontUserService.add(frontUser);
//    	result="true";
//    	mm.put("result", result);
        return list(new FrontUser(),new Pagination(),null,null,null,null,mm);
    }

    /**
     * 根据id查找
     * @param id
     * @return
     */
    @RequestMapping("findById")
    public String findById(Long id,ModelMap map){
    	FrontUser frontUser=frontUserService.findById(id);
    	List<WindyOrg> windyOrgList=frontUserService.getWindyOrgList();
    	map.put("frontUser", frontUser);
    	map.put("windyOrgList", windyOrgList);
    	return "admin/examination/frontuser/edit";
    }
    
    
    /**
     * 修改
     * @param
     * @param
     * @return
     * @throws IOException 
     * @throws IllegalStateException 
     */
    @RequestMapping("/edit")
//    @ResponseBody
    public String edit(FrontUser frontUser,ModelMap mm,@RequestParam(required = false, value = "headImages") MultipartFile[] picture,HttpServletRequest request) throws IllegalStateException, IOException{
        
//    	String pathUrl = request.getSession().getServletContext().getRealPath("");// 存放的路径
//    	String result="false";
//    	Map<String,Object> mm=new HashMap<>();
//    	if(!picture[0].isEmpty()) {
//    		for (int i = 0; i < picture.length; i++) {
//    			// 原始的文件名
//    			String filename = picture[i].getOriginalFilename();
//    			// 获取扩展名
//    			String extensionName = filename.substring(filename.lastIndexOf(".") + 1);
//    			Map<String, String> map = new HashMap<String, String>();
//    			map.put("jpg", "jpg");
//    			map.put("jpeg", "jpeg");
//    			map.put("png", "png");
//    			map.put("bmp", "bmp");
//    			map.put("gif", "gif");
//    			// 文件后缀判断
//    			if (!map.containsKey(extensionName)) {
//    				/*System.out.println(extensionName);*/
//    				result = "pictureErroe";
//    				mm.put("result", result);
//    				return mm;
//    				// 文件读入
//    			} else {
//					String newfileName = UUID.randomUUID().toString();// 创建随机的图片名称
//
//					String pictureurl = "image" + File.separator + newfileName + "." + extensionName;// 图片的全路径
//
//					frontUser.setHeadPortrait(pictureurl);// 图片只有地址没有名称
//					map.put("imgUrl",pictureurl);
//					String resultUrl = pathUrl.substring(0, pathUrl.lastIndexOf(File.separator));
//					resultUrl = resultUrl.substring(0,resultUrl.lastIndexOf(File.separator)) + File.separator + pictureurl;
//					File fi = new File(resultUrl);
//					picture[i].transferTo(fi);// 文件写入
//    				/*// long newfileName = UID.next();
//    				String newfileName = UUID.randomUUID().toString();// 创建随机的图片名称
//    						*//*String.valueOf(UID.next());*//*
//    				String pictureurl = "image/" + newfileName + "." + extensionName;// 图片的全路径
//    				frontUser.setHeadPortrait(pictureurl);// 图片只有地址没有名称
//    				pathUrl = pathUrl.substring(0, pathUrl.lastIndexOf("\\"));
//
//    				File fi = new File(pathUrl + "\\image\\" + newfileName + "." + extensionName);
//    				*//*System.out.println(pathUrl);*//*
//    				picture[i].transferTo(fi);// 文件写入*/
//    			}
//    		}
//    	}
    	

    	frontUserService.Update(frontUser);
//    	result="true";
//    	mm.put("result", result);
        return list(new FrontUser(),new Pagination(),null,null,null,null,mm);
    }
    
    @RequestMapping("/delete")
    public String delete(String ids,Pagination page,ModelMap mm){
        frontUserService.delete(ids);
        return list(new FrontUser(),page,null,null,null,null,mm);
    }


	/**
	 *  frontUser导入 Excel
	 * @return
	 */
	@RequestMapping("/importFrontUserExcel")
	public String ImportFrontUserExcel(@RequestParam(value = "file",required = false) MultipartFile multipartFile,ModelMap mm,Integer pid){
		frontUserService.ImportFrontUserExcel(multipartFile,pid);
		return list(new FrontUser(),new Pagination(),null,null,null,null,mm);
	}


	/**
	 * 恢复默认密码
	 */
	@RequestMapping("/recoveryPassword")
	public String recoveryPassword(ModelMap mm,String ids){
		frontUserService.recoveryPassword(ids);
		return list(new FrontUser(),new Pagination(),null,null,null,null,mm);
	}


	/**
	 * 后台点击树形菜单
	 */
	@RequestMapping("/ztreeMenuTable")
	public String ztreeMenuTable(ModelMap mm,Pagination page,Long orgId,String attr0){
		List<Org> list = orgService.findByChild(orgId);//所有子级对象
		List<Long> ids = new ArrayList<Long>();
		for (Org org : list) {
			ids.add(org.getId());
		}
		ids.add(orgId);
		try {
			mm.put("list",frontUserService.ztreeMenuTable(page,ids,attr0));
		} catch (Exception e) {
			e.printStackTrace();
		}
		Pagination countPage = new Pagination();
		countPage.setPageSize(0);
		page.setTotal((Long) frontUserService.ztreeMenuTable(countPage,ids,attr0).get(0).get("TOTAL"));
		mm.put("page",page);
		mm.put("orgId",orgId);
		return "admin/examination/frontuser/ztreeMenuTable";
	}


	/**
	 * 下载考生模板
	 */
	@RequestMapping("/downloadTemplate")
	@ResponseBody
	public String downloadTemplate(){
		String pathUrl = getRequest().getSession().getServletContext().getRealPath("");
		String ServerUrl = pathUrl + File.separator + "file" + File.separator + "批量导入考生模板.xls";
		try {
			FileDownLoadUtil.downLoad(getResponse(),ServerUrl,"批量导入考生模板.xls");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	

}
