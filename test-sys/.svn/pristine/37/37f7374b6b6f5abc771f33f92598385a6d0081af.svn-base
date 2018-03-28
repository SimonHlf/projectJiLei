package cn.windy.module.examination.controller;



import cn.windy.module.admin.hibernate.model.User;
import cn.windy.module.admin.service.IOrgService;
import cn.windy.module.core.controller.BaseController;
import cn.windy.module.examination.mybatis.model.Examination;
import cn.windy.module.examination.mybatis.model.WindyOrg;
import cn.windy.module.examination.service.ExaminationService;
import cn.windy.module.examination.service.IFrontUserService;
import cn.windy.module.examination.service.IWindyOrgService;
import cn.windy.module.examination.service.QuesTypeService;
import cn.windy.module.util.WindyConstants;
import cn.windy.util.DateUtil;
import cn.windy.util.Pagination;
import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


/**
 * 考试管理表
 */

@Controller
@RequestMapping("/admin/ExaminationController")
public class ExaminationController extends BaseController {

    @Autowired
    ExaminationService examinationService;

    @Autowired
    private QuesTypeService quesTypeService;

    @Autowired
    IFrontUserService frontUserService;

    @Autowired
    IOrgService orgService;

    @Autowired
    IWindyOrgService windyOrgService;




    @RequestMapping("/list")
    public String list(Pagination page, ModelMap mm,String examName){
        User user=(User) getSession(WindyConstants.SESSION_USER);
        //判断后台登录的是否有权限查看所有机构的考试数据
        boolean s=quesTypeService.getRole(user.getId());
        Pagination pagination = new Pagination();
        pagination.setPageSize(0);
        List<Map<String,Object>> countList;
        List<WindyOrg> windyOrgList;
        if(s){
            windyOrgList=quesTypeService.getWindyOrgList();
            mm.put("list",examinationService.findAll(page,examName,null));
            countList = examinationService.findAll(pagination,examName,null);
           // page.setTotal((Long) examinationService.findAll(pagination,examName,null).get(0).get("TOTAL"));
        } else {
            windyOrgList = quesTypeService.getquesTypeNow(user.getUpdateUser());
            mm.put("list",examinationService.findAll(page,examName,user.getUpdateUser()));
            countList = examinationService.findAll(pagination,examName,user.getUpdateUser());
            mm.put("thisOrgId",user.getUpdateUser());
           // page.setTotal((Long) examinationService.findAll(pagination,examName,user.getUpdateUser()).get(0).get("TOTAL"));
        }
        if(countList != null && countList.size() != 0){
            page.setTotal((Long) countList.get(0).get("TOTAL"));
        } else {
            page.setTotal(0);
        }
        String ss = JSON.toJSONString(windyOrgList);
        mm.put("nodes",ss.replaceAll("icon","_icon_"));
        mm.put("page",page);
        mm.put("examName",examName);
        return "admin/examination/examination/list";
    }

    @RequestMapping("/tbody")
    public String tbody(ModelMap mm,Pagination page,String examName,Long orgId){
        mm.put("list",examinationService.findAll(page,examName,orgId));
        Pagination pagination = new Pagination();
        pagination.setPageSize(0);
        List<Map<String,Object>> countList = examinationService.findAll(pagination,examName,orgId);
        if(countList != null && countList.size() != 0){
            page.setTotal((Long) countList.get(0).get("TOTAL"));
        } else {
            page.setTotal(0);
        }
        mm.put("orgId",orgId);
        mm.put("page",page);
        mm.put("examName",examName);
        return "admin/examination/examination/tbody";
    }


    /**
     * 跳转添加考试页面
     * @param cmd 标识 1为考试 2为练习
     * @return
     */
    @RequestMapping("/jumpAddExam")
    public String jumpAddExam(Integer cmd,ModelMap mm,Long examId){
        User user=(User) getSession(WindyConstants.SESSION_USER);
        //判断后台登录的是否有权限查看所有机构的考试数据，true为超管
        boolean s=quesTypeService.getRole(user.getId());
        if(s) {
            mm.put("orgList",windyOrgService.findRemoveZero());
//            mm.put("orgList",quesTypeService.getWindyOrgList());
        }else {
            mm.put("orgList",orgService.findThisOrgRole(user.getUpdateUser()));
        }
        mm.put("examId",examId);
        return (cmd == 1) ? "admin/examination/examination/add":"admin/examination/examination/AddExamPractice";
    }

