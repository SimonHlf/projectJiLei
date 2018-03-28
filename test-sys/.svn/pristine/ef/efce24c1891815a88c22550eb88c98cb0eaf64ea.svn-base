package cn.windy.module.admin.controller;

import cn.windy.module.admin.hibernate.model.Org;
import cn.windy.module.admin.hibernate.model.User;
import cn.windy.module.admin.service.IOrgService;
import cn.windy.module.examination.mybatis.model.WindyOrg;
import cn.windy.module.examination.service.IWindyOrgService;
import cn.windy.module.examination.service.QuesTypeService;
import cn.windy.util.Pagination;
import cn.windy.util.StringUtil;
import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/org")
public class OrgController extends AdminBaseController {

    @Autowired
    IOrgService orgService;

    @Autowired
    IWindyOrgService windyOrgService;

    @Autowired
    private QuesTypeService quesTypeService;

    @RequestMapping("/list")
    public String list(Org org, Pagination page, ModelMap mm){
        User user = getCurUser();
        boolean s=quesTypeService.getRole(user.getId());
        String nodes = "";
        getOrgTable(mm,s,page,nodes,org,user);
        return "admin/admin/org/list";
    }

    public void getOrgTable(ModelMap mm,boolean s,Pagination page,String nodes,Org org,User user){
        if(s){
            List<Org> orgList = orgService.find(org,page);
            mm.put("list",orgList);
            page.setTotal(orgService.count(org));
            nodes = JSON.toJSONString(windyOrgService.findAll());
        } else {
            List<Map<String,Object>> mapList = windyOrgService.findThisOrgByorgId(user.getUpdateUser(),page,0);
            mm.put("list",mapList);
            Pagination pagination = new Pagination();
            pagination.setPageSize(0);
            page.setTotal((Long) windyOrgService.findThisOrgByorgId(user.getUpdateUser(),pagination,1).get(0).get("TOTAL"));
            List<Map<String,Object>> nodesList = windyOrgService.findThisOrgByorgId(user.getUpdateUser(),pagination,0);
            nodes = JSON.toJSONString(nodesList);
        }
        mm.put("nodes",nodes.replaceAll("icon","_icon_"));
        mm.put("page",page);
    }

    /**
     * 点击树型结构时有效
     * @param
     * @param page
     * @param mm
     * @return
     */
    @RequestMapping("/tbody")
    public String listByPid(Long orgId,Integer level, Pagination page, ModelMap mm,Org org){
        User user = getCurUser();
        boolean s=quesTypeService.getRole(user.getId());
        String nodes = "";
        if(level == 0){
            getOrgTable(mm,s,page,nodes,new Org(),user);
        } else {
            mm.put("list",windyOrgService.findClickZtreeByOrgId(orgId,page,0));
            Pagination pagination = new Pagination();
            pagination.setPageSize(0);
            page.setTotal((Long) windyOrgService.findClickZtreeByOrgId(orgId,pagination,1).get(0).get("TOTAL"));
            mm.put("page",page);
        }
        mm.put("orgId",orgId);
        mm.put("level",level);
        return "admin/admin/org/table";
    }

    @RequestMapping("/del")
    public String del(String ids, ModelMap mm){

        orgService.delete(ids);
        return list(new Org(),new Pagination(),mm);
    }

    @RequestMapping("/add")
    public String add(Org menu, ModelMap mm){
        if(menu.getPid()==null) menu.setPid(0L);
        orgService.add(menu);
        return list(new Org(),new Pagination(),mm);
    }

    @RequestMapping("/edit")
    public String edit(Org menu, ModelMap mm){
        mm.put("org",orgService.findById(menu.getId()));
        return "admin/admin/org/edit";
    }
    
    @RequestMapping("/details")
    public String details(Org menu,ModelMap mm){
    	mm.put("org", orgService.findById(menu.getId()));
    	return "admin/admin/org/details";
    	
    }
}
