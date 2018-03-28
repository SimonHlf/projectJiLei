package cn.windy.module.examination.dao;

import cn.windy.module.examination.mybatis.model.PaperCreat;
import cn.windy.module.examination.mybatis.model.PaperCreatQuery;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface PaperCreatMapper {
    int countByExample(PaperCreatQuery example);

    int deleteByExample(PaperCreatQuery example);

    int deleteByPrimaryKey(Long id);

    int insert(PaperCreat record);

    int insertSelective(PaperCreat record);

    List<PaperCreat> selectByExample(PaperCreatQuery example);

    //
    List<Map<String,Object>> getList(@Param("paperCreatId") Long paperCreatId,@Param("insId") Long insId,@Param("name") String name,@Param("orgName") String orgName,@Param("paperTypeId") Long paperTypeId,@Param("type") Integer type,@Param("startRow") Integer startRow,@Param("pageSize") Integer pageSize);
    
    //
    Long getCount(@Param("paperCreatId") Long paperCreatId,@Param("insId") Long insId,@Param("name") String name,@Param("orgName") String orgName,@Param("paperTypeId") Long paperTypeId,@Param("type") Integer type);
    
    //前台查询当前用户要考试的试卷 
    List<Map<String,Object>> getPaperCreatToFornt(@Param("userId") Long userId,@Param("examinationIdList") List<Long> examinationIdList,@Param("orgId") Long orgId,@Param("paperName") String paperName,@Param("startRow") Integer startRow,@Param("pageSize") Integer pageSize);
    //前台查询当前用户要考试的试卷 计数
    Long getPaperCreatToForntCount(@Param("userId") Long userId,@Param("examinationIdList") List<Long> examinationIdList,@Param("orgId") Long orgId,@Param("paperName") String paperName);
    //修改试卷设置前查找
    List<Map<String,Object>> getExamNum(@Param("paperCreatId") Long paperCreatId);
    
    Integer getTypeQuestionsNum(@Param("paperCreatId") Long paperCreatId);
    
    PaperCreat selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") PaperCreat record, @Param("example") PaperCreatQuery example);

    int updateByExample(@Param("record") PaperCreat record, @Param("example") PaperCreatQuery example);

    int updateByPrimaryKeySelective(PaperCreat record);

    int updateByPrimaryKey(PaperCreat record);

    //下拉框全部试题
    List<PaperCreat> findAllSelectTwo(@Param("orgId")Long orgId);


    /**
     * 传入试题分类id 获取试卷下试题
     * @param start
     * @param end
     * @param creatId
     * @param typeIdList
     * @return
     */
    List<Map<String,Object>> findCreatQuestions(@Param("start")Integer start,@Param("end")Integer end,@Param("creatId")Long creatId,@Param("typeIdList")List<Long> typeIdList);

}