package cn.windy.module.examination.controller;

import cn.windy.module.admin.hibernate.model.User;
import cn.windy.module.core.controller.BaseController;
import cn.windy.module.examination.mybatis.model.WindyOrg;
import cn.windy.module.examination.service.IStatisticsService;
import cn.windy.module.examination.service.QuesTypeService;
import cn.windy.module.util.WindyConstants;
import cn.windy.util.FileDownLoadUtil;
import cn.windy.util.Pagination;
import cn.windy.util.StringUtil;
import com.alibaba.fastjson.JSON;
import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 统计
 */
@Controller
@RequestMapping("/admin/statistics")
public class StatisticsController extends BaseController{

    @Autowired
    QuesTypeService quesTypeService;

    //统计
    @Autowired
    IStatisticsService statisticsService;




    /**
     * 考试结果统计
     * @param mm
     * @return
     */
    @RequestMapping("/testResults")
    public String testResults(ModelMap mm, Pagination page, String dropDown, String startTime, String endTime, Integer cmd){
        User user=(User) getSession(WindyConstants.SESSION_USER);
        //判断后台登录的是否有权限查看所有机构的考试数据
        boolean s=quesTypeService.getRole(user.getId());
        Pagination pagination = new Pagination();
        pagination.setPageSize(0);
        List<WindyOrg> windyOrgList;
        if(s){
            windyOrgList=quesTypeService.getWindyOrgList();
            mm.put("list",statisticsService.testResults(page,cmd,startTime,endTime,dropDown,null));
            page.setTotal((Long) statisticsService.testResults(pagination,cmd,startTime,endTime,dropDown,null).get(0).get("TOTAL"));
        }else{
            windyOrgList = quesTypeService.getquesTypeNow(user.getUpdateUser());
            mm.put("list",statisticsService.testResults(page,cmd,startTime,endTime,dropDown,user.getUpdateUser()));
            page.setTotal((Long) statisticsService.testResults(pagination,cmd,startTime,endTime,dropDown,user.getUpdateUser()).get(0).get("TOTAL"));
        }
        String nodes = JSON.toJSONString(windyOrgList);
        mm.put("nodes",nodes.replaceAll("icon","_icon_"));
        mm.put("page",page);
        mm.put("cmd",cmd);
        mm.put("startTime",startTime);
        mm.put("endTime",endTime);
        dropDown = StringUtil.isBlank(dropDown)? "0":dropDown;
        mm.put("dropDown",dropDown);
        return "admin/examination/Statistics/recordStatustucs";
    }


    /**
     *应考人数实考人数统计
     */
    @RequestMapping("/therealTest")
    public String TherealTest(ModelMap mm,Pagination page,String dropDown, String startTime, String endTime, Integer cmd){
        User user=(User) getSession(WindyConstants.SESSION_USER);
        //判断后台登录的是否有权限查看所有机构的考试数据
        boolean s=quesTypeService.getRole(user.getId());
        Pagination pagination = new Pagination();
        pagination.setPageSize(0);
        List<Map<String,Object>> countList;
        List<WindyOrg> windyOrgList;
        if(s){
            windyOrgList = quesTypeService.getWindyOrgList();
            mm.put("list",statisticsService.therealTest(page,cmd,startTime,endTime,dropDown,null));
            countList = statisticsService.therealTest(pagination,cmd,startTime,endTime,dropDown,null);
        }else{
            windyOrgList = quesTypeService.getquesTypeNow(user.getUpdateUser());
            mm.put("list",statisticsService.therealTest(page,cmd,startTime,endTime,dropDown,user.getUpdateUser()));
            countList = statisticsService.therealTest(pagination,cmd,startTime,endTime,dropDown,user.getUpdateUser());
        }
        if(countList != null && countList.size() != 0){
            page.setTotal((Long) countList.get(0).get("TOTAL"));
        } else {
            page.setTotal(0);
        }
        String nodes = JSON.toJSONString(windyOrgList);
        mm.put("nodes",nodes.replaceAll("icon","_icon_"));
        mm.put("page",page);
        mm.put("cmd",cmd);
        mm.put("startTime",startTime);
        mm.put("endTime",endTime);
        dropDown = StringUtil.isBlank(dropDown) ? "0":dropDown;
        mm.put("dropDown",dropDown);
        return "admin/examination/Statistics/therealTest";
    }


