package cn.windy.module.examination.service;

import cn.windy.util.Pagination;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 统计
 */
public interface IStatisticsService {

    /**
     * 考试结果统计
     * @param page
     * @param cmd
     * @param startTime
     * @param endTime
     * @param dropDown
     * @param orgId
     * @return
     */
    List<Map<String,Object>> testResults(Pagination page,Integer cmd,String startTime,String endTime,String dropDown,Long orgId);


    /**
     * 统计 应考人数/实考人数
     * @param page
     * @param cmd
     * @param startTime
     * @param endTime
     * @param dropDown
     * @param orgId
     * @return
     */
    List<Map<String,Object>> therealTest(Pagination page,Integer cmd,String startTime,String endTime,String dropDown,Long orgId);


    /**
     * 1应考 2实考 3未考 4及格 5不及格
     * @param cmd
     * @param examId
     * @param page
     * @return
     */
    List<Map<String,Object>> TherealDetails(Integer cmd,Long examId,Pagination page);


    /**
     * 导出统计列表
     * @param dropDown
     * @param startTime
     * @param endTime
     * @return
     */
    List<Map<String,Object>> importTherealTest(String dropDown,String startTime,String endTime);

    /**
     * 导出实考人数考试信息
     * @param examId
     * @return
     */
    List<Map<String,Object>> downloadHaveTheTest(Long examId);

    /**
     * 导出(及格/不及格)
     * @param cmd
     * @param examId
     * @return
     */
    List<Map<String,Object>> importPassOrFailExcel(Integer cmd,Long examId);

    /**
     * 导出应考人列表
     * @param examId
     * @return
     */
    List<Map<String,Object>> importShouldExamExcel(Long examId);

    /**
     * 导出未考人列表
     * @param examId
     * @return
     */
    List<Map<String,Object>> importNotestExamExcel(Long examId);
}
