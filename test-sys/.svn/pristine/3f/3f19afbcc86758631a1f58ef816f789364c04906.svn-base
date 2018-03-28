package cn.windy.module.web.controller;

import cn.windy.module.admin.service.IOrgService;
import cn.windy.module.core.controller.BaseController;
import cn.windy.module.examination.inter.InterJson;

import cn.windy.module.examination.mybatis.model.FrontUser;
import cn.windy.module.examination.mybatis.model.PaperRecord;
import cn.windy.module.examination.service.ExaminationService;
import cn.windy.module.examination.service.IWindyOrgService;
import cn.windy.module.examination.service.PaperCreatService;
import cn.windy.module.examination.service.PaperRecordService;
import cn.windy.module.examination.service.impl.FrontUserService;
import cn.windy.module.util.WindyConstants;
import cn.windy.util.Pagination;
import cn.windy.util.StringUtil;
import cn.windy.util.encrypt.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.*;


@Controller
@RequestMapping("/web/module/login/inter/frontuser")
public class InterFrontUserController extends BaseController{

    @Autowired
    FrontUserService frontUserService;

    //考试记录表
    @Autowired
    PaperRecordService paperRecordService;
    
    @Autowired
    private PaperCreatService  paperCreatService;

    @Autowired
    private ExaminationService examinationService;

    @Autowired
    IOrgService orgService;
    
    /**
     * 登陆接口
     * @param code
     * @param password
     * @return
     */
    @RequestMapping("/login")
    public String login(String code, String password, ModelMap mm){
        InterJson interJson;
        if(getSession().getAttribute("setting") == null){//系统初始化信息，如果没有初始化，或者初始化超时
            interJson = new InterJson();
            interJson.setMsg("登陆超时，请重新登录");
            mm.put("frontUser",interJson);
            String path = getRequest().getContextPath();
            String basePath = getRequest().getScheme()+"://"+getRequest().getServerName()+":"+getRequest().getServerPort()+path+"/";
            return "redirect:"+basePath + "web/index.htm";
        }
       interJson = frontUserService.InterFrontUserLogin(code,password);
        mm.put("interJson",interJson);
       if(interJson.isResult()){
           putSession(WindyConstants.SESSION_FRONTUSER,interJson.getFrontUser());
           mm.put("frontUser",interJson.getFrontUser());
//           findLineEcharts(interJson.getFrontUser().getUserId(),mm);
           List<Map<String,Object>> paperCreatServiceList=paperCreatService.getPaperCreatWillDo(interJson.getFrontUser().getUserId(),null);
           mm.put("paperCreatServiceList", paperCreatServiceList);
           mm.put("Org",orgService.findById(interJson.getFrontUser().getOrgId()));
           putSession("org",orgService.findById(interJson.getFrontUser().getOrgId()));
           return "web/module/personalCen/personalCen";
       }
       return  "web/module/login/login";
    }

    //Echarts方法
    public List<Map<String,Object>> findLineEcharts(Long userId,ModelMap mm){
        List<Map<String,Object>> list = frontUserService.findLineEcharts(userId);
        List<String> monthList = new ArrayList<>();//折线图月份
        List<Double> fenList = new ArrayList<>();//折线图分数


        Integer count = 0;//题目总数
        Integer Correctcount = 0;//答对的题数数量
        Integer errorcount = 0;//打错的题数数量
        for (Map<String,Object> map : list){
            //日期
            monthList.add("'"+(String) map.get("month")+"'");
            //得分
            Double fen = (Double) map.get("fen");
            fenList.add(fen);


            Integer countNum = (Integer) map.get("option_num");//单条记录总体书
            count = count + countNum;

            Integer rightNum = (Integer) map.get("rightNum");//单条记录一共答对的题数
            Correctcount = Correctcount + rightNum; //循环相加答对的题数

            Long errorNum = (Long) map.get("errorNum");//单条记录一共打错的题数
            errorcount = errorcount + errorNum.intValue();

           /* String attr16 = (String) map.get("attr16");//单选题答错的id集合
            if(!StringUtil.isBlank(attr16)){
                if(attr16.indexOf(",") != -1){
                    errorcount = errorcount + attr16.split(",").length;
                } else {
                    errorcount++;
                }
            }
            String attr17 = (String) map.get("attr17");//多选题答错的id集合
            if(!StringUtil.isBlank(attr17)){
                if(attr17.indexOf(",") != -1){
                    errorcount = errorcount + attr17.split(",").length;
                } else {
                    errorcount++;
                }
            }
            String attr18 = (String) map.get("attr18");//判断题答错的id集合
            if(!StringUtil.isBlank(attr18)){
                if(attr18.indexOf(",") != -1){
                    errorcount = errorcount + attr18.split(",").length;
                } else {
                    errorcount++;
                }
            }*/
        }

        Double resultrightNum = (Correctcount.doubleValue() / count.doubleValue()) * 100;//正确率 Correctcount答对多少道  count题目总数
        Double resulterrorNum = (errorcount.doubleValue() / count.doubleValue()) * 100;//错误率 errorcount 打错多少道 count题目总数
        StringBuffer sbf = new StringBuffer();
//        {value:30, name:'错误率 30%'}
        String template = "{'value':'%s','name':'%s'},";
        NumberFormat nf = NumberFormat.getNumberInstance();
        nf.setMaximumFractionDigits(2);
        sbf.append(String.format(template,nf.format(resultrightNum),"正确率 " + nf.format(resultrightNum) + "%"));
        sbf.append(String.format(template,nf.format(resulterrorNum),"错误率 " + nf.format(resulterrorNum) + "%"));
        mm.put("monthList",monthList);//折线图月份
        mm.put("fenList",fenList);//折线图分数
        mm.put("Piechart",sbf.substring(0,sbf.length() - 1));
        return null;
    }



