package cn.windy.module.examination.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.windy.module.examination.mybatis.model.PaperType;
import cn.windy.module.examination.mybatis.model.PaperTypeQuery;

public interface PaperTypeMapper {
    int countByExample(PaperTypeQuery example);

    int deleteByExample(PaperTypeQuery example);

    int deleteByPrimaryKey(Long id);

    int insert(PaperType record);

    int insertSelective(PaperType record);

    List<PaperType> selectByExample(PaperTypeQuery example);

    //列表
    List<Map<String,Object>>getList( @Param("orgId") Long orgId,@Param("name") String name,@Param("orgName") String orgName,@Param("startRow") Integer startRow,@Param("pageSize") Integer pageSize);
    
    //计数
    Long getCount(@Param("orgId") Long orgId,@Param("name") String name,@Param("orgName") String orgName);
    
    PaperType selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") PaperType record, @Param("example") PaperTypeQuery example);

    int updateByExample(@Param("record") PaperType record, @Param("example") PaperTypeQuery example);

    int updateByPrimaryKeySelective(PaperType record);

    int updateByPrimaryKey(PaperType record);
}