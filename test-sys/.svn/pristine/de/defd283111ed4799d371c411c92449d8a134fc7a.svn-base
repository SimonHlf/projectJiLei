package cn.windy.module.examination.dao;

import cn.windy.module.examination.mybatis.model.Questions;
import cn.windy.module.examination.mybatis.model.WindyOrg;
import cn.windy.module.examination.mybatis.model.WindyOrgQuery;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface WindyOrgMapper {
    int countByExample(WindyOrgQuery example);

    int deleteByExample(WindyOrgQuery example);

    int deleteByPrimaryKey(Long id);

    int insert(WindyOrg record);

    int insertSelective(WindyOrg record);

    List<WindyOrg> selectByExample(WindyOrgQuery example);

   //共享试题用，排除当前部门
    List<WindyOrg> searchExcpet(@Param("windyOrgId") Long windyOrgId);
    
    WindyOrg selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") WindyOrg record, @Param("example") WindyOrgQuery example);

    int updateByExample(@Param("record") WindyOrg record, @Param("example") WindyOrgQuery example);

    int updateByPrimaryKeySelective(WindyOrg record);

    int updateByPrimaryKey(WindyOrg record);

    List<WindyOrg> findByInsId(@Param("insId")Long insId);

    List<WindyOrg> findRemoveZero();

    List<WindyOrg> findOrgListByOrgPid(@Param("orgId")Long orgId);

    /**
     * 获取 map 机务段
     * @return
     */
    List<Map<String,Object>> findMapOrgByOrgId(@Param("orgId") Long orgId);

    /**
     * 获取当前 map 组织
     * @param orgId
     * @return
     */
    List<Map<String,Object>> findThisOrg(@Param("orgId") Long orgId);

    List<Map<String,Object>> findThisTable(@Param("start")Integer start,@Param("end")Integer end,@Param("orgIdList")List<Long> orgIdList,@Param("cmd") Integer cmd);
}