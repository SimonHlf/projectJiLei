package cn.windy.module.admin.controller;


import cn.windy.module.admin.hibernate.model.Menu;
import cn.windy.module.admin.hibernate.model.Role;
import cn.windy.module.admin.hibernate.model.User;
import cn.windy.module.admin.service.IMenuService;
import cn.windy.module.admin.service.IRoleService;
import cn.windy.module.admin.service.IUserService;
import cn.windy.module.examination.service.QuesTypeService;
import cn.windy.module.util.WindyConstants;
import cn.windy.util.DateUtil;
import cn.windy.util.StringUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class LoginController extends AdminBaseController {

    @Autowired
    IUserService userService;

    @Autowired
    IRoleService roleService;

    @Autowired
    IMenuService menuService;

    @Autowired
    QuesTypeService quesTypeService;


    @RequestMapping("/admin")
    public String admin(User user,ModelMap mm){
        return login(user,mm);
    }


    @RequestMapping("/login")
    public String login(User user, ModelMap mm) {
        if(getSession().getAttribute("setting") == null){//系统初始化信息，如果没有初始化，或者初始化超时
            return "redirect:index.htm";
        }
        if(user==null || StringUtil.isBlank(user.getName()) || StringUtil.isBlank(user.getPassword())){
            return "redirect:index.htm";
        }

        User loginUser = userService.login(user.getName(), user.getPassword());
        String return_page = "admin/login"; // 返回页面
        if (loginUser.isResultState()) {
            putSession(WindyConstants.SESSION_USER, loginUser);
            // 获取用户角色
            List<Role> roleList = roleService.findByUserId(loginUser.getId());
            putSession(WindyConstants.SESSION_USER_ROLE, roleList);
            // 获取登录菜单
            List<Menu> menuList = menuService.findByUserIdAndPid(loginUser.getId(), 0L);
            StringBuffer menuStr = new StringBuffer();
            for (Menu menu : menuList) {
                menuStr.append(getMenu(loginUser.getId(), menu));
            }
            mm.put("menus", String.format(nav, menuStr));

            boolean result = quesTypeService.getRole(loginUser.getId());
            //主界面柱状图
            DocBar(mm,result ? 0L:loginUser.getUpdateUser());
            //折线图
            DocLine(mm,result ? 0L:loginUser.getUpdateUser());
            //饼状图
//            DocPie(mm,result ? 0L:loginUser.getUpdateUser());
            //即将开始的考试
//            soonStartExam(mm,result ? 0L:loginUser.getUpdateUser());

            return_page = "admin/main";
        } else {
            mm.put("message", loginUser.getResultInfo());
        }
        return return_page;
    }

    private String getMenu(Long uid, Menu m) {
        List<Menu> menuList ;
        menuList = menuService.findByUserIdAndPid(uid, m.getId());
        if (menuList == null || menuList.size() < 1) {// 没有子菜单
            String url = String.format("onclick=\"ajaxLoad('%s','%s',this)\"", m.getUrl(), m.getName());
            return String.format(menuItem, url, "", m.getIcon(), m.getName(), "", "");
        } else {
            StringBuffer menuStr = new StringBuffer();

            for (Menu menu : menuList) {
                menuStr.append(getMenu(uid, menu));
            }
            String parent_ = String.format(menuItem, m.getUrl(), " class='menu-dropdown'", m.getIcon(), m.getName(),
                    hasChildMenuItems, String.format(childUl, menuStr.toString()));
            return parent_;
        }
    }

    private String menuItem = "<li>\n" + "<a href=\"javascript:void(0);\" %s %s>\n"
            + "                <i class=\"menu-icon fa %s\"></i>"
            + "                    <span class=\"menu-text\">%s</span> %s \n" + // 最后一个%s表示有子时，才用，其它为空
            "                </a>%s\n" + // %s为子
            "            </li>";
    private String hasChildMenuItems = "<i class=\"menu-expand\"></i>";

    private String nav = "<ul class=\"nav sidebar-menu\">%s</ul>";
    private String childUl = "<ul class=\"submenu\">%s</ul>";


    //后台柱状图
    public void DocBar(ModelMap mm,Long orgId){
        List<Map<String,Object>> list = userService.findDocBar(orgId);
        //考试名称集合
        List<String> lableList = new ArrayList<>();
        //应考人数集合
        List<BigInteger> totalList = new ArrayList<>();
        //及格人数集合
        List<BigInteger> passList = new ArrayList<>();
        for(Map<String,Object> map : list){
            //考试名称
            lableList.add("'"+map.get("exam_name").toString()+"'");
            //应考人数
            totalList.add((BigInteger) map.get("totalPeople"));
            //及格人数
            passList.add((BigInteger) map.get("passPeople"));
        }
        mm.put("lableList",lableList);
        mm.put("totalList",totalList);
        mm.put("passList",passList);
    }


    //后台圆形图
    public void DocPie(ModelMap mm,Long orgId){
        mm.put("list",userService.findDocPie(orgId));
    }

    //后台折线图
    public void DocLine(ModelMap mm,Long orgId){
        List<Map<String,Object>> list = userService.findDocLine(orgId);
        //考试名集合
        List<String> lineNameList = new ArrayList<>();
        //优秀人集合
        List<BigInteger> scoreList = new ArrayList<>();
        for (Map<String,Object> map:list){
            //考试名称
            lineNameList.add("'"+map.get("exam_name").toString()+"'");
            //优秀人数
            scoreList.add((BigInteger) map.get("excellentPeople"));
        }
        mm.put("lineNameList",lineNameList);
        mm.put("scoreList",scoreList);
    }

    //即将开始的考试
    public void soonStartExam(ModelMap mm,Long orgId){
        try {
            mm.put("examList",userService.findSoomStartExam(orgId));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/admin/doc")
    public String doc(ModelMap mm){
        boolean result = quesTypeService.getRole(getCurUser().getId());
        //主界面柱状图
        DocBar(mm,result ? 0L:getCurUser().getUpdateUser());
        //折线图
        DocLine(mm,result ? 0L:getCurUser().getUpdateUser());
        //饼状图
//        DocPie(mm,result ? 0L:getCurUser().getUpdateUser());
        //即将开始的考试
//        soonStartExam(mm,result ? 0L:getCurUser().getUpdateUser());
        return "admin/doc";
    }


}
