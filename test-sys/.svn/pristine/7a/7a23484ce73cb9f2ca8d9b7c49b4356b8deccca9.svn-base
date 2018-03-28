package cn.windy.module.examination.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.windy.util.ReadExcel;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.windy.module.admin.dto.QuestionsDto;
import cn.windy.module.examination.dao.PaperCreatMapper;
import cn.windy.module.examination.dao.QuesTypeMapper;
import cn.windy.module.examination.dao.QuestionsMapper;
import cn.windy.module.examination.dao.WindyOrgMapper;
import cn.windy.module.examination.mybatis.model.PaperCreat;
import cn.windy.module.examination.mybatis.model.QuesType;
import cn.windy.module.examination.mybatis.model.QuesTypeQuery;
import cn.windy.module.examination.mybatis.model.Questions;
import cn.windy.module.examination.mybatis.model.QuestionsQuery;
import cn.windy.module.examination.mybatis.model.WindyOrg;
import cn.windy.module.examination.mybatis.model.WindyOrgQuery;
import cn.windy.module.examination.service.QuestionsService;
import cn.windy.util.DateUtil;
import cn.windy.util.Pagination;

import org.springframework.web.multipart.MultipartFile;

@Service
public class QuestionsServiceImpl implements QuestionsService{

	@Autowired
	private QuestionsMapper questionsMapper;
	
	
	 @Autowired
	 private  WindyOrgMapper windyOrgMapper;
	
	 @Autowired
		private QuesTypeMapper quesTypeMapper;
	 
	 @Autowired
	 private PaperCreatMapper paperCreatMapper;
	//列表
	@Override
	public List<Map<String,Object>> getList(List<Long> quesTypeIdList,Pagination page,Long orgId, String questionName, String typeName, String orgName,Long typeId) {
		List<Map<String,Object>> questionsList=new ArrayList<>();
		if(quesTypeIdList.size()==0) {
			Map<String,Object> paramMap = new HashMap<String,Object>();
			paramMap.put("orgId", orgId);
			paramMap.put("questionName", questionName);
			paramMap.put("typeName", typeName);
			paramMap.put("orgName", orgName);
			paramMap.put("typeId", typeId);
			paramMap.put("startRow", (page.getPage() - 1) * page.getPageSize());
			paramMap.put("pageSize", page.getPageSize());
			questionsList=questionsMapper.getList(paramMap);
		}
		if(quesTypeIdList.size()!=0) {
			Map<String,Object> paramMap = new HashMap<String,Object>();
			paramMap.put("quesTypeIdList", quesTypeIdList);
			paramMap.put("orgId", orgId);
			paramMap.put("questionName", questionName);
			paramMap.put("typeName", typeName);
			paramMap.put("orgName", orgName);
			paramMap.put("typeId", typeId);
			paramMap.put("startRow", (page.getPage() - 1) * page.getPageSize());
			paramMap.put("pageSize", page.getPageSize());
			questionsList=questionsMapper.getList(paramMap);
		}
		
		return questionsList;
	}
	
	//試卷添加試題用
	@Override
	public List<Map<String,Object>> getToZtree(Long typeId) {
		List<Map<String,Object>> questionToZtreeList=questionsMapper.getListss(null, null, null, null, typeId);
		return questionToZtreeList;
	}
	
	
	//计数
	@Override
	public Long getCount(List<Long> quesTypeIdList,Long orgId,String questionName, String typeName, String orgName,Long typeId) {
		Long count=(long)0;
		if(quesTypeIdList.size()==0) {
			Map<String,Object> paramMap = new HashMap<String,Object>();
			paramMap.put("orgId", orgId);
			paramMap.put("questionName", questionName);
			paramMap.put("typeName", typeName);
			paramMap.put("orgName", orgName);
			paramMap.put("typeId", typeId);
			count=questionsMapper.getCount(paramMap);
		}
		if(quesTypeIdList.size()!=0) {
			Map<String,Object> paramMap = new HashMap<String,Object>();
			paramMap.put("quesTypeIdList", quesTypeIdList);
			paramMap.put("orgId", orgId);
			paramMap.put("questionName", questionName);
			paramMap.put("typeName", typeName);
			paramMap.put("orgName", orgName);
			paramMap.put("typeId", typeId);
			count=questionsMapper.getCount(paramMap);
		}
		
		
		return count;
	}

