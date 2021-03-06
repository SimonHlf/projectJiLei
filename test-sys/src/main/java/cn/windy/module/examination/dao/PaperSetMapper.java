package cn.windy.module.examination.dao;

import cn.windy.module.examination.mybatis.model.PaperSet;
import cn.windy.module.examination.mybatis.model.PaperSetQuery;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface PaperSetMapper {
    int countByExample(PaperSetQuery example);

    int deleteByExample(PaperSetQuery example);

    int deleteByPrimaryKey(Long id);

    int insert(PaperSet record);

    int insertSelective(PaperSet record);

    List<PaperSet> selectByExample(PaperSetQuery example);

    PaperSet selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") PaperSet record, @Param("example") PaperSetQuery example);

    int updateByExample(@Param("record") PaperSet record, @Param("example") PaperSetQuery example);

    int updateByPrimaryKeySelective(PaperSet record);

    int updateByPrimaryKey(PaperSet record);

  }