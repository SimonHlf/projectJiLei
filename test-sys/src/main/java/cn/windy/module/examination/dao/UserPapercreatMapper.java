package cn.windy.module.examination.dao;

import cn.windy.module.examination.mybatis.model.UserPapercreat;
import cn.windy.module.examination.mybatis.model.UserPapercreatQuery;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserPapercreatMapper {
    int countByExample(UserPapercreatQuery example);

    int deleteByExample(UserPapercreatQuery example);

    int insert(UserPapercreat record);

    int insertSelective(UserPapercreat record);

    List<UserPapercreat> selectByExample(UserPapercreatQuery example);

    int updateByExampleSelective(@Param("record") UserPapercreat record, @Param("example") UserPapercreatQuery example);

    int updateByExample(@Param("record") UserPapercreat record, @Param("example") UserPapercreatQuery example);
}