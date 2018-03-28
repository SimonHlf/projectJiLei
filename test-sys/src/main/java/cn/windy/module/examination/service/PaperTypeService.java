package cn.windy.module.examination.service;

import java.util.List;
import java.util.Map;

import cn.windy.module.examination.mybatis.model.PaperType;
import cn.windy.module.examination.mybatis.model.WindyOrg;
import cn.windy.util.Pagination;

public interface PaperTypeService {
	
	//列表
	List<Map<String,Object>> getList(Pagination page,String name,String orgName,Long orgId);
	
	//计数
	Long getCount(String name,String orgName,Long orgId);
	
	
	void add(PaperType paperType);
		
	void delete(String ids);
	
	PaperType getById(Long id);
	
	void update(PaperType paperType);

	List<WindyOrg> getWindyOrgList();


	
}
