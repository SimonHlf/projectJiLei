package cn.windy.module.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.windy.module.admin.hibernate.model.Item;
import cn.windy.module.admin.service.IItemService;
import cn.windy.util.Pagination;
import cn.windy.util.StringUtil;

@Controller
@RequestMapping("/admin/item")
public class ItemController extends AdminBaseController {

    @Autowired
    IItemService itemService;

    @RequestMapping("/list")
    public String list(Item item, Pagination page, ModelMap mm,Long cmd){
        if(!StringUtil.isBlank(item.getName())){
            item.addCondition("name",true,"and",true);
        }
        if(!StringUtil.isBlank(item.getType())){
            item.addCondition("type",true,"and",false);
        }
/*        if(cmd != null){
        	 if(cmd == 0){
        		 if(isSuper()){
                  	mm.put("isSuper", "1");
        		 }
             	mm.put("cmd", cmd);
             	mm.put("list", itemService.findByType("merchantInfoType"));
             	page.setTotal(itemService.findNumByType("merchantInfoType"));
             	mm.put("page", page);
             	mm.put("info", "1");
             	return "admin/admin/item/merList";
             }
        }*/
        mm.put("list",itemService.find(item,page));
        page.setTotal(itemService.count(item));
        mm.put("page",page);
        return "admin/admin/item/list";
    }

    @RequestMapping("/del")
    public String add(String ids, ModelMap mm,Long cmd){
        itemService.delete(ids);
        return list(new Item(),new Pagination(),mm,cmd);
    }

    @RequestMapping("/add")
    public String add(Item item, ModelMap mm,Long cmd){
        itemService.add(item);
        return list(new Item(),new Pagination(),mm,cmd);
    }

    @RequestMapping("/addInfo")
    public String addInfo(Item item,ModelMap mm,Long cmd){
    	Item item2=itemService.findById(item.getId());
    	item2.setRemark(item.getRemark());
    	itemService.add(item2);
    	return list(new Item(), new Pagination(), mm, cmd);
    }
    
    @RequestMapping("/edit")
    public String edit(Item item, ModelMap mm){
        mm.put("item",itemService.findById(item.getId()));
        return "admin/admin/item/edit";
    }
    
    /**
     * 修改门店分类
     * */
    @RequestMapping("/editInfo")
    public String editInfo(Item item,ModelMap mm){
        mm.put("item", itemService.findById(item.getId()));
        return "admin/admin/item/editInfo";
    }
    
    @RequestMapping("/details")
    public String details(Item item,ModelMap mm){
    	mm.put("item", itemService.findById(item.getId()));
    	return "admin/admin/item/details";
    	
    }
}