	//获取第二个树形
	@Override
	public List<QuesType> twoZtree(Long windyId){
		QuesTypeQuery query=new QuesTypeQuery();
		QuesTypeQuery.Criteria criteria=query.createCriteria();
		criteria.andInsIdEqualTo(windyId);
		List<QuesType>quesTypeList=quesTypeMapper.selectByExample(query);
		
		return quesTypeList;
	}
	
	//根据分类查找试题
	@Override
	public List<Map<String,Object>> getQuestions(Long quesTypeId,String questionName,Pagination page){
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("quesTypeId", quesTypeId);
		paramMap.put("questionName", questionName);
		paramMap.put("startRow", (page.getPage() - 1) * page.getPageSize());
		paramMap.put("pageSize", page.getPageSize());
		List<Map<String,Object>> quList=questionsMapper.getList(paramMap);
		return quList;
	}
	//根据分类查找试题计数
	@Override
	public Long getQuestionsCount(Long pid,String questionName) {
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("quesTypeId", pid);
		paramMap.put("questionName", questionName);
		Long count=questionsMapper.getCount(paramMap);
		return count;
	}
	
	 /**
     * ztree用(超级管理员用)
     * @return
     */
    @Override
    public List<WindyOrg> getWindyOrgList() {
    	WindyOrgQuery query=new WindyOrgQuery();
    	List<WindyOrg> windyOrgList=windyOrgMapper.selectByExample(query);
		return windyOrgList;
	}
	
    //添加试题前查找机构
    @Override
    public List<WindyOrg> getWindyOrgLists(){
    	WindyOrgQuery query=new WindyOrgQuery();
    	WindyOrgQuery.Criteria criteria=query.createCriteria();
    	criteria.andPidEqualTo((long)0);
    	List<WindyOrg>windyOrgList=windyOrgMapper.selectByExample(query);
    	List<WindyOrg>windyOrgLists=new ArrayList<WindyOrg>();
    	
    	if(windyOrgList.size()!=0){
    		WindyOrgQuery query2=new WindyOrgQuery();
        	WindyOrgQuery.Criteria criteria2=query2.createCriteria();
        	criteria2.andPidEqualTo(windyOrgList.get(0).getId());
        	windyOrgLists=windyOrgMapper.selectByExample(query2);
        	
    	}
    	return windyOrgLists;
    } 
    
    /**
     * 添加或修改前查找所有机构分类(超级管理员，普通管理员用)
     * @return
     */
    @Override
    public List<QuesType> quesTypeList(){
    	QuesTypeQuery query=new QuesTypeQuery();
    	List<QuesType> quesTypeList=quesTypeMapper.selectByExample(query);
    	
    	return quesTypeList;
    }
    
    
    
    /**
     * 再根据机构id查找其分类
     * @param orgId
     * @return
     */
    @Override
    public List<QuesType> quesTypeList(Long orgId){
    	QuesTypeQuery query=new QuesTypeQuery();
    	QuesTypeQuery.Criteria criteria=query.createCriteria();
    	criteria.andInsIdEqualTo(orgId);
    	List<QuesType> quesTypeList=quesTypeMapper.selectByExample(query);
    	return quesTypeList;
    }
    //根据机构id查找一级分类
    @Override
    public List<QuesType> getQuesTypeOne(Long orgId){
    	QuesTypeQuery query=new QuesTypeQuery();
    	QuesTypeQuery.Criteria criteria=query.createCriteria();
    	criteria.andInsIdEqualTo(orgId);
    	criteria.andPidEqualTo((long)0);
    	List<QuesType> quesTypeList=quesTypeMapper.selectByExample(query);
    	return quesTypeList;
    	
    }
    
