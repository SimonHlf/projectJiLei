package cn.windy.module.examination.controller;

import cn.windy.module.core.controller.BaseController;
import cn.windy.module.examination.mybatis.model.DisRate;
import cn.windy.module.examination.service.IDisRateService;
import cn.windy.util.Pagination;
import cn.windy.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 分效率设置表
 */
@Controller
@RequestMapping("/admin/disrate")
public class DisRateController extends BaseController {
     //这是测试
    @Autowired
    IDisRateService disRateService;

    @RequestMapping("/list")
    public String list(DisRate disRate,ModelMap mm, Pagination page){
        if(!StringUtil.isBlank(disRate.getName())){

        } else {
            mm.put("list",disRateService.findAll(page));
            page.setTotal(disRateService.countAll());
        }
        mm.put("page",page);
        return "admin/examination/disrate/list";
    }

    @RequestMapping("/add")
    public String add(DisRate disRate, ModelMap mm, Pagination page){
        disRateService.add(disRate);
        return list(new DisRate(),mm,page);
    }

    @RequestMapping("/delete")
    public String delete(String ids,ModelMap mm,Pagination page){
        disRateService.delete(ids);
        return list(new DisRate(),mm,page);
    }

    @RequestMapping("/edit")
    public String edit(Long id,ModelMap mm){
        mm.put("DisRate",disRateService.findById(id));
        return "admin/examination/disrate/edit";
    }

    @RequestMapping("/update")
    public String update(DisRate disRate,ModelMap mm,Pagination page){
        disRateService.update(disRate);
        return list(new DisRate(),mm,page);
    }
}
