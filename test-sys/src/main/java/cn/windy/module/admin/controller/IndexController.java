package cn.windy.module.admin.controller;

import cn.windy.module.admin.hibernate.model.Setting;
import cn.windy.module.admin.service.ISettingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/")
public class IndexController extends AdminBaseController{

    @Autowired
    ISettingService settingService;

    /**
     * 后台
     * @param mm
     * @return
     */
    @RequestMapping("/index")
    public String index(ModelMap mm){
        Setting setting = settingService.findById(1L);
        if(setting == null) setting = new Setting();
        putSession("setting",setting);
        mm.put("setting",setting);
        return "admin/login";
    }


}
