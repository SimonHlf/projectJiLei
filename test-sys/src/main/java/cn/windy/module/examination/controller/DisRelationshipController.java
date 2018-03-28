package cn.windy.module.examination.controller;

import cn.windy.module.core.controller.BaseController;
import cn.windy.module.examination.mybatis.model.DisRelationship;
import cn.windy.module.examination.service.IDisRelationshipService;
import cn.windy.util.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/disrelationship")
public class DisRelationshipController extends BaseController {

    @Autowired
    IDisRelationshipService disRelationshipService;

    @RequestMapping("/list")
    public String list(DisRelationship disRelationship, Pagination page, ModelMap mm){
        mm.put("list",disRelationshipService.findAll(page));
        page.setTotal(disRelationshipService.countAll());
        mm.put("page",page);
        return "admin/examination/disrelationship/list";
    }

    @RequestMapping("/add")
    public String add(DisRelationship disRelationship, Pagination page, ModelMap mm){
        disRelationship.setpMark(0);
        disRelationshipService.add(disRelationship);
        return list(null,page,mm);
    }

    @RequestMapping("/delete")
    public String delete(String ids,Pagination page,ModelMap mm){
        disRelationshipService.delete(ids);
        return list(null,page,mm);
    }

    @RequestMapping("/edit")
    public String edit(long id,ModelMap mm){
        mm.put("DisRelationShip",disRelationshipService.findById(id));
        return "admin/examination/disrelationship/edit";
    }

    @RequestMapping("/update")
    public String update(DisRelationship disRelationship,Pagination page,ModelMap mm){
        disRelationshipService.update(disRelationship);
        return list(null,page,mm);
    }


    /**
     * 分销 上级
     * @param id 用户 Id
     * @param page
     * @param mm
     * @return
     */
    @RequestMapping("/superior")
    public String superior(long id,Pagination page,ModelMap mm){
        mm.put("list",disRelationshipService.findSuperior(id,page)) ;
        return "admin/examination/disrelationship/list";
    }

    /**
     * 分销下级
     */
    @RequestMapping("/subordinate")
    public String subordinate(long id,Pagination page,ModelMap mm){
        mm.put("list",disRelationshipService.findSubordinate(id,page));
        return "admin/examination/disrelationship/list";
    }
}
