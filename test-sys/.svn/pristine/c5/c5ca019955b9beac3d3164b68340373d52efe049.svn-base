package cn.windy.module.examination.dao;

import cn.windy.module.examination.mybatis.model.PaperTest;
import cn.windy.module.examination.mybatis.model.PaperTestQuery;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PaperTestMapper {
    int countByExample(PaperTestQuery example);

    int deleteByExample(PaperTestQuery example);

    int deleteByPrimaryKey(Long id);

    int insert(PaperTest record);

    int insertSelective(PaperTest record);

    List<PaperTest> selectByExample(PaperTestQuery example);

    PaperTest selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") PaperTest record, @Param("example") PaperTestQuery example);

    int updateByExample(@Param("record") PaperTest record, @Param("example") PaperTestQuery example);

    int updateByPrimaryKeySelective(PaperTest record);

    int updateByPrimaryKey(PaperTest record);
}