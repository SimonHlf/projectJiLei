package cn.windy.module.admin.controller;

import cn.windy.module.admin.hibernate.model.Role;
import cn.windy.module.admin.hibernate.model.User;
import cn.windy.module.admin.service.IMenuService;
import cn.windy.module.admin.service.IOrgService;
import cn.windy.module.admin.service.IRoleService;
import cn.windy.module.admin.service.IUserService;
import cn.windy.module.examination.mybatis.model.WindyOrg;
import cn.windy.module.examination.service.IWindyOrgService;
import cn.windy.module.examination.service.QuesTypeService;
import cn.windy.module.util.WindyConstants;
import cn.windy.util.Pagination;
import cn.windy.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/role")
public class RoleController extends AdminBaseController {

    @Autowired
    IRoleService roleService;
    @Autowired
    IMenuService menuService;
    @Autowired
    IUserService userService;

    @Autowired
    private QuesTypeService quesTypeService;

    @Autowired
    IWindyOrgService windyOrgService;

    @RequestMapping("/list")
    public String list(Role role, Pagination page, ModelMap mm){
        if(!StringUtil.isBlank(role.getName())){
            role.addCondition("name",true,"and",true);
        }
        mm.put("list",roleService.find(role,page));
        page.setTotal(roleService.count(role));
        mm.put("page",page);
        return "admin/admin/role/list";
    }

    @RequestMapping("/del")
    public String add(String ids, ModelMap mm){
        roleService.delete(ids);
        return list(new Role(),new Pagination(),mm);
    }

    @RequestMapping("/add")
    public String add(Role role, ModelMap mm){
        roleService.add(role);
        return list(new Role(),new Pagination(),mm);
    }

    @RequestMapping("/edit")
    public String edit(Role role, ModelMap mm){
        mm.put("role",roleService.findById(role.getId()));
        return "admin/admin/role/edit";
    }

    @RequestMapping("/userList")
    public String userList(Long rid,ModelMap mm){
        User user = (User) getSession(WindyConstants.SESSION_USER);
        Boolean s = quesTypeService.getRole(user.getId());
        List<WindyOrg> windyOrgList;
        if(s){
            windyOrgList=quesTypeService.getWindyOrgList();
        } else {
            windyOrgList = quesTypeService.getquesTypeNow(user.getUpdateUser());
        }
        String nodes = JSON.toJSONString(windyOrgList);
        mm.put("nodes",nodes);
        mm.put("rid",rid);
    	/*List<Map<String, Object>> nureUserList=new ArrayList<>();
    	List<Map<String, Object>> yureUserList=new ArrayList<>();
    	*//*mm.put("userList",userService.findAll(null));*//*
    	List<Map<String, Object>> list=userService.findUserByRoleId(role.getId());
    	*//* StringBuffer nodesJson = new StringBuffer();
    	 String template = "{id:%d,name:'%s',checked:%s}";*//*
    	for(Map<String, Object> u:list){
    		
    		*//* nodesJson.append(",");*//*
    		if(u.get("rid") == null || u.get("rid").equals("null")){
    			nureUserList.add(u);
    			*//* nodesJson.append(String.format(template,u.get("id"),u.get("name"),false));*//*
    			mm.put("nuList", u);
    		}else{
    			 *//*nodesJson.append(String.format(template,u.get("id"),u.get("name"),true));*//*
    			yureUserList.add(u);
    			mm.put("yuList", u);
    		}
    		
    	}
    	mm.put("nuList", nureUserList);
    	mm.put("yuList", yureUserList);*/
    	return "admin/admin/role/relationUserZtree";
    }

    @RequestMapping("/relationUser")
    public String relationUser(ModelMap mm,Long orgId,Long rid){
        mm.put("list",userService.findRelationUser(orgId,rid));
        return "admin/admin/role/relationUser";
    }


    @RequestMapping("/linkUser")
	public String roleLinkUser(String ids, Long rid, ModelMap mm,String zeroIds) {
		roleService.saveUsersRols(rid, ids,zeroIds);
		return list(new Role(), new Pagination(), mm);
	}
    
    //下面两个方法是关联菜单的1、在关联前打开关联页面。2、保存关联数据
    @RequestMapping("/toLinkMenu")
    public String toLinkMenu(Role role,ModelMap mm){
        List<Map<String,Object>> list = menuService.findMenusByRoleId(role.getId());

        StringBuffer nodesJson = new StringBuffer();

        String template = "{id:%d,pId:%d,name:'%s',checked:%s}";
        for (Map<String,Object> m : list) {
            nodesJson.append(",");
            if(m.get("rid") == null || m.get("rid").equals("null"))
                nodesJson.append(String.format(template,m.get("id"),m.get("pid"),m.get("name"),false));
            else
                nodesJson.append(String.format(template,m.get("id"),m.get("pid"),m.get("name"),true));
        }
        if(nodesJson.toString().startsWith(","))
            mm.put("nodes",nodesJson.substring(1));

        return "admin/admin/role/linkMenu";
    }

    @RequestMapping("/saveLink")
    public String saveLinkMenu(Long rid,String ids,ModelMap mm){
        menuService.saveRolsMenus(rid,ids);
        return list(new Role(),new Pagination(),mm);
    }

    @RequestMapping("/details")
    public String details(Role role,ModelMap mm){
    	mm.put("role", roleService.findById(role.getId()));
    	return "admin/admin/role/details";
    	
    }
}