    /**
     * 个人中心
     */
    @RequestMapping("/jumpCen")
    public String jumpCen(ModelMap mm, Pagination page){
        FrontUser frontUser = (FrontUser) getSession(WindyConstants.SESSION_FRONTUSER);
        findLineEcharts(frontUser.getUserId(),mm);
        mm.put("examList",examinationService.findWebExamination(page,frontUser.getOrgId()));
        List<Map<String,Object>> paperCreatServiceList=paperCreatService.getPaperCreatWillDo(frontUser.getUserId(),null);
        mm.put("paperCreatServiceList", paperCreatServiceList);
        return "web/module/personalCen/JumpCenter";
    }

    /**
     * 全屏个人中心
     */
    @RequestMapping("/jumpQuanCen")
    public String jumpQuanCen(ModelMap mm){
        FrontUser frontUser = (FrontUser) getSession(WindyConstants.SESSION_FRONTUSER);
        mm.put("frontUser",frontUser);
        List<Map<String,Object>> paperCreatServiceList=paperCreatService.getPaperCreatWillDo(frontUser.getOrgId(),null);
        mm.put("paperCreatServiceList", paperCreatServiceList);
//        findLineEcharts(frontUser.getUserId(),mm);
        return "web/module/personalCen/personalCen";
    }

    /**
     * 跳转个人资料页面
     */
    @RequestMapping("/jumpPersonalInfo")
    public String jumpPersonalInfo(ModelMap mm){
        FrontUser frontUser = (FrontUser) getSession(WindyConstants.SESSION_FRONTUSER);
        mm.put("frontUser",frontUserService.findById(frontUser.getUserId()));
        return "web/module/personalCen/personalInfo";
    }

    /**
     * 跳转修改密码界面
     */
    @RequestMapping("/jumpfixPassword")
    public String jumpfixPassword(){
        return "web/module/personalCen/fixPassword";
    }



    /**
     * 修改密码接口
     * @param newPassword 新密码
     * @return
     */
    @RequestMapping("/savePassword")
    @ResponseBody
    public InterJson InterUpdatePasswordFrontUser(String password, String newPassword){
        FrontUser fontFrontUser1 = (FrontUser) getSession(WindyConstants.SESSION_FRONTUSER);
        return frontUserService.InterUpdatePasswordFrontUser(fontFrontUser1,password,newPassword);
    }

    /**
     * 修改资料接口
     */
    @RequestMapping("/saveInfo")
    @ResponseBody
    public Map saveInfo(FrontUser frontUser, @RequestParam(required = false,value = "headImage")MultipartFile multipartFile) throws IOException {
        String pathUrl = getRequest().getSession().getServletContext().getRealPath("");
        Map<String,Object> map = new HashMap<>();
        String result = "true";
        if(!multipartFile.isEmpty()){
                // 原始的文件名
                String filename = multipartFile.getOriginalFilename();
                // 获取扩展名
                String extensionName = filename.substring(filename.lastIndexOf(".") + 1);
                map.put("jpg", "jpg");
                map.put("jpeg", "jpeg");
                map.put("png", "png");
                map.put("bmp", "bmp");
                map.put("gif", "gif");
                // 文件后缀判断
                if (!map.containsKey(extensionName)) {
                    map.put("result", "pictureErroe");
                    return map;
                    // 文件读入
                } else {
                    String newfileName = UUID.randomUUID().toString();// 创建随机的图片名称
                    String pictureurl = "image" + File.separator + newfileName + "." + extensionName;// 图片的全路径
                    String resultUrl;
                    if(pathUrl.endsWith(File.separator)){
                        resultUrl = pathUrl.substring(0,pathUrl.lastIndexOf(File.separator));
                        resultUrl = resultUrl.substring(0,resultUrl.lastIndexOf(File.separator));
                    } else {
                        resultUrl = pathUrl.substring(0,pathUrl.lastIndexOf(File.separator));
                    }
                    frontUser.setHeadPortrait(pictureurl);// 图片只有地址没有名称
                    map.put("imgUrl",pictureurl);
//                    String resultUrl = pathUrl.substring(0, pathUrl.lastIndexOf(File.separator));
//                    resultUrl = resultUrl.substring(0,pathUrl.lastIndexOf(File.separator)) + File.separator + pictureurl;
                    String FileUrl = resultUrl + File.separator + pictureurl;
                    File fi = new File(FileUrl);
                    multipartFile.transferTo(fi);// 文件写入


                }
            }
        frontUserService.Update(frontUser);
        putSession(WindyConstants.SESSION_FRONTUSER,frontUserService.findById(frontUser.getUserId()));
        map.put("result",result);
        return map;
    }








}
