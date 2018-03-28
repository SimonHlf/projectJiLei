package cn.windy.module.examination.dao;

import cn.windy.module.examination.mybatis.model.PapersetNum;
import cn.windy.module.examination.mybatis.model.PapersetNumQuery;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PapersetNumMapper {
    int countByExample(PapersetNumQuery example);

    int deleteByExample(PapersetNumQuery example);

    int deleteByPrimaryKey(Long id);

    int insert(PapersetNum record);

    int insertSelective(PapersetNum record);

    List<PapersetNum> selectByExample(PapersetNumQuery example);

    PapersetNum selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") PapersetNum record, @Param("example") PapersetNumQuery example);

    int updateByExample(@Param("record") PapersetNum record, @Param("example") PapersetNumQuery example);

    int updateByPrimaryKeySelective(PapersetNum record);

    int updateByPrimaryKey(PapersetNum record);
}