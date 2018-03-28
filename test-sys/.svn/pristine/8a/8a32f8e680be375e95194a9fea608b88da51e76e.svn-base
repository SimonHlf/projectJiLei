package cn.windy.module.examination.service.impl;

import cn.windy.module.examination.dao.WindyOrgMapper;
import cn.windy.module.examination.mybatis.model.WindyOrg;
import cn.windy.module.examination.mybatis.model.WindyOrgQuery;
import cn.windy.module.examination.service.IWindyOrgService;
import cn.windy.util.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class WindyOrgService implements IWindyOrgService {

    @Autowired
    private WindyOrgMapper windyOrgMapper;


    /**
     * 获取全部组织树形菜单
     * @return
     */
    @Override
    public List<WindyOrg> findAll() {
        return windyOrgMapper.selectByExample(null);
    }

    /**
     * 获取当前登录账号组织树形菜单
     * @param insId
     * @return
     */
    @Override
    public List<WindyOrg> findByInsId(Long insId) {

        List<WindyOrg> WindyOrgList = windyOrgMapper.findByInsId(0l);

        WindyOrg windyOrg = windyOrgMapper.selectByPrimaryKey(insId);
        WindyOrgList.add(windyOrg);
        WindyOrgList.addAll(windyOrgMapper.findByInsId(insId));
        return WindyOrgList;
    }

    @Override
    public List<WindyOrg> findRemoveZero() {
        return windyOrgMapper.findRemoveZero();
    }
    
    @Override
    public Long getById(Long windyOrgId) {
    	WindyOrg windyOrg=windyOrgMapper.selectByPrimaryKey(windyOrgId);
    	Long pid=windyOrg.getPid();
    	
    	return pid;
    }
 
    //根据id查找机构
    @Override
    public WindyOrg getFormId(Long orgId){
    	WindyOrg wOrg=windyOrgMapper.selectByPrimaryKey(orgId);
    	return wOrg;
    }

    /**
     * 部门列表
     * @param orgId
     * @param page
     * @param bs
     * @return
     */
    @Override
    public List<Map<String, Object>> findThisOrgByorgId(Long orgId, Pagination page, int bs) {
        List<Map<String,Object>> mapList = new ArrayList<>();
        mapList.addAll(windyOrgMapper.findMapOrgByOrgId(0L));//机务段Id
        mapList.addAll(windyOrgMapper.findThisOrg(orgId));//当前机构id
        mapList.addAll(windyOrgMapper.findMapOrgByOrgId(orgId));//机构下id
        List<Long> orgIdList = new ArrayList<>();
        for (Map<String,Object> map:mapList){
            orgIdList.add((Long) map.get("id"));
        }
        return windyOrgMapper.findThisTable((page.getPage() - 1) * page.getPageSize(),page.getPageSize(),orgIdList,bs);
    }

    /**
     * 点击 ztree 只加载 table 表格不加载 ztree
     * @param orgId
     * @param page
     * @param bs
     * @return
     */
    @Override
    public List<Map<String, Object>> findClickZtreeByOrgId(Long orgId, Pagination page, int bs) {
        List<Map<String,Object>> list = windyOrgMapper.findThisOrg(orgId);
        list.addAll(windyOrgMapper.findMapOrgByOrgId(orgId));
        List<Long> orgIdList = new ArrayList<>();
        for (Map<String,Object> map : list){
            orgIdList.add((Long) map.get("id"));
        }
        return windyOrgMapper.findThisTable((page.getPage() - 1) * page.getPageSize(),page.getPageSize(),orgIdList,bs);
    }


}
