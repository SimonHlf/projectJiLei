package cn.windy.module.examination.service;

import java.util.List;
import java.util.Map;

import cn.windy.module.examination.mybatis.model.PaperCreat;
import cn.windy.module.examination.mybatis.model.PaperType;
import cn.windy.module.examination.mybatis.model.QuesType;
import cn.windy.module.examination.mybatis.model.Questions;
import cn.windy.module.examination.mybatis.model.WindyOrg;
import cn.windy.util.Pagination;

public interface PaperCreatService {
	//查找列表
	List<Map<String,Object>> paperCreatList(Long paperCreatId,Pagination page,Long insId,String name,String orgName,Long paperTypeId,Integer type);
	
	//添加或修改前查找所有机构
	List<WindyOrg> getWindyOrgList();
	
	//添加
	void add(PaperCreat paperCreat);
	//删除
	void delet(String ids);
	
	//根据Id查找
	PaperCreat getById(Long id);
	
	
	//修改
	void update(PaperCreat paperCreat);

	Long getCount(Long paperCreatId,Long insId,String name, String orgName, Long paperTypeId, Integer type);

	List<PaperType> getPaperType(Long insId);

	List<QuesType> QuesTypeList(Long paperCreatId);

	List<Questions> questionsFromPaperList(Long typeId,Long paperCreatId,Pagination page);

	Long getPaperQuestionCount(Long typeId,Long paperCreatId);

	//添加前查看本机构题库
	List<Map<String,Object>> questionsList(Long insId, Long quesTypeId, List<Long> quesTypeIdList,String name,Pagination page);
	//添加前查看本机构题库计算
	Long questionsListCount(Long insId, Long quesTypeId, List<Long> quesTypeIdList,String name);
	
	/**
	 * 根据机构查找试卷
	 * @param insId
	 * @return
	 */
	List<Map<String,Object>> getPaperCreatWillDo(Long insId,String paperName);

	Map getPaperSet(Long paperCreatId);

	Map getquestions(Long orgId, Integer danxuanNum, Integer duoxuanNum, Integer panduanNum,Long paperCreatId);

	Map getDanxuanAnswer(String danxuansss,List<Questions> danxuanToList,Integer danxuantiZong,Long paperCreatId);

	Map getPanduanAnswer(String panduanaaa, List<Questions> panduanToList, Integer panduantiZong,Long paperCreatId);

	Map getDuoxuanAnswer(String duoxuanddd, List<Questions> duoxianToList, Integer duoxuantiZong,Long paperCreatId);

	void toRecord(Long userId, Long paperCreatId, Map danxuanMap, Map duoxuanMap, Map panduanMap, String danxuansss,
			String panduanaaa, String duoxuanddd,Integer danxuanNum,Integer duoxuanNum,Integer panduanNum,Double zongDeFen,Integer a,Long examId);

	Map getAllList(String danxuanIdList, String duoxuanIdList, String panduanIdList);

	Integer idToLine(Long paperCreatId, Double zongDeFen);

	List<QuesType> getQuesTypeListByOrgId(Long paperCreatId);



	//下拉框
	List<PaperCreat> findAllSelectTwo(Long orgId);




	List<Map<String, Object>> getPaperCreat(Long pid, Pagination page);

	String getName(Long paperCreatId);

	String getOrgName(Long paperCreatId);

	PaperCreat getDaoShu(Long paperCreatId);


	String getPanduan(Long paperCreatId);

	Long yulan(Long paperCreatId);

	void updateStaute(Long examId, Long userId);

	Integer getToTestTime(Long userId, Long examId,Long paperCreatId);

	Map getShiTiForWord(Long paperCreatId);

	String getOneWindyOrg();

	List<Map<String, Object>> getExamNum(Long paperCreatId);

	void put(Long userId, Long paperCreatId);


	List<QuesType> getQuesTypeList(Long insId);

	Map getQuestionShouDong(Long paperCreatId);

	Map getTypeQuestionsNum(Long quesTypeId);

	Long getCountss(Long pid);

	List<Map<String, Object>> getAllPaperCreat(Pagination page);

	Long getCount();

	Long getAllPaperCreatCount();

	boolean getIdSet(Long paperCreatId);

	
	List<Long> getQuesTypeIdList(Long pid);

	Map getquestionByFenLei(Long pid, Pagination page);

	List<Long> getquesTypeIdList(Long quesTypeId);


	/**
	 * 传入试题分类id 获取试卷下试题
	 * @param creatId 试卷 id
	 * @param quesTypeId 分类id
	 * @return
	 */
	List<Map<String,Object>> findCreatQuestions(Long creatId,Long quesTypeId,Pagination page);

	

	boolean deletBeTosee(String ids);
	


	
}
