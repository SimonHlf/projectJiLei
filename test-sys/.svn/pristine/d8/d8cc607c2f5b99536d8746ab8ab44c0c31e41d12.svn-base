package cn.windy.module.admin.controller;

import cn.windy.module.admin.hibernate.model.Setting;
import cn.windy.module.admin.hibernate.model.User;
import cn.windy.module.admin.service.ISettingService;
import cn.windy.util.Pagination;
import cn.windy.util.StringUtil;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/admin/setting")
public class SettingController extends AdminBaseController {

    @Autowired
    ISettingService settingService;

    @RequestMapping("/list")
    public String list(Setting setting, Pagination page, ModelMap mm) {
        if (!StringUtil.isBlank(setting.getName())) {
            setting.addCondition("name", true, "and", true);
        }
        mm.put("list", settingService.find(setting, page));
        page.setTotal(settingService.count(setting));
        mm.put("page", page);
        return "admin/admin/setting/list";
    }

    @RequestMapping("/del")
    public String add(String ids, ModelMap mm) {
        settingService.delete(ids);
        return list(new Setting(), new Pagination(), mm);
    }

    @RequestMapping("/add")
    public String add(Setting setting, ModelMap mm) {
        settingService.add(setting);
        return list(new Setting(), new Pagination(), mm);
    }


    @RequestMapping("/edit")
    public String edit(Setting setting, ModelMap mm) {
        mm.put("setting", settingService.findById(setting.getId()));
        return "admin/admin/setting/edit";
    }

    @RequestMapping("/details")
    public String details(Setting setting, ModelMap mm) {
        mm.put("setting", settingService.findById(setting.getId()));
        return "admin/admin/setting/details";

    }

    @RequestMapping("/getOldMoneyNum")
    public String getOldMoneyNum(Setting setting, ModelMap mm) {
        List<Setting> list = settingService.findAll(null);
        setting = list.get(0);
        mm.put("setting", setting);
        return "admin/admin/setting/oldMoney";
    }

    @RequestMapping("/addOldMoneyNum")
    public String addOldMoneyNum(Setting setting, ModelMap mm) {
        Setting s = settingService.findById(setting.getId());
        s.setOldMoneyNum(setting.getOldMoneyNum());
        settingService.add(s);
        mm.put("num", s.getOldMoneyNum());
        return "admin/admin/setting/oldMoney";
    }

    @RequestMapping("/getCouponMoney")
    public String getCouponMoney(Setting setting, ModelMap mm) {
        List<Setting> list = settingService.findAll(null);
        setting = list.get(0);
        mm.put("setting", setting);
        return "admin/admin/setting/couponMoney";
    }

    @RequestMapping("/addCouponMoney")
    public String addCouponMoney(Setting setting, ModelMap mm) {
        Setting s = settingService.findById(setting.getId());
        s.setCouponNum(setting.getCouponNum());
        settingService.add(s);
        mm.put("num", s.getCouponNum());
        return "admin/admin/setting/couponMoney";
    }

    //新加的方法，列表改成from表单
    @RequestMapping("/updateNowBefore")
    public String updateNowBefore(Setting setting, Pagination page, ModelMap mm) {
        if (!StringUtil.isBlank(setting.getName())) {
            setting.addCondition("name", true, "and", true);
        }
        List<Setting> settingList = settingService.find(setting, page);

        if (settingList.size() != 0) {
            mm.put("setting", settingList.get(0));
        }
        
       /* page.setTotal(settingService.count(setting));
        mm.put("page",page);*/

        return "admin/admin/setting/editNow";
    }

    /**
     * 保存系统设置
     *
     * @param setting
     * @return
     */
    @RequestMapping("/updateReal")
    @ResponseBody
    public Map updateReal(Setting setting,
                             @RequestParam(required = false, value = "headImage") MultipartFile[] multipartFile) throws IOException {
        String pathUrl = getRequest().getSession().getServletContext().getRealPath("");// 存放的路径
        String result = "true";
        Map<String,Object> map = new HashMap<>();
        for (int i = 0; i < multipartFile.length; i++) {
            if(!multipartFile[i].isEmpty()){
                String filename = multipartFile[i].getOriginalFilename();
                // 获取扩展名
                String extensionName = filename.substring(filename.lastIndexOf(".") + 1);
                map.put("jpg", "jpg");
                map.put("jpeg", "jpeg");
                map.put("png", "png");
                map.put("bmp", "bmp");
                map.put("gif", "gif");
                // 文件后缀判断
                if (!map.containsKey(extensionName)) {
                    if(i == 0){
                        result = "attr0Error";
                    } else {
                        result = "attr1Error";
                    }
                    map.put("result", result);
                    return map;
                } else { // 文件读入
                    String newfileName = UUID.randomUUID().toString();// 创建随机的图片名称
                    String pictureurl = "image"+ File.separator + newfileName + "." + extensionName;// 图片的全路径
                    if(i == 0){
                        setting.setAttr0(pictureurl);
                    } else {
                        setting.setAttr1(pictureurl);
                    }
                    if(pathUrl.endsWith(File.separator)){
                        pathUrl = pathUrl.substring(0, pathUrl.lastIndexOf(File.separator));
                        pathUrl = pathUrl.substring(0, pathUrl.lastIndexOf(File.separator));
                    } else {
                        pathUrl = pathUrl.substring(0, pathUrl.lastIndexOf(File.separator));
                    }

                    File fi = new File(pathUrl+File.separator + "image"  +File.separator + newfileName + "." + extensionName);
                    multipartFile[i].transferTo(fi);// 文件写入
                }
            }
        }
        map.put("result",result);
        settingService.add(setting);
        return map;
    }

}
