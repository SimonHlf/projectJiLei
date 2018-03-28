package cn.windy.module.admin.controller;

import cn.windy.module.admin.hibernate.model.Org;
import cn.windy.module.admin.hibernate.model.User;
import cn.windy.module.admin.service.IOrgService;
import cn.windy.module.admin.service.IUserService;
import cn.windy.module.examination.mybatis.model.WindyOrg;
import cn.windy.module.examination.service.IWindyOrgService;
import cn.windy.module.examination.service.QuesTypeService;
import cn.windy.util.DateUtil;
import cn.windy.util.Pagination;
import cn.windy.util.StringUtil;
import cn.windy.module.util.WindyConstants;

import java.math.BigInteger;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/user/")
public class UserController extends AdminBaseController {

	@Autowired
	IUserService userService;

	@Autowired
	IOrgService orgService;

	@Autowired
	QuesTypeService quesTypeService;

	@Autowired
	IWindyOrgService windyOrgService;

	@RequestMapping("/list")
	public String list(User user, Pagination page, ModelMap mm) {
		User user1 = (User) getSession(WindyConstants.SESSION_USER);
		boolean s = quesTypeService.getRole(user1.getId());
		List<WindyOrg> windyOrgList;
		if(s){
			windyOrgList=quesTypeService.getWindyOrgList();
			mm.put("list",userService.findAll(page,null,user.getName(),0));
			BigInteger bi = (BigInteger) userService.findAll(null,null,user.getName(),1).get(0).get("TOTAL");
			page.setTotal(bi.longValue());
		} else {
			windyOrgList = quesTypeService.getquesTypeNow(user.getUpdateUser());
			mm.put("notNodes","not");
			mm.put("list",userService.findAll(page,user1.getUpdateUser(),user.getName(),0));
			BigInteger bi = (BigInteger) userService.findAll(null,user1.getUpdateUser(),user.getName(),1).get(0).get("TOTAL");
			page.setTotal(bi.longValue());
		}
		String nodes = JSON.toJSONString(windyOrgList);
		mm.put("nodes",nodes.replaceAll("icon","_icon_"));
		mm.put("page",page);
		mm.put("user",user);
		return "admin/admin/user/list";
	}

	@RequestMapping("/del")
	public String add(String ids, ModelMap mm) {
		userService.delete(ids);
		return list(new User(), new Pagination(), mm);
	}

	@RequestMapping("/jumpAdd")
	public String jumpAdd(ModelMap mm){
		mm.put("orgList",orgService.findAll(null));
		return "admin/admin/user/add";
	}

	@RequestMapping("/add")
	public String add(User user, ModelMap mm) {
		user.setAddTime(DateUtil.getDate());
		userService.add(user);
		/*User user = getCurUser();
		if (item.getId()!= null) {
			User user2=userService.findById(item.getId());
			user2.setUpdateTime(DateUtil.getDate());
			user2.setUpdateUser(user.getId());
			user2.setAccount(item.getAccount());
			user2.setName(item.getName());
			user2.setCode(item.getCode());
			user2.setMobile(item.getMobile());
			user2.setPassword(item.getPassword());
			userService.add(user2);
		} else {
			item.setAddTime(DateUtil.getDate());
			item.setAddUser(user.getId());
			userService.add(item);
		}*/
		return list(new User(), new Pagination(), mm);
	}
	
	
	
	
	@RequestMapping("/edit")
	public String edit(ModelMap mm,Long id) {

		mm.put("user", userService.findById(id));
		mm.put("orgList",orgService.findAll(null));
		return "admin/admin/user/edit";
	}

	@RequestMapping("/thisEdit")
	public String thisEdit(ModelMap mm){
		User user=(User) getSession(WindyConstants.SESSION_USER);

		mm.put("user", userService.findById(user.getId()));
//		mm.put("orgList",orgService.findAll(null));
		return "admin/admin/user/ThisEdit";
	}

	@RequestMapping("/thisUserSave")
	public String thisUserSave(User user,ModelMap mm){
		userService.add(user);
		mm.put("user", user);
		return "admin/admin/user/ThisEdit";
	}

	@RequestMapping("/details")
	public String details(User item, ModelMap mm) {
		mm.put("user", userService.findById(item.getId()));
		return "admin/admin/user/details";

	}
	
	@RequestMapping("/getNum")
	public String getNum(ModelMap mm){
		User user=getCurUser();
		if(isUser()){
			mm.put("num", user.getNewsNum());
		}
		return "admin/admin/user/getNum";
	}
	@RequestMapping("/num")
	public String num(Integer newsNum,ModelMap mm){
		User user=getCurUser();
		if(isUser()){
			user.setNewsNum(newsNum);
			userService.add(user);
			mm.put("num", user.getNewsNum());
		}
		return "admin/admin/user/getNum";
	}
	
	@RequestMapping("updateUser")
	public String updateUser(ModelMap map){
		User user=(User) getSession().getAttribute(WindyConstants.SESSION_USER);
		
		map.put("user", user);
		return "admin/admin/user/listNow";
	}
	
	
	@RequestMapping("/addNow")
	public String addNow(User user, ModelMap mm) {
//		User user = getCurUser();
//		User user2=null;
//		if (item.getId()!= null) {
//			 user2=userService.findById(item.getId());
//			user2.setUpdateTime(DateUtil.getDate());
//			user2.setUpdateUser(user.getId());/*
//			user2.setAccount(item.getAccount());*/
//			user2.setName(item.getName());
//			user2.setCode(item.getCode());
//			user2.setMobile(item.getMobile());
//			user2.setPassword(item.getPassword());
//			userService.add(user2);
//		} else {
//			item.setAddTime(DateUtil.getDate());
//			item.setAddUser(user.getId());
//			userService.add(item);
//		}
		userService.add(user);
		mm.put("user", user);
		return "admin/admin/user/edit";
	}
	/**
	 * 后台点击树形菜单
	 */
	@RequestMapping("/ztreeMenuTable")
	public String ztreeMenuTable(ModelMap mm,Pagination page,Long orgId){
		mm.put("list",userService.findZtreeUserByOrgId(page,orgId,0));
		BigInteger bi = (BigInteger) userService.findZtreeUserByOrgId(null,orgId,1).get(0).get("TOTAL");
		page.setTotal(bi.longValue());
/*		List<Map<String, Object>> maps=userService.findByOid(orgId, page);
		mm.put("list",maps);
	*//*	Pagination countPage = new Pagination();
		countPage.setPageSize(0);
		page.setTotal((Long) frontUserService.ztreeMenuTable(countPage,orgId).get(0).get("TOTAL"))*//*;
		Long long1=(long) userService.findNumByOid(orgId);
		page.setTotal(long1);*/
		mm.put("page",page);
		mm.put("orgId",orgId);
		return "admin/admin/user/ztreeMenuTable";
	}


	/**
	 * 修改密码
	 */
	@RequestMapping("/updateThisPassword")
	@ResponseBody
	public Map<String,Object> updateThisPassword(String password,String newPassword,Long id){
		return userService.updateThisPassword(password,newPassword,id);
	}
}
