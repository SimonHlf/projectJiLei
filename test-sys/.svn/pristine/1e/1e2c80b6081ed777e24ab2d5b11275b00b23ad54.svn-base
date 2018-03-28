package cn.windy.module.examination.dao;

import cn.windy.module.examination.mybatis.model.ExamineeInformation;
import cn.windy.module.examination.mybatis.model.ExamineeInformationQuery;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ExamineeInformationMapper {
    int countByExample(ExamineeInformationQuery example);

    int deleteByExample(ExamineeInformationQuery example);

    int deleteByPrimaryKey(Long id);

    int insert(ExamineeInformation record);

    int insertSelective(ExamineeInformation record);

    List<ExamineeInformation> selectByExample(ExamineeInformationQuery example);

    ExamineeInformation selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") ExamineeInformation record, @Param("example") ExamineeInformationQuery example);

    int updateByExample(@Param("record") ExamineeInformation record, @Param("example") ExamineeInformationQuery example);

    int updateByPrimaryKeySelective(ExamineeInformation record);

    int updateByPrimaryKey(ExamineeInformation record);
}