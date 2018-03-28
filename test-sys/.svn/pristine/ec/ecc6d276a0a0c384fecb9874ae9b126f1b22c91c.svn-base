package cn.windy.module.admin.controller;

import cn.windy.module.admin.hibernate.model.Menu;
import cn.windy.module.admin.service.IMenuService;
import cn.windy.util.Pagination;
import cn.windy.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin/menu")
public class MenuController extends AdminBaseController {

    @Autowired
    IMenuService menuService;

    @RequestMapping("/list")
    public String list(Menu menu, Pagination page, ModelMap mm){
        //tree
        StringBuffer nodesJson = new StringBuffer();
        List<Menu> listAll = menuService.findAll(null);
        String template = "{id:%d,pId:%d,name:'%s'}";
        for (Menu m : listAll) {
            nodesJson.append(",");
            nodesJson.append(String.format(template,m.getId(),m.getPid(), m.getName()));
        }
        if(nodesJson.toString().startsWith(","))
            mm.put("nodes",nodesJson.substring(1));

        if(!StringUtil.isBlank(menu.getName())){
            menu.addCondition("name",true,"and",true);
        }
        mm.put("list",menuService.find(menu,page));
        page.setTotal(menuService.count(menu));
        mm.put("page",page);
        return "admin/admin/menu/list";
    }

    /**
     * 点击树型结构时有效
     * @param menu
     * @param page
     * @param mm
     * @return
     */
    @RequestMapping("/listByPid")
    public String listByPid(Menu menu, Pagination page, ModelMap mm){
        if(menu.getPid()!=null){
            menu.addCondition("pid",true,"and",false);
        }
        mm.put("list",menuService.find(menu,page));
        page.setTotal(menuService.count(menu));
        mm.put("page",page);
        return "admin/admin/menu/table";
    }

    @RequestMapping("/del")
    public String add(String ids, ModelMap mm){
        menuService.delete(ids);
        return list(new Menu(),new Pagination(),mm);
    }

    @RequestMapping("/add")
    public String add(Menu menu, ModelMap mm){
        if(menu.getPid()==null) menu.setPid(0L);
        menuService.add(menu);
        return list(new Menu(),new Pagination(),mm);
    }

    @RequestMapping("/edit")
    public String edit(Menu menu, ModelMap mm){
        mm.put("menu",menuService.findById(menu.getId()));
        return "admin/admin/menu/edit";
    }
    
    /**
     * 查看菜单详情
     * */
    @RequestMapping("/details")
    public String details(Menu menu,ModelMap mm){
    	mm.put("menu", 	menuService.findById(menu.getId()));
    	return "admin/admin/menu/details";
    }
}