    /**
     * 添加考试  选择考生一步 暂不用
     * @param page
     * @param mm
     * @param examination
     * @param ids
     * @return
     */
//    @RequestMapping("/addExam")
    public String add(Pagination page, ModelMap mm, Examination examination,String ids){
        User user = (User) getSession(WindyConstants.SESSION_USER);
        examination.setCreateTime(DateUtil.getDate());
        examination.setFounder(user.getId());//添加人
        examination.setAttr7(1);//考试
        examinationService.add(examination,ids);
        return list(page,mm,null);
    }

    @RequestMapping("/addExam")
    public String addExam(ModelMap mm,Examination examination,Long orgId){
        User user = (User) getSession(WindyConstants.SESSION_USER);
        examination.setCreateTime(DateUtil.getDate());
        examination.setFounder(user.getId());//添加人
        examination.setAttr7(1);//考试类型为考试
        examination.setOrgId(orgId);
        examinationService.addExam(examination);
        return list(new Pagination(),mm,null);
    }

    /**
     *添加练习
     */
    @RequestMapping("/addExamPraction")
    public String addExamPraction(Pagination page,ModelMap mm,Examination examination){
        User user = (User) getSession(WindyConstants.SESSION_USER);
        examination.setCreateTime(DateUtil.getDate());
        examination.setFounder(user.getId());//添加人
        examination.setAttr7(0);//练习
        examinationService.addExamPraction(examination);
        return list(page,mm,null);
    }

    /**
     * 考试管理添加考生 加载考生列表 暂不用
     * @param mm
     * @param orgId
     * @return
     */
    @RequestMapping("/frontUserTable")
    public String frontUserTable(ModelMap mm,Long orgId,Long examId,Integer cmd){
        //1为添加页面
        if(cmd == 1){
            mm.put("list",examinationService.addfrontUserTable(orgId));
        } else {
            mm.put("list",examinationService.updatefrontUserTable(orgId,examId));
        }
        mm.put("examId",examId);
        return "admin/examination/examination/frontUserTable";
    }


    /**
     * level 车间显示小组下的组织
     * @return 未选中
     */
    @RequestMapping("/newFrontUserTable")
    public String newFrontUserTable(ModelMap mm,Long orgId,Integer cmd,Integer level,Long examId){
     List<Map<String,Object>> list = examinationService.findOpenExamOrFrongUser(orgId,examId,cmd,level);
//     List<Map<String, Object>> checkdList = new ArrayList<>();
     List<Map<String, Object>> notcheckdList = new ArrayList<>();
     for(Map<String, Object> map:list) {
    	 if(map.get("isCheckd").toString().equals("0")) {//未选中
    		 notcheckdList.add(map);//选中
    	 } /*else {
    		 checkdList.add(map);//选中
    	 }*/
     }
     mm.put("notcheckdList", notcheckdList);//未选中
//       mm.put("list", examinationService.findOpenExamOrFrongUser(orgId,examId,cmd,level));
       mm.put("examId",examId);
        return "admin/examination/examination/frontUserTable";
    }
    
    /**
     * 选中
     * @param mm
     * @param orgId
     * @param cmd
     * @param level
     * @param examId
     * @return
     */
    @RequestMapping("/selMenuTable")
    public String selMenuTable(ModelMap mm,Long orgId,Integer cmd,Integer level,Long examId){
    	 List<Map<String,Object>> list = examinationService.findOpenExamOrFrongUser(orgId,examId,cmd,level);
       List<Map<String, Object>> checkdList = new ArrayList<>();
//       List<Map<String, Object>> notcheckdList = new ArrayList<>();
       for(Map<String, Object> map:list) {
      	 if(!map.get("isCheckd").toString().equals("0")) {//未选中
      		checkdList.add(map);//选中
      	 } /*else {
      		 checkdList.add(map);//选中
      	 }*/
       }
       mm.put("checkdList", checkdList);//选中
//         mm.put("list", examinationService.findOpenExamOrFrongUser(orgId,examId,cmd,level));
         mm.put("examId",examId);
    	return  "admin/examination/examination/checkdFrontUsetTable";
    }

    /**
     * 添加练习考试
     * @param mm
     * @param examination
     * @param page
     * @return
     */
    @RequestMapping("/addExamPractice")
    public String addExamPractice(ModelMap mm,Examination examination,Pagination page){
        User user = (User) getSession(WindyConstants.SESSION_USER);
        examination.setFounder(user.getId());//添加人

        return list(page,mm,null);
    }

