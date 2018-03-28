package cn.windy.module.examination.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.windy.module.admin.hibernate.model.User;
import cn.windy.module.core.controller.BaseController;
import cn.windy.module.examination.mybatis.model.PaperType;
import cn.windy.module.examination.mybatis.model.QuesType;
import cn.windy.module.examination.mybatis.model.WindyOrg;
import cn.windy.module.examination.service.PaperTypeService;
import cn.windy.module.examination.service.QuesTypeService;
import cn.windy.module.util.WindyConstants;
import cn.windy.util.DateUtil;
import cn.windy.util.Pagination;

@Controller
@RequestMapping("/admin/PaperTypeController")
public class PaperTypeController extends  BaseController{
	
	@Autowired
	private PaperTypeService paperTypeService;
	
	@Autowired
	private QuesTypeService quesTypeService;
	
	/**
	 * 列表，根据条件查询可用
	 * @param page
	 * @param name
	 * @param orgName
	 * @param map
	 * @return
	 */
	@RequestMapping("/getList")
	public String getList(Pagination page,String name,String orgName,ModelMap map) {
		User user=(User) getSession(WindyConstants.SESSION_USER);
		//判断后台登录的是否有权限查看所有机构的考试数据
		boolean s=quesTypeService.getRole(user.getId());
		if(s) {
			map.put("paperTypeList", paperTypeService.getList(page, name, orgName, null));
			page.setTotal(paperTypeService.getCount(name, orgName, null));
			map.put("page", page);
		}else {
			map.put("paperTypeList", paperTypeService.getList(page, name, orgName, user.getUpdateUser()));
			page.setTotal(paperTypeService.getCount(name, orgName, user.getUpdateUser()));
			map.put("page", page);
		}
		
		return "admin/examination/PaperType/list";
	}
	
	
	
	
	
	/**
	 * 添加前查找
	 * @param map
	 * @return
	 */
	@RequestMapping("/addBefor")
	public String addBefor(ModelMap map) {
		User user=(User) getSession(WindyConstants.SESSION_USER);
		//判断后台登录的是否有权限查看所有机构的考试数据，true为超管
		boolean s=quesTypeService.getRole(user.getId());
		String result="false";
		if(s==true) {
			List<WindyOrg> WindyOrgList=paperTypeService.getWindyOrgList();
			result="true";
			map.put("WindyOrgList", WindyOrgList);
		}
		map.put("result", result);
		
		return "";
	}
	
	/**
	 * 添加
	 * @param paperType
	 * @return
	 */
	@RequestMapping("/add")
	public String add(PaperType paperType,Pagination page,ModelMap mm) {
		User user=(User) getSession(WindyConstants.SESSION_USER);
		//判断后台登录的是否有权限查看所有机构的考试数据，true为超管
		boolean s=quesTypeService.getRole(user.getId());
		if(s) {
			paperType.setCreatTime(DateUtil.getDate());
			paperTypeService.add(paperType);
		}else {
			paperType.setCreatTime(DateUtil.getDate());
			paperType.setInsId(user.getUpdateUser());
			paperTypeService.add(paperType);
		}
		
		return getList(page,null,null,mm);
	}

	/**
	 * 删除
	 * @param ids
	 * @param page
	 * @param mm
	 * @return
	 */
	@RequestMapping("/delete")
	public String delet(String ids,Pagination page,ModelMap mm) {
		paperTypeService.delete(ids);
		
		return getList(new Pagination(),null,null,mm);
	}
	
	/**
	 * 修改前查找
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping("/updateBefor")
	public String updateBefor(Long id,ModelMap map) {
		User user=(User) getSession(WindyConstants.SESSION_USER);
		//判断后台登录的是否有权限查看所有机构的考试数据，true为超管
		boolean s=quesTypeService.getRole(user.getId());
		String result="false";
		if(s) {
			List<WindyOrg> WindyOrgList=paperTypeService.getWindyOrgList();
			result="true";
			map.put("WindyOrgList", WindyOrgList);
		}
		
		map.put("result", result);
		map.put("quesType", paperTypeService.getById(id));
		return "";
	}
	
	/**
	 * 修改
	 * @param paperType
	 * @param page
	 * @param mm
	 * @return
	 */
	@RequestMapping("/update")
	public String update(PaperType paperType,Pagination page,ModelMap mm) {
		paperTypeService.update(paperType);
		
		return getList(page,null,null,mm);
	}
	
	
}