    //获取二级分类
    @Override
    public List<QuesType> getQuesTypeTwo(Long pid){
    	QuesTypeQuery query=new QuesTypeQuery();
    	QuesTypeQuery.Criteria criteria=query.createCriteria();
    	criteria.andPidEqualTo(pid);
    	List<QuesType> quesTypeList=quesTypeMapper.selectByExample(query);
    	
    	return quesTypeList;
    }
    
    
	/**
	 * 添加
	 * @param questions
	 */
	@Override
	public void add(Questions questions) {
		questions.setCreatTime(DateUtil.getDate()); 
		questionsMapper.insert(questions);
		
	}
	
	/**
	 * 批量删除
	 */
	@Override
	public void delete(String ids) {
		String[] strs = ids.split(",");
        List<Long> list = new ArrayList<>();
        for(String str : strs){
            list.add(Long.parseLong(str));
        }
        QuestionsQuery query=new QuestionsQuery();
        QuestionsQuery.Criteria criteria=query.createCriteria();
        criteria.andIdIn(list);
        questionsMapper.deleteByExample(query);
        
	}
	
	/**
	 *根据id查找
	 * @param id
	 * @return
	 */
	@Override
	public Questions getById(Long id) {
		Questions questions=questionsMapper.selectByPrimaryKey(id);
		return questions;
	}
	
	/**
	 * 修改前查找用，查找所有分类
	 * @return
	 */
	@Override
	public List<QuesType> getQuestionsType(){
		QuesTypeQuery query=new QuesTypeQuery();
		List<QuesType> quesTypeList=quesTypeMapper.selectByExample(query);
		return quesTypeList;
	}
	
	/**
	 * 修改
	 * @param questions
	 */
	@Override
	public void update(Questions questions) {
		questionsMapper.updateByPrimaryKeySelective(questions);
	
	}
	
	
	/*@Override
	public String addQuestions(Long id,Long paperCreatId) {
		
		
		
		return "";
	}*/
	
	//从试卷试题页面跳转到添加试题页面传试题比例和总题数
	@Override
	public Map getshitiBili(String bili,Integer paperTotail,Long paperCreatId) {
		String [] bilis=bili.split(":");
		
		Integer danxuanNums=null;
		Integer duoxianNums=null;
		Integer panduanNums=null;
		
		if(bilis.length==3) {
			danxuanNums=Integer.valueOf(bilis[0]);
			duoxianNums=Integer.valueOf(bilis[1]);
			panduanNums=Integer.valueOf(bilis[2]);
		}else {
			danxuanNums=40;
			duoxianNums=30;
			panduanNums=30;
		}
		
		PaperCreat paperCreat=paperCreatMapper.selectByPrimaryKey(paperCreatId);
		
		//判断试卷原有多少单选题
		if (paperCreat.getOptionOne() != null && !"".equals(paperCreat.getOptionOne())) {
			String[] danxuanNum = paperCreat.getOptionOne().split(",");
			danxuanNums= danxuanNums-danxuanNum.length;
			
		}
		// 判断试卷原有多少多选题
		if (paperCreat.getOptionMore() != null && !"".equals(paperCreat.getOptionMore())) {
			String[] duoxuanNum = paperCreat.getOptionMore().split(",");
			duoxianNums=duoxianNums-duoxuanNum.length;
		}
		// 判断试卷原有多少判断题
		if (paperCreat.getJudge() != null && !"".equals(paperCreat.getJudge())) {
			String[] panduanNum = paperCreat.getJudge().split(",");
			panduanNums=panduanNums-panduanNum.length;
		}
		
		/*String a=null;
		String b=null;
		String c=null;
		
		Double aa=null;
		Double bb=null;
		Double cc=null;
		
		String [] blilis=bili.split(":");
		if(blilis.length==3) {
			  a="0."+blilis[0];
			  aa=Double.valueOf(a);
			  b="0."+blilis[1];
			  bb=Double.valueOf(b);
			  c="0."+blilis[2];
			  cc=Double.valueOf(c);
		}else {
			  a="0.4";
			  aa=Double.valueOf(a);
			  b="0.3";
			  bb=Double.valueOf(b);
			  c="0.3";
			  cc=Double.valueOf(c);
		}
		
		Double paperTotaildouble=new Double((double)paperTotail);
		
		double danxuanNum= paperTotaildouble*aa;
		double duoxianNum= paperTotaildouble*bb;
		double panduanNum= paperTotaildouble*cc;*/
		
		Map<String,Object> ms=new HashMap<String,Object>();
		ms.put("danxuanNums", danxuanNums);
		ms.put("duoxianNums", duoxianNums);
		ms.put("panduanNums", panduanNums);
		
		return ms;
	}
	