    /**
     *
     * @param orgId
     * @param page
     * @param mm
     * @return
     */
    @RequestMapping("/therealTestTbody")
    public String therealTestTbody(Long orgId,Pagination page,ModelMap mm){
        mm.put("list",statisticsService.therealTest(page,null,null,null,null,orgId));
        Pagination pagination = new Pagination();
        pagination.setPageSize(0);
        List<Map<String,Object>> countList = statisticsService.therealTest(pagination,null,null,null,null,orgId);
        if(countList != null && countList.size() != 0){
            page.setTotal((Long) countList.get(0).get("TOTAL"));
        } else {
            page.setTotal(0);
        }
        mm.put("page",page);
        mm.put("orgId",orgId);
        return "admin/examination/Statistics/therealTestTbody";
    }



    /**
     * 1应考 2实考 3未考 4及格 5不及格
     * @param cmd
     * @param examId
     * @param mm
     * @param page
     * @return
     */
    @RequestMapping("/TherealDetails")
    public String TherealDetails(Integer cmd,Long examId,ModelMap mm,Pagination page,Integer mark,Integer currPage){
        List<Map<String,Object>> countList;
        mm.put("list",statisticsService.TherealDetails(cmd,examId,page));
        Pagination pagination = new Pagination();
        pagination.setPageSize(0);
        countList = statisticsService.TherealDetails(cmd,examId,pagination);
        if(countList != null && countList.size() != 0){
            page.setTotal((Long) countList.get(0).get("TOTAL"));
        } else {
            page.setTotal(0);
        }
        mm.put("page",page);
        mm.put("cmd",cmd);
        mm.put("examId",examId);
        mm.put("mark",mark);
        mm.put("currPage",currPage);
        String result = "";
        //1应考 2实考 3未考 4及格 5不及格
        switch (cmd){
            case 1:result = "TherealDetails";break;
            case 2:result = "ExamCountHaveTheTest";break;
            case 3:result = "ExamCountNoTest";break;
            case 4:result = "ExamCountPassPeople";break;
            case 5:result = "ExamCountFailPeople";break;
        }
        return "admin/examination/Statistics/"+result;
    }


    /**
     * 导出统计列表
     * @param dropDown
     * @param startTime
     * @param endTime
     * @return
     */
    @RequestMapping("/importTherealTest")
    public String importTherealTest(String dropDown,String startTime,String endTime){
        List<Map<String,Object>> list = statisticsService.importTherealTest(dropDown,startTime,endTime);
        String[] title = {"考试名称","试卷名称","应考","实考","未考","及格人数","及格人数"};

        //创建工作簿
        HSSFWorkbook workbook = new HSSFWorkbook();
        //创建一个工作表 sheet
        HSSFSheet sheet = workbook.createSheet("sheet0");

        sheet.setDefaultColumnWidth(16);
        sheet.setDefaultRowHeightInPoints(16);
        // 设置单元格字体
        HSSFFont font = workbook.createFont();
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        font.setFontName("宋体");
        font.setFontHeight((short) 300);

        //创建第一行
        HSSFRow row1 = sheet.createRow(0);
        //插入第一行数据 title
        HSSFCell cell1 = null;
        for (int i = 0; i < title.length; i++){
            cell1 = row1.createCell(i);
            cell1.setCellValue(title[i]);
        }
        int count = 0;
        if(list != null && list.size() != 0){
            count = list.size() + 1;
        }
        for (int i = 1; i < count; i++) {
            for (Map<String,Object> map:list){
                HSSFRow nextRow = sheet.createRow(i);
                HSSFCell cell2 = nextRow.createCell(0);
                cell2.setCellValue(map.get("exam_name").toString());//考试名称

                cell2 = nextRow.createCell(1);
                cell2.setCellValue(map.get("creatName").toString());//试卷名称

                //应考人数
                Long TotalNumber = (Long) map.get("TotalNumber");
                cell2 = nextRow.createCell(2);
                cell2.setCellValue(TotalNumber);//应考人数

                //实考人数
                Long ActualTOTAL = (Long) map.get("ActualTOTAL");
                cell2 = nextRow.createCell(3);
                cell2.setCellValue(ActualTOTAL);//实考人数


                cell2 = nextRow.createCell(4);
                cell2.setCellValue(TotalNumber - ActualTOTAL );//未考人数

                cell2 = nextRow.createCell(5);
                cell2.setCellValue(map.get("passPeople").toString());//及格人数

                cell2 = nextRow.createCell(6);
                cell2.setCellValue(map.get("failPeople").toString());//不及格人数

                list.remove(map);
                break;
            }
        }


        download(workbook);


        return null;
    }


    public void download(HSSFWorkbook workbook){
        String pathUrl = getRequest().getSession().getServletContext().getRealPath("");

        String newfileName = UUID.randomUUID().toString();// 创建随机的图片名称

        String excelUrl = "file" + File.separator + newfileName + ".xls";// 图片的全路径

        String resultUrl = pathUrl.substring(0, pathUrl.lastIndexOf(File.separator));
        resultUrl = resultUrl.substring(0,resultUrl.lastIndexOf(File.separator)) + File.separator + excelUrl;

        File file = new File(resultUrl);
        try {
            file.createNewFile();
            // 打开文件输出流
            FileOutputStream fos = FileUtils.openOutputStream(file);
            // 将workbook写入流
            workbook.write(fos);
            fos.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        try {
            FileDownLoadUtil.downLoad(getResponse(), resultUrl,  newfileName+ ".xls");
            if(file.exists()){
                file.delete();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }



    /**
     * 导出实考人数考试信息
     * @return
     */
    @RequestMapping("/downloadHaveTheTest")
    public String downloadHaveTheTest(Long examId){
        List<Map<String,Object>> list = statisticsService.downloadHaveTheTest(examId);

        String[] title = {"考试名称","试卷名称","所属机构","考生名称","考生工号","考试时间","试卷分数","考试分数","是否及格"};

        //创建Excel工作簿
        HSSFWorkbook workbook = new HSSFWorkbook();
        //创建一个工作表 sheet
        HSSFSheet sheet = workbook.createSheet("sheet0");

        sheet.setDefaultColumnWidth(16);
        sheet.setDefaultRowHeightInPoints(16);
        // 设置单元格字体
        HSSFFont font = workbook.createFont();
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        font.setFontName("宋体");
        font.setFontHeight((short) 300);
        //创建第一行
        HSSFRow row1 = sheet.createRow(0);
        //插入第一行数据 title
        HSSFCell cell1 = null;
        for (int i = 0; i < title.length; i++){
            cell1 = row1.createCell(i);
            cell1.setCellValue(title[i]);
        }
        int count = 0;
        if(list != null && list.size() != 0){
            count = list.size() + 1;
        }
        for (int i = 1; i < count; i++) {
            for (Map<String,Object> map:list){
                HSSFRow nextRow = sheet.createRow(i);
                HSSFCell cell2 = nextRow.createCell(0);
                cell2.setCellValue((String) map.get("examName"));//考试名称

                cell2 = nextRow.createCell(1);
                cell2.setCellValue((String) map.get("creatName"));//试卷名称

                cell2 = nextRow.createCell(2);
                cell2.setCellValue((String) map.get("orgName"));//部门名称

                cell2 = nextRow.createCell(3);
                cell2.setCellValue((String) map.get("nick_name"));//考生名称

                cell2 = nextRow.createCell(4);
                cell2.setCellValue((String) map.get("attr0"));//考生工号

                cell2 = nextRow.createCell(5);
                String creatTime = (String) map.get("creatTime");
                cell2.setCellValue(StringUtil.isBlank(creatTime) ? "":creatTime);//考试时间

                cell2 = nextRow.createCell(6);
                Integer attr5 = (Integer) map.get("paper_totail");
                cell2.setCellValue(attr5 != null && attr5 != 0 ? attr5 : 0);//试卷分数

                cell2 = nextRow.createCell(7);
                cell2.setCellValue((Double) map.get("maxFen"));//考试分数

                Integer isjg = (Integer) map.get("attr6");//是否及格
                cell2 = nextRow.createCell(8);
                if(isjg != null){
                    cell2.setCellValue(isjg != null ? "不及格":"及格");
                } else {
                    cell2.setCellValue("不及格");
                }

                list.remove(map);
                break;
            }
        }
        download(workbook);

        return null;
    }


    /**
     * 导出考试(及格/不及格)
     * @param cmd
     * @param examId
     * @return
     */
    @RequestMapping("/importPassOrFailExcel")
    public String importPassOrFailExcel(Integer cmd,Long examId){
        List<Map<String,Object>> list = statisticsService.importPassOrFailExcel(cmd,examId);
        String[] title = {"考试名称","试卷名称","所属机构","考生名称","考生工号","考试时间","试卷分数","考试分数","是否及格"};

        //创建工作簿
        HSSFWorkbook workbook = new HSSFWorkbook();
        //创建一个工作表 sheet
        HSSFSheet sheet = workbook.createSheet("sheet0");

        sheet.setDefaultColumnWidth(16);
        sheet.setDefaultRowHeightInPoints(16);
        // 设置单元格字体
        HSSFFont font = workbook.createFont();
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        font.setFontName("宋体");
        font.setFontHeight((short) 300);

        //创建第一行
        HSSFRow row1 = sheet.createRow(0);
        //插入第一行数据 title
        HSSFCell cell1 = null;
        for (int i = 0; i < title.length; i++){
            cell1 = row1.createCell(i);
            cell1.setCellValue(title[i]);
        }
        int count = 0;
        if(list != null && list.size() != 0){
            count = list.size() + 1;
        }
        for (int i = 1; i < count; i++) {
            for (Map<String,Object> map:list){
                HSSFRow nextRow = sheet.createRow(i);
                HSSFCell cell2 = nextRow.createCell(0);
                cell2.setCellValue(map.get("examName").toString());//考试名称

                cell2 = nextRow.createCell(1);
                cell2.setCellValue(map.get("creatName").toString());//试卷名称

                cell2 = nextRow.createCell(2);
                cell2.setCellValue(map.get("orgName").toString());

                cell2 = nextRow.createCell(3);
                cell2.setCellValue(map.get("nick_name").toString());//实考人数


                cell2 = nextRow.createCell(4);
                cell2.setCellValue(map.get("attr0").toString());//未考人数

                cell2 = nextRow.createCell(5);
                cell2.setCellValue(map.get("creatTime").toString());//及格人数

                cell2 = nextRow.createCell(6);
                cell2.setCellValue(map.get("attr5").toString());//不及格人数

                cell2 = nextRow.createCell(7);
                cell2.setCellValue(map.get("fen").toString());//不及格人数

                Integer passOrFail = (Integer) map.get("attr6");
                cell2 = nextRow.createCell(8);
                cell2.setCellValue(passOrFail == 0 ? "不及格":"及格");//不及格人数

                list.remove(map);
                break;
            }
        }
        download(workbook);
        return null;
    }


    /**
     * 导出应考人列表
     * @param cmd 0未考 1应考
     * @return
     */
    @RequestMapping("/importShouldExamExcel")
    public String importShouldExamExcel(Long examId,Integer cmd){
        List<Map<String,Object>> list;
        //1为应考
        if(cmd == 1){
            //应考人列表
            list = statisticsService.importShouldExamExcel(examId);
        } else {
            //未考人列表
            list = statisticsService.importNotestExamExcel(examId);
        }

        String[] title = {"考试名称","所属机构","考生名称","考生工号","考生手机号"};

        //创建工作簿
        HSSFWorkbook workbook = new HSSFWorkbook();
        //创建一个工作表 sheet
        HSSFSheet sheet = workbook.createSheet("sheet0");

        sheet.setDefaultColumnWidth(16);
        sheet.setDefaultRowHeightInPoints(16);
        // 设置单元格字体
        HSSFFont font = workbook.createFont();
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        font.setFontName("宋体");
        font.setFontHeight((short) 300);

        //创建第一行
        HSSFRow row1 = sheet.createRow(0);
        //插入第一行数据 title
        HSSFCell cell1 = null;
        for (int i = 0; i < title.length; i++){
            cell1 = row1.createCell(i);
            cell1.setCellValue(title[i]);
        }
        int count = 0;
        if(list != null && list.size() != 0){
            count = list.size() + 1;
        }
        for (int i = 1; i < count; i++) {
            for (Map<String,Object> map:list){
                HSSFRow nextRow = sheet.createRow(i);
                HSSFCell cell2 = nextRow.createCell(0);
                cell2.setCellValue(map.get("exam_name").toString());//考试名称

                cell2 = nextRow.createCell(1);
                cell2.setCellValue(map.get("orgName").toString());//试卷名称

                cell2 = nextRow.createCell(2);
                cell2.setCellValue(map.get("nick_name").toString());

                cell2 = nextRow.createCell(3);
                cell2.setCellValue(map.get("attr0").toString());//实考人数


                cell2 = nextRow.createCell(4);
                cell2.setCellValue(map.get("cell_phone").toString());//未考人数

                list.remove(map);
                break;
            }
        }
        download(workbook);
        return null;
    }



}
