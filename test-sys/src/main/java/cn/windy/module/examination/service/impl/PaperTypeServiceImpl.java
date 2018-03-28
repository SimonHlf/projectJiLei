package cn.windy.module.examination.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.windy.module.examination.dao.PaperTypeMapper;
import cn.windy.module.examination.dao.WindyOrgMapper;
import cn.windy.module.examination.mybatis.model.PaperType;
import cn.windy.module.examination.mybatis.model.PaperTypeQuery;
import cn.windy.module.examination.mybatis.model.WindyOrg;
import cn.windy.module.examination.mybatis.model.WindyOrgQuery;
import cn.windy.module.examination.service.PaperTypeService;
import cn.windy.util.Pagination;

@Service
public class PaperTypeServiceImpl implements PaperTypeService{

	@Autowired
	private PaperTypeMapper paperTypeMapper;
	
	@Autowired
    WindyOrgMapper windyOrgMapper;
	/**
	 * 列表，根据条件查找可用
	 */
	@Override
	public List<Map<String, Object>> getList(Pagination page, String name, String orgName,Long orgId) {
		
		List<Map<String,Object>> paperTypeList=paperTypeMapper.getList(orgId,name, orgName, (page.getPage()-1)*page.getPageSize(), page.getPageSize());
		
		return paperTypeList;
	}

	/**
	 * 计数
	 */
	@Override
	public Long getCount(String name, String orgName,Long orgId) {
		Long count=paperTypeMapper.getCount(orgId,name,orgName);
		return count;
	}

	
	
	/**
	 * 添加前查找所有机构（超管用）
	 */
	@Override
	public List<WindyOrg> getWindyOrgList(){
		WindyOrgQuery query=new WindyOrgQuery();
    	List<WindyOrg> windyOrgList=windyOrgMapper.selectByExample(query);
    	return windyOrgList;
	}
	
	/**
	 * 添加
	 */
	@Override
	public void add(PaperType paperType) {
		paperTypeMapper.insert(paperType);
		
	}

	@Override
	public void delete(String ids) {
		 String[] strs = ids.split(",");
	        List<Long> list = new ArrayList<>();
	        for(String str : strs){
	            list.add(Long.parseLong(str));
	        }
	        PaperTypeQuery query=new PaperTypeQuery();
	        PaperTypeQuery.Criteria criteria=query.createCriteria();
	        criteria.andIdIn(list);
	        paperTypeMapper.deleteByExample(query);
		
	}

	/**
	 * 根据id查找
	 */
	@Override
	public PaperType getById(Long id) {
		PaperType paperType=paperTypeMapper.selectByPrimaryKey(id);
		return paperType;
	}

	/**
	 * 修改
	 */
	@Override
	public void update(PaperType paperType) {
		paperTypeMapper.updateByPrimaryKey(paperType);
		
	}
	
	
	
	
	
	
	
}
