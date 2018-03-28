package cn.windy.module.examination.service;

import cn.windy.module.examination.mybatis.model.WindyOrg;
import cn.windy.util.Pagination;

import java.util.List;
import java.util.Map;

public interface IWindyOrgService {


    /**
     * 获取全部组织树形菜单
     * @return
     */
    List<WindyOrg> findAll();


    /**
     * 获取当前登录账号组织树形菜单
     * @param insId
     * @return
     */
    List<WindyOrg> findByInsId(Long insId);

    /**
     * 获取去除机务段
     */
    List<WindyOrg> findRemoveZero();


	Long getById(Long windyOrgId);


	WindyOrg getFormId(Long orgId);


	//获取当前登录组织结构
	List<Map<String,Object>> findThisOrgByorgId(Long orgId, Pagination page, int bs);

	//获取当前点击树形结构下table
	List<Map<String,Object>> findClickZtreeByOrgId(Long orgId,Pagination page,int bs);

}
