package cn.windy.module.examination.service;

import java.util.List;

import cn.windy.module.examination.mybatis.model.ExamineeInformation;
import cn.windy.module.examination.mybatis.model.WindyOrg;
import cn.windy.util.Pagination;

public interface ExamineeInformationService {

	/**
	 * 查找列表,根据条件查询可用
	 * @param page
	 * @return
	 */
	List<ExamineeInformation> getList(Pagination page,String exName,Long exNum);
	
	/**
	 * 添加、前查询所有机构
	 * @return
	 */
	List<WindyOrg> getWindyOrgList();
	
	/**
	 * 添加考生信息
	 * @param examineeInformation
	 */
	void add(ExamineeInformation examineeInformation);
	
	/**
	 * 根据id查找考生
	 * @param id
	 * @return
	 */
	ExamineeInformation getById(Long id);
	
	/**
	 * 修改
	 * @param examineeInformation
	 */
	void update(ExamineeInformation examineeInformation);
	
	
	
}
