package cn.windy.module.examination.dao;

import cn.windy.module.examination.mybatis.model.WindyRole;
import cn.windy.module.examination.mybatis.model.WindyRoleQuery;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WindyRoleMapper {
    int countByExample(WindyRoleQuery example);

    int deleteByExample(WindyRoleQuery example);

    int deleteByPrimaryKey(Long id);

    int insert(WindyRole record);

    int insertSelective(WindyRole record);

    List<WindyRole> selectByExample(WindyRoleQuery example);

    WindyRole selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") WindyRole record, @Param("example") WindyRoleQuery example);

    int updateByExample(@Param("record") WindyRole record, @Param("example") WindyRoleQuery example);

    int updateByPrimaryKeySelective(WindyRole record);

    int updateByPrimaryKey(WindyRole record);
}