	//根据树形查找试题
	@Override
	public Map getquestion(Long insPid,Pagination page){
		List<Map<String,Object>> questionsList=new ArrayList<Map<String,Object>>();
		Map ma=new HashMap<>();
		WindyOrg  windyOrg =windyOrgMapper.selectByPrimaryKey(insPid);
		if( windyOrgMapper.selectByPrimaryKey(insPid).getPid()==0) {
			QuestionsQuery query=new QuestionsQuery();
			Map<String,Object> paramMap = new HashMap<String,Object>();
			paramMap.put("startRow", (page.getPage() - 1) * page.getPageSize());
			paramMap.put("pageSize", page.getPageSize());
			questionsList=questionsMapper.getList(paramMap);
			ma.put("questionsList", questionsList);
			return ma;
		}
		ma=getDiGui(insPid,page);
		return ma;
	}
	
	//接上面的第一个递归
	@Override
	public Map getDiGui(Long pid,Pagination page){
		List<Map<String,Object>> questionsList=new ArrayList<Map<String,Object>>();
		Map ma=new HashMap<>();
		
		WindyOrgQuery query=new WindyOrgQuery();
		WindyOrgQuery.Criteria criteria=query.createCriteria();
		criteria.andPidEqualTo(pid);
		List<WindyOrg> windyOrgList=windyOrgMapper.selectByExample(query);
		if(windyOrgList.size()!=0) {
			for(WindyOrg windyOrg:windyOrgList){
				getDiGui(windyOrg.getId(),page);
			}
		}
		if(windyOrgList.size()==0){
			QuesTypeQuery query2=new QuesTypeQuery();
			QuesTypeQuery.Criteria criteria2=query2.createCriteria();
			criteria2.andInsIdEqualTo(pid);
			List<QuesType> quesTypeList=quesTypeMapper.selectByExample(query2);
			List<QuesType> quesTypeFatherList=new ArrayList<QuesType>();
			if(quesTypeList.size()!=0){
				List<Long> quesTypeIdList=new ArrayList<Long>();
				for(QuesType quesType:quesTypeList){
					if(quesType.getPid()==0){
						quesTypeFatherList.add(quesType);
					}
				}
				for(QuesType quesType:quesTypeFatherList) {
					quesTypeIdList.addAll(getQuestionDiGui(quesType.getId()));
					
				}
				Map<String,Object> paramMap = new HashMap<String,Object>();
				paramMap.put("quesTypeIdList", quesTypeIdList);
				paramMap.put("startRow", (page.getPage() - 1) * page.getPageSize());
				paramMap.put("pageSize", page.getPageSize());
				questionsList=questionsMapper.getList(paramMap);
				Long count=questionsMapper.getCount(paramMap);
				ma.put("questionsList", questionsList);
				ma.put("count", count);
				ma.put("quesTypeIdList", quesTypeIdList);
			}
			
		}
		
		
		
		return ma;
	}
	
	//接上面的第二个递归
	@Override
	public List<Long> getQuestionDiGui(Long quesTypeId){
		/*List<Map<String,Object>> questions=new ArrayList<Map<String,Object>>();*/
		List<Long> quesTypeIdList =new ArrayList<Long>();
		QuesTypeQuery query=new QuesTypeQuery();
		QuesTypeQuery.Criteria criteria=query.createCriteria();
		criteria.andPidEqualTo(quesTypeId);
		List<QuesType>quesTypeList=quesTypeMapper.selectByExample(query);
		if(quesTypeList.size()!=0){
			for(QuesType quesType:quesTypeList) {
				quesTypeIdList.addAll(getQuestionDiGui(quesType.getId()));
			}
		}
		if(quesTypeList.size()==0){
			quesTypeIdList.add(quesTypeId);
			/*QuestionsQuery query2=new QuestionsQuery();
			QuestionsQuery.Criteria criteria2=query2.createCriteria();
			criteria2.andQuesIdEqualTo(quesTypeId);
			List<Map<String,Object>> questionList=questionsMapper.getList(null, null, null, null, quesTypeId,(page.getPage() - 1) * page.getPageSize(), page.getPageSize());
			questions.addAll(questionList);*/
			
		}
		return quesTypeIdList; 
	}
	
	//试题添加获取一级分类
	@Override
	public List<QuesType> getQuesTypeList(){
		QuesTypeQuery query=new QuesTypeQuery();
		QuesTypeQuery.Criteria criteria=query.createCriteria();
		criteria.andPidEqualTo((long)0);
		List<QuesType>quesTypeList=quesTypeMapper.selectByExample(query);
		return quesTypeList;
	}
	
	//试题分享列表
	@Override
	public List<Map<String,Object>> getGong(Long quesTypeId,String name,Pagination page){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("quesTypeId", quesTypeId);
		paramMap.put("name", name);
		paramMap.put("startRow", (page.getPage() - 1) * page.getPageSize());
		paramMap.put("pageSize", page.getPageSize());
		List<Map<String,Object>> questionsList=questionsMapper.getGong(paramMap);
		return questionsList;
	}
	
	//试题分享列表计数
	@Override
	public Long getCounts(Long quesTypeId,String name) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("quesTypeId", quesTypeId);
		paramMap.put("name", name);
		Long count=questionsMapper.getGongCount(paramMap);
		return count;
	}
	
	//根据Id查找机构
	@Override
	public WindyOrg getWindyOrg(Long windyOrgId){
		WindyOrg windyOrg=windyOrgMapper.selectByPrimaryKey(windyOrgId);
		
		return windyOrg;
	}
	
	//根据分类查找试题
	@Override
	public List<Map<String,Object>> getQuestionByType(Long quesTypeId,Pagination page){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("quesTypeId", quesTypeId);
		paramMap.put("startRow", (page.getPage() - 1) * page.getPageSize());
		paramMap.put("pageSize", page.getPageSize());
		List<Map<String,Object>> questionsList=questionsMapper.getGong(paramMap);
		
		/*QuestionsQuery quesy=new QuestionsQuery();
		QuestionsQuery.Criteria criteria=quesy.createCriteria();
		criteria.andQuesIdEqualTo(quesTypeId);
		List<Questions>questionsList=questionsMapper.selectByExample(quesy);*/
		return questionsList;
	}

	//查看试题添加共享试题用
	@Override
	public List<Questions> searche(List<Long>questionsIdList){
		QuestionsQuery query=new QuestionsQuery();
		QuestionsQuery.Criteria criteria=query.createCriteria();
		criteria.andIdIn(questionsIdList);
		List<Questions>QuestionsList=questionsMapper.selectByExample(query);
		return QuestionsList;
		
	}
	
	//共享试题用，排除当前部门
	@Override
	public List<WindyOrg> searchExcpet(Long windyOrgId){
		List<WindyOrg>windyOrgList =windyOrgMapper.searchExcpet(windyOrgId);
		return windyOrgList;
	}
	
	//根据分类id查找其下的试题
	@Override
	public List<Questions> getQuestions(Long quesTypeId){
		QuestionsQuery query=new QuestionsQuery();
		QuestionsQuery.Criteria criteria=query.createCriteria();
		criteria.andQuesIdEqualTo(quesTypeId);
		List<Questions>questionsList=questionsMapper.selectByExample(query);
		return questionsList;
	}

	/**
	 * 批量导入试题
	 * @param multipartFile
	 */
	@Override
	public void batchImport(MultipartFile multipartFile,Long pid) {
		ReadExcel readExcel = new ReadExcel();
		List<Map<String,Object>> list = readExcel.getExcelInfo(multipartFile,1);
		String date = DateUtil.getDate();
		for(Map<String,Object> map : list){
			try {
				Questions questions = new Questions();
				questions.setQuesId(pid);//分类id
				questions.setCreatTime(date);
				questions.setName(map.get("quesName").toString());//题名称
				questions.setTitle(map.get("quesName").toString());//题名称
				if(map.get("type").toString().equals("2")){
					questions.setAnswer(map.get("rightKey").toString());//结果
					questions.setType(2);//单选多选判断
				}else{
					questions.setOptionA(map.get("A").toString());
					questions.setOptionB(map.get("B").toString());
					questions.setOptionC(map.get("C").toString());
					questions.setOptionD(map.get("D").toString());
					questions.setAnswer(map.get("rightKey").toString());
					questions.setAttr8(0);
					questions.setType(Integer.parseInt(map.get("type").toString()));
				}
//				questions.setIsShare(Integer.parseInt(map.get("gongiang").toString()));
				questionsMapper.insert(questions);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	}

	@Override
	public List<Questions> getAll(Pagination page,List<Long> list) {
		List<Questions> list1 = questionsMapper.getAll((page.getPage() - 1) * page.getPageSize(), page.getPageSize(),list,null);
		return list1;
	}

	@Override
	public List<Questions> getAllCount(List<Long> list) {
		List<Questions> list1 = questionsMapper.getAllCount(list);
		return list1;
	}


	//根据子id查找父分类id,题库分类删除后返回用
	@Override
	public Long getFn(Long quesTypeId){
		QuesType quesType=quesTypeMapper.selectByPrimaryKey(quesTypeId);
		Long quesTypePid=quesType.getPid();
		
		return quesTypePid;
	}
	
	

	@Override
	public List<QuestionsDto> getByType(Pagination page,List<Long> list,String name,String attr8) {
		List<Questions> list1 = new ArrayList<Questions>();
		if(attr8!=null){
			list1 = questionsMapper.getByType((page.getPage()-1)*page.getPageSize(), page.getPageSize(),list,name,attr8);
		}else{
			list1 = questionsMapper.getByType((page.getPage()-1)*page.getPageSize(), page.getPageSize(),list,name,attr8);
		}
		List<QuestionsDto> listDto = new ArrayList<QuestionsDto>();
		for (int i = 0; i < list1.size(); i++) {
			QuestionsDto dto = new QuestionsDto();
			dto.setCreatTime(list1.get(i).getCreatTime());
			dto.setId(list1.get(i).getId());
			dto.setName(list1.get(i).getName());
			dto.setType(list1.get(i).getType().toString());
			dto.setAttr8(list1.get(i).getAttr8());
			QuesType quesType = quesTypeMapper.selectByPrimaryKey(list1.get(i).getQuesId());
			//查询所属机构
			WindyOrg org = windyOrgMapper.selectByPrimaryKey(quesType.getInsId());
			dto.setTypeName(org.getName());
			dto.setOrgName(quesType.getName());
			listDto.add(dto);
		}
		
		return listDto;
	}

	@Override
	public List<Questions> getByTypeCount(List<Long> list,String name) {
		List<Questions> list1 = questionsMapper.getByTypeCount(list,name);
		return list1;
	}


	//==================================前台接口==========================================
	
	
	
	
	
	
}
