package cn.windy.module.examination.dao;

import cn.windy.module.examination.mybatis.model.WindyUsersRolesKey;
import cn.windy.module.examination.mybatis.model.WindyUsersRolesQuery;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WindyUsersRolesMapper {
    int countByExample(WindyUsersRolesQuery example);

    int deleteByExample(WindyUsersRolesQuery example);

    int deleteByPrimaryKey(WindyUsersRolesKey key);

    int insert(WindyUsersRolesKey record);

    int insertSelective(WindyUsersRolesKey record);

    List<WindyUsersRolesKey> selectByExample(WindyUsersRolesQuery example);

    int updateByExampleSelective(@Param("record") WindyUsersRolesKey record, @Param("example") WindyUsersRolesQuery example);

    int updateByExample(@Param("record") WindyUsersRolesKey record, @Param("example") WindyUsersRolesQuery example);
}