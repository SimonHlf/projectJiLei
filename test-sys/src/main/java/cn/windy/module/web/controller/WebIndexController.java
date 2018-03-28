package cn.windy.module.web.controller;

import cn.windy.module.admin.hibernate.model.Setting;
import cn.windy.module.admin.service.ISettingService;
import cn.windy.module.core.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 前端
 */
@Controller
@RequestMapping("/web")
public class WebIndexController extends BaseController {

    @Autowired
    ISettingService settingService;

    /**
     * 前台
     */
    @RequestMapping("/index")
    public String frontUserIndex(ModelMap mm){
        Setting setting = settingService.findById(1L);
        if(setting == null) setting = new Setting();
        putSession("setting",setting);
        mm.put("setting",setting);
        return "web/module/login/login";
    }

}