    @RequestMapping("/findById")
    public String findById(Long id,Pagination page,ModelMap mm){
        Examination examination = examinationService.findById(id);
        mm.put("Examination",examination);
        User user=(User) getSession(WindyConstants.SESSION_USER);
        //判断后台登录的是否有权限查看所有机构的考试数据，true为超管
        boolean s=quesTypeService.getRole(user.getId());
        if(s) {
            mm.put("orgList",windyOrgService.findRemoveZero());
//            mm.put("orgList",quesTypeService.getWindyOrgList());
        }else {
            mm.put("orgList",orgService.findThisOrgRole(user.getUpdateUser()));
        }
        mm.put("examId",id);
        String result = "";
        if(examination.getAttr7() == 1){//1为考试页面
            result = "admin/examination/examination/edit";
        } else {
            result = "admin/examination/examination/EditExamPractice";
        }
        return result;
    }

    @RequestMapping("/delete")
    public String delete(Pagination page,ModelMap mm,String ids){
        examinationService.delete(ids);
        return list(page,mm,null);
    }

    /**
     * 保存考试信息
     * @param page
     * @param mm
     * @param examination
     * @return
     */
    @RequestMapping("/saveExaminatinForm")
    public String saveExaminatinForm(Pagination page,ModelMap mm,Examination examination){
        examinationService.saveExaminatinForm(examination);
        return list(page,mm,null);
    }


    /**
     *
     * @param page
     * @param mm
     * @param ids 选中的id
     * @param zeroIds 所有的 id
     * @param examination
     * @return
     */
    @RequestMapping("/update")
    public String update(Pagination page,ModelMap mm,String ids,String zeroIds,Examination examination){
        examinationService.ExamUpdate(examination,ids,zeroIds);
        return list(page,mm,null);
    }


    @RequestMapping("/jumpAddFrontUser")
    public String jumpAddFrontUser(ModelMap mm,Integer cmd,Long examId,Long orgId){

       /* User user=(User) getSession(WindyConstants.SESSION_USER);
        //判断后台登录的是否有权限查看所有机构的考试数据
        boolean s=quesTypeService.getRole(user.getId());
        List<WindyOrg> windyOrgList;
        if(s){
            windyOrgList = windyOrgService.findAll();
        } else {*/
//        List<WindyOrg> windyOrgList = windyOrgService.findByInsId(user.getUpdateUser());

        List<WindyOrg> windyOrgList = windyOrgService.findByInsId(orgId);
//        }

//        mm.put("list",frontUserService.findExamAddFrontUser());
        String nodes = JSON.toJSONString(windyOrgList);
        mm.put("nodes",nodes.replaceAll("icon","_icon_"));
        mm.put("cmd",cmd);
        mm.put("examId",examId);
        return "admin/examination/examination/addFrontUser";
    }


    /**
     * 后台审核考试状态(启用/不启用)
     * @param examId
     * @param cmd
     * @param page
     * @param mm
     * @return
     */
    @RequestMapping("/EnableorNotEnable")
    public String EnableorNotEnable(Long examId,Integer cmd,Pagination page,ModelMap mm){
        examinationService.EnableorNotEnable(cmd,examId);
        return list(page,mm,null);
    }


    /**
     * 后台审核考试答案是否显示(显示/不显示)
     * @param page
     * @param mm
     * @param examId
     * @param cmd
     * @return
     */
    @RequestMapping("/AnswerDisplay")
    public String AnswerDisplay(Pagination page,ModelMap mm,Long examId,Integer cmd){
        examinationService.AnswerDisplay(cmd,examId);
        return list(page,mm,null);
    }


    /**
     * 考试关联考生
     * @param mm
     * @param ids 选中的用户 id
     * @param examId 考试 id
     * @param zeroIds 未选中的用户 id
     * @return
     */
    @RequestMapping("/ExamOrFrontUser")
    public String ExamOrFrontUser(ModelMap mm,String ids,Long examId,String zeroIds){
        examinationService.ExamOrFrontUser(examId,ids,zeroIds);
        return list(new Pagination(),mm,null);
    }


    /**
     * 考试详情
     * @param mm
     * @param examId
     * @return
     */
    @RequestMapping("/Examdetails")
    public String Examdetails(ModelMap mm,Long examId,Pagination page){
        mm.put("list",examinationService.Examdetails(examId));
        mm.put("page",page);
        return "admin/examination/examination/examDetails";
    }
}
