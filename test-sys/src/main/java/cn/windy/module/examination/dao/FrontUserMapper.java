package cn.windy.module.examination.dao;

import cn.windy.module.examination.mybatis.model.FrontUser;
import cn.windy.module.examination.mybatis.model.FrontUserQuery;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface FrontUserMapper {
    int countByExample(FrontUserQuery example);

    int deleteByExample(FrontUserQuery example);

    int deleteByPrimaryKey(Long userId);

    int insert(FrontUser record);

    int insertSelective(FrontUser record);

    List<FrontUser> selectByExample(FrontUserQuery example);

    
    /**
     * 列表，条件查询可用
     * @param nickName
     * @param theSignature
     * @param orgId
     * @param startRow
     * @param pageSize
     * @return
     */
     List<Map<String,Object>> getList(@Param("nickName") String nickName,@Param("theSignature") String theSignature,@Param("attr0")String attr0,@Param("orgId") Long orgId,@Param("startRow") Integer startRow,@Param("pageSize") Integer pageSize);
    
    /**
     * 计数
     * @param nickName
     * @param theSignature
     * @param orgId
     * @return
     */
    Long getCount(@Param("nickName") String nickName,@Param("theSignature") String theSignature,@Param("attr0")String attr0,@Param("orgId") Long orgId);
    
    //查找考生考试记录
    List<Map<String,Object>>getOne(@Param("orgId") Long orgId,@Param("userId") Long userId,@Param("startRow") Integer startRow,@Param("pageSize") Integer pageSize);
    
    //查找考生考试记录计数
    Long getOneCount(@Param("orgId") Long orgId,@Param("userId") Long userId);
    
    FrontUser selectByPrimaryKey(Long userId);

    int updateByExampleSelective(@Param("record") FrontUser record, @Param("example") FrontUserQuery example);

    int updateByExample(@Param("record") FrontUser record, @Param("example") FrontUserQuery example);

    int updateByPrimaryKeySelective(FrontUser record);

    int updateByPrimaryKey(FrontUser record);

    List<Map<String,Object>> ztreeMenuTable(@Param("start")Integer start,@Param("end")Integer end,@Param("orgId") Long orgId);

    List<Map<String,Object>> ztreeMenuTable1(@Param("start")Integer start,@Param("end")Integer end,@Param("list") List<Long> ids,@Param("attr0")String attr0);
    /**
     * 考试考试记录
     * @return
     */
    List<Map<String,Object>> ExamineeRecord(@Param("start")Integer start,@Param("end")Integer end,@Param("userId")Long userId);


    /*=============================     前端接口     ======================================*/

    //登陆接口
    List<FrontUser> interFrontUserLogin(@Param("code")String code);

   //个人中心折线图
    List<Map<String,Object>> findLineEcharts(@Param("month") String month,@Param("userId") Long userId);





}