package cn.windy.module.examination.service.impl;

import cn.windy.module.examination.dao.PaperRecordMapper;
import cn.windy.module.examination.dao.PaperSetMapper;
import cn.windy.module.examination.service.IStatisticsService;
import cn.windy.util.DateUtil;
import cn.windy.util.Pagination;
import cn.windy.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 统计
 */
@Service
public class StatisticsService implements IStatisticsService {

    //考试考试记录表
    @Autowired
    PaperRecordMapper paperRecordMapper;



    /**
     * 考试结果统计
     *
     * @param page
     * @param cmd       标识  1为下拉框选中  2为时间段
     * @param startTime 开始时间
     * @param endTime   结束时间
     * @param dropDown  下拉选中时间段 0本月  2本季度  5半年  11一年
     * @return
     */
    @Override
    public List<Map<String, Object>> testResults(Pagination page, Integer cmd, String startTime, String endTime, String dropDown,Long orgId) {
        String month = "";
        if(cmd == null){
            month = DateUtil.getMonth(0);
        }
        if (!StringUtil.isBlank(dropDown)) {
            month = DateUtil.getMonth(Integer.parseInt(dropDown));
        }
        return paperRecordMapper.testResults((page.getPage() - 1) * page.getPageSize(), page.getPageSize(),startTime,endTime,month,orgId);
    }



    @Override
    public List<Map<String, Object>> therealTest(Pagination page, Integer cmd, String startTime, String endTime, String dropDown, Long orgId) {
        String month = "";
        if(cmd == null){
            month = DateUtil.getMonth(0);
        }
        if(!StringUtil.isBlank(dropDown)){
            month = DateUtil.getMonth(Integer.parseInt(dropDown));
        }
        return paperRecordMapper.therealTest((page.getPage() - 1) * page.getPageSize(),page.getPageSize(),startTime,endTime,month,orgId);
    }


    /**
     * 1应考 2实考 3未考 4及格 5不及格
     * @param cmd
     * @param examId
     * @param page
     * @return
     */
    @Override
    public List<Map<String, Object>> TherealDetails(Integer cmd, Long examId, Pagination page) {
        List<Map<String,Object>> list = null;
        switch (cmd){
            case 1:list = paperRecordMapper.findShouldpeople((page.getPage() - 1 )* page.getPageSize(),page.getPageSize(),examId);break;
            case 2:list = paperRecordMapper.findActualpeople((page.getPage() - 1) * page.getPageSize(),page.getPageSize() ,examId,2);break;
            case 3:list = paperRecordMapper.findNoTestpeopel((page.getPage() - 1) * page.getPageSize(),page.getPageSize(),examId);break;
            case 4:list = paperRecordMapper.findActualpeople((page.getPage() - 1) * page.getPageSize(),page.getPageSize() ,examId,1);break;
            case 5:list = paperRecordMapper.findActualpeople((page.getPage() - 1) * page.getPageSize(),page.getPageSize() ,examId,0);break;
        }
        return list;
       /* if(cmd == 1){
            return paperRecordMapper.findShouldpeople((page.getPage() - 1 )* page.getPageSize(),page.getPageSize(),examId);
        } else if(cmd == 2) {
            return paperRecordMapper.findActualpeople((page.getPage() - 1) * page.getPageSize(),page.getPageSize() ,examId);
        } else if(cmd == 3){
            return paperRecordMapper.findNoTestpeopel((page.getPage() - 1) * page.getPageSize(),page.getPageSize(),examId);
        } else {

        }*/
    }

    /**
     * 导出统计列表
     * @param dropDown
     * @param startTime
     * @param endTime
     * @return
     */
    @Override
    public List<Map<String, Object>> importTherealTest(String dropDown, String startTime, String endTime) {
        String month = "";
        if(!StringUtil.isBlank(dropDown)){
            month = DateUtil.getMonth(Integer.parseInt(dropDown));
        }
        return paperRecordMapper.importTherealTest(month,startTime,endTime);
    }

    /**
     * 导出实考人数考试信息
     * @param examId
     * @return
     */
    @Override
    public List<Map<String, Object>> downloadHaveTheTest(Long examId) {
        return paperRecordMapper.downloadHaveTheTest(examId);
    }


    @Override
    public List<Map<String, Object>> importPassOrFailExcel(Integer cmd, Long examId) {
        return paperRecordMapper.importPassOrFailExcel(cmd,examId);
    }



    @Override
    public List<Map<String, Object>> importShouldExamExcel(Long examId) {
        return paperRecordMapper.importShouldExamExcel(examId);
    }

    @Override
    public List<Map<String, Object>> importNotestExamExcel(Long examId) {
        return paperRecordMapper.importNotestExamExcel(examId);
    }


}
