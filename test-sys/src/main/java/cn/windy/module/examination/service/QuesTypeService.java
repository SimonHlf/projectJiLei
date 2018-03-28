package cn.windy.module.examination.service;

import java.util.List;
import java.util.Map;

import cn.windy.module.examination.mybatis.model.QuesType;
import cn.windy.module.examination.mybatis.model.WindyOrg;
import cn.windy.util.MenuTree;
import cn.windy.util.Pagination;

public interface QuesTypeService {
	
	/**
	 * 列表
	 * @param page
	 * @return
	 */
	List<Map<String,Object>> getList(List<Long>insIdList,Pagination page,Long insId);
	
	Long getCount(List<Long>insIdList,Long insId);
	
	/**
	 * 添加
	 * @param quesType
	 */
	void add(QuesType quesType);
	
	
	/**
	 * 根据id查找
	 * @param id
	 * @return
	 */
	QuesType getById(Long id);
	
	/**
	 * 修改
	 * @param quesType
	 */
	void update(QuesType quesType);

	List<WindyOrg> getWindyOrgList();

	void delete(String ids);

	boolean getRole(Long userId);

	List<QuesType> getAll();

	List<WindyOrg> getByOrg(Long insId);

	List<QuesType> getS(Long pid);

	Map getZtreeFenye(Long pid, Pagination page);

	Long getZtreeFenyeCount(Long pid);

	List<QuesType> getZtrees(Long insId);

	

	List<WindyOrg> getWindyOrgSList(Long insId);

	List<WindyOrg> deGui(Long insId);

	List<Long> getZtreeDigui(Long pid);

	List<QuesType> getQuesType(Long insId);

	List<WindyOrg> getAddBef();

	List<QuesType> twoZtree(Long windyId);

	List<Map<String, Object>> sonList(Long quesTypeId,Pagination page);

	Long getSonListCount(Long quesTypeId);

	List<WindyOrg> getquesTypeNow(Long insId);

	List<WindyOrg> getWindyOrg();



	List<Long> getDigui1(Long pid);

	List<Long> getDiGui2(Long pid);



	Map getQuesTypeLists(Long pid, Pagination page);

	List<QuesType> getAllType();

	List<Map<String, Object>> getAllFnYe(Pagination page);

	Long getAllFeYeCount();

	List<Map<String, Object>> getWindyOrgLists();

	List<Map<String, Object>> getZtreeNFen(Long pid);

	Map<String, Object> getOne(String id);

	List<Long> getByWid(String wid);
	
	List<QuesType> treeQuesTypeList(List<QuesType> list,Long id);
	
	List<Long> findByZtree(Integer level,String pid,boolean s);
	
	List<Map<String,Object>> getByNotFen(Long pid);
}
