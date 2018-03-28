package cn.windy.module.examination.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import cn.windy.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.windy.module.examination.dao.ExamPersonnelMapper;
import cn.windy.module.examination.dao.ExaminationMapper;
import cn.windy.module.examination.dao.PaperCreatMapper;
import cn.windy.module.examination.dao.PaperRecordMapper;
import cn.windy.module.examination.dao.PaperSetMapper;
import cn.windy.module.examination.dao.PaperTypeMapper;
import cn.windy.module.examination.dao.PapersetNumMapper;
import cn.windy.module.examination.dao.QuesTypeMapper;
import cn.windy.module.examination.dao.QuestionsMapper;
import cn.windy.module.examination.dao.UserPapercreatMapper;
import cn.windy.module.examination.dao.WindyOrgMapper;
import cn.windy.module.examination.mybatis.model.ExamPersonnel;
import cn.windy.module.examination.mybatis.model.ExamPersonnelQuery;
import cn.windy.module.examination.mybatis.model.Examination;
import cn.windy.module.examination.mybatis.model.ExaminationQuery;
import cn.windy.module.examination.mybatis.model.PaperCreat;
import cn.windy.module.examination.mybatis.model.PaperCreatQuery;
import cn.windy.module.examination.mybatis.model.PaperRecord;
import cn.windy.module.examination.mybatis.model.PaperRecordQuery;
import cn.windy.module.examination.mybatis.model.PaperSet;
import cn.windy.module.examination.mybatis.model.PaperSetQuery;
import cn.windy.module.examination.mybatis.model.PaperType;
import cn.windy.module.examination.mybatis.model.PaperTypeQuery;
import cn.windy.module.examination.mybatis.model.PapersetNum;
import cn.windy.module.examination.mybatis.model.PapersetNumQuery;
import cn.windy.module.examination.mybatis.model.QuesType;
import cn.windy.module.examination.mybatis.model.QuesTypeQuery;
import cn.windy.module.examination.mybatis.model.Questions;
import cn.windy.module.examination.mybatis.model.QuestionsQuery;
import cn.windy.module.examination.mybatis.model.UserPapercreat;
import cn.windy.module.examination.mybatis.model.UserPapercreatQuery;
import cn.windy.module.examination.mybatis.model.WindyOrg;
import cn.windy.module.examination.mybatis.model.WindyOrgQuery;
import cn.windy.module.examination.service.PaperCreatService;
import cn.windy.util.DateUtil;
import cn.windy.util.Pagination;

@Service("paperCreatService")
public class PaperCreatServiceImpl implements PaperCreatService{
	@Autowired
	private PaperCreatMapper paperCreatMapper;
	
	@Autowired
	private WindyOrgMapper windyOrgMapper;
	
	@Autowired
	private PaperTypeMapper paperTypeMapper;
	
	@Autowired
	private QuesTypeMapper  quesTypeMapper;
	
	
	@Autowired
	private QuestionsMapper questionsMapper;
	
	@Autowired
	private PaperSetMapper paperSetMapper;
	
	@Autowired
	private PaperRecordMapper paperRecordMapper;
	
	@Autowired
	private ExamPersonnelMapper examPersonnelMapper;
	
	@Autowired
	private ExaminationMapper examinationMapper;
	
	@Autowired
	private PapersetNumMapper papersetNumMapper; 
	
	@Autowired
	private UserPapercreatMapper userPapercreatMapper;
	
	@Autowired
	private PaperSetMapper PaperSetMapper; 
	//列表
	@Override
	public List<Map<String,Object>> paperCreatList(Long paperCreatId,Pagination page, Long insId,String name, String orgName,Long paperTypeId,Integer type) {
		if(page==null) {
			List<Map<String,Object>> paperCreatList =paperCreatMapper.getList(paperCreatId,null,null, null, null, null, null, null);
			return paperCreatList;
		}
		List<Map<String,Object>> paperCreatList =paperCreatMapper.getList(paperCreatId,insId,name, orgName, paperTypeId, type, (page.getPage() - 1) * page.getPageSize(), page.getPageSize());
		return paperCreatList;
	}

	//计数
	@Override
	public Long getCount(Long paperCreatId,Long insId,String name, String orgName,Long paperTypeId,Integer type) {
		
		Long count=paperCreatMapper.getCount(paperCreatId,insId,name, orgName, paperTypeId, type);
		return count;
				
	}
	
	
	//添加前查找机构
	@Override
	public List<WindyOrg> getWindyOrgList() {
		WindyOrgQuery query=new WindyOrgQuery();
    	List<WindyOrg> windyOrgList=windyOrgMapper.selectByExample(query);
		return windyOrgList;
	}   
	
	//添加前查找试卷分类
	@Override
	public List<PaperType> getPaperType(Long insId){
		PaperTypeQuery query=new PaperTypeQuery();
		PaperTypeQuery.Criteria criteria=query.createCriteria();
		criteria.andInsIdEqualTo(insId);
		List<PaperType> paperTypeList=paperTypeMapper.selectByExample(query);
		
		return paperTypeList;
	}
	
	//获取分类
	@Override
	public List<QuesType> getQuesTypeList(Long insId){
		QuesTypeQuery query=new QuesTypeQuery();
		QuesTypeQuery.Criteria criteria=query.createCriteria();
		criteria.andInsIdEqualTo(insId);
		List<QuesType>quesTypeList=quesTypeMapper.selectByExample(query);
		
		return quesTypeList; 
	}
	
	//添加
	@Override
	public void add(PaperCreat paperCreat) {
		paperCreatMapper.insert(paperCreat);
		
	}

	//删除
	@Override
	public void delet(String ids) {
		String[] strs = ids.split(",");
        List<Long> list = new ArrayList<>();
        for(String str : strs){
            list.add(Long.parseLong(str));
            //删除对应的试卷设置
            PaperSetQuery query=new PaperSetQuery();
        	PaperSetQuery.Criteria criteria=query.createCriteria();
        	criteria.andPaperIdEqualTo(Long.valueOf(str));
            paperSetMapper.deleteByExample(query);
            
            //删除对应的试卷分类题数
            PapersetNumQuery query2=new PapersetNumQuery();
            PapersetNumQuery.Criteria criteria2=query2.createCriteria();
            criteria2.andCreatidEqualTo(Long.valueOf(str));
            papersetNumMapper.deleteByExample(query2);
            
        }
         
        PaperCreatQuery query=new PaperCreatQuery();
        PaperCreatQuery.Criteria criteria=query.createCriteria();
        criteria.andIdIn(list);
        paperCreatMapper.deleteByExample(query);
        
		
	}

	//删除前查看是否有考试与改试卷绑定
	@Override
	public boolean deletBeTosee(String ids) {
		
		Long paperCreatId=Long.valueOf(ids);
		ExaminationQuery query=new ExaminationQuery();
		ExaminationQuery.Criteria criteria=query.createCriteria();
		criteria.andCreatIdEqualTo(paperCreatId);
		List<Examination> examinationList=examinationMapper.selectByExample(query);
		//为true则可以删除，为false则不能删除
		boolean result=false;
		if(examinationList.size()==0) {
			result=true;
		}
		return result;
	}
	
	
	//根据id查找
	@Override
	public PaperCreat getById(Long id) {
		PaperCreat poaperCreat=paperCreatMapper.selectByPrimaryKey(id);
		return poaperCreat;
	}

	//修改
	@Override
	public void update(PaperCreat paperCreat) {
		paperCreatMapper.updateByPrimaryKeySelective(paperCreat);
		
	}
	
	
	//试卷设置前查找题库分类
	@Override
	public List<QuesType> QuesTypeList(Long paperCreatId){
		QuesTypeQuery query=new QuesTypeQuery();
		QuesTypeQuery.Criteria criteria=query.createCriteria();
		criteria.andInsIdEqualTo(paperCreatMapper.selectByPrimaryKey(paperCreatId).getInsId());
		List<QuesType> quesTypeList=quesTypeMapper.selectByExample(query);
		
	   return quesTypeList;
	}
	
	//获取当前试卷的试题列表
	@Override
	public List<Questions> questionsFromPaperList(Long typeId,Long paperCreatId,Pagination page){
		List<Long> optionOneList=new ArrayList<>();
		PaperCreat paperCreat =paperCreatMapper.selectByPrimaryKey(paperCreatId);
		//获取单选题
		if(paperCreat.getOptionOne()!=null && !"".equals(paperCreat.getOptionOne())) {
			String [] optionOne=paperCreat.getOptionOne().split(",");
			for(String s:optionOne) {
				optionOneList.add( Long.valueOf(s));
				
			}   
		}
		
		
		//获取多选选题
		if(paperCreat.getOptionMore()!=null && !"".equals(paperCreat.getOptionMore())) {
			String [] optionMore=paperCreat.getOptionMore().split(",");
			for(String s:optionMore) {
				optionOneList.add( Long.valueOf(s));
			
			}
		}
		
		
		//获取判斷題
		if(paperCreat.getJudge()!=null && !"".equals(paperCreat.getJudge())) {
			String [] judge=paperCreat.getJudge().split(",");
			for(String s:judge) {
				optionOneList.add( Long.valueOf(s));
						
			}
		}
		
		List<Questions> questionsList=new ArrayList<Questions>();
		if(optionOneList.size()!=0) {
			//獲取試卷中的所有試題
			questionsList=questionsMapper.getPaperQuestion(typeId,optionOneList,(page.getPage() - 1) * page.getPageSize(), page.getPageSize());
		}
		
		
		return questionsList;
	}
	
	//根据试题id集合查询试题
	/*@Override*/
	/*public List<Questions> getquestionByQuesTypr(List<Long>questionsIdLists,Pagination page){
		List<Questions> questionsList=questionsMapper.getPaperQuestion(null, questionsIdLists,(page.getPage() - 1) * page.getPageSize(), page.getPageSize())
		
		return questionsList;
	}*/
	
	//根据试题id集合查询试题计数
	/*@Override
	public Long getquestionByQuesTypr(List<Long>questionsIdLists){
		questionsMapper.getPaperQuestionCount(typeId, optionOneList)
		
		
	}*/
	
	
	//获取当前试卷的试题列表的计数
	@Override
	public Long getPaperQuestionCount(Long typeId,Long paperCreatId) {
		List<Long> optionOneList=new ArrayList<>();
		PaperCreat paperCreat =paperCreatMapper.selectByPrimaryKey(paperCreatId);
		//获取单选题
		if(!StringUtil.isBlank(paperCreat.getOptionOne())){
			String[] optionOne = paperCreat.getOptionOne().split(",");
			for (String s : optionOne) {
				optionOneList.add(Long.valueOf(s));

			}
		}

		if(!StringUtil.isBlank(paperCreat.getOptionMore())){
			//获取所选题
			String[] optionMore = paperCreat.getOptionMore().split(",");
			for (String s : optionMore) {
				optionOneList.add(Long.valueOf(s));

			}
		}

		if(!StringUtil.isBlank(paperCreat.getJudge())){
			//获取判斷題
			String[] judge = paperCreat.getJudge().split(",");
			for (String s : judge) {
				optionOneList.add(Long.valueOf(s));

			}
		}
		Long count = 0L;
		if(optionOneList.size()!=0) {
			 count = questionsMapper.getPaperQuestionCount(typeId, optionOneList);
		}
		/*optionOneList.size();*/
	
		return count;
			
	}
	
	//添加前查看本机构题库
	@Override
	public List<Map<String,Object>> questionsList(Long insId,Long quesTypeId,List<Long>quesTypeIdList,String name,Pagination page){
		List<Map<String,Object>> questionsList=questionsMapper.getquestionToAddBe(quesTypeIdList,insId,quesTypeId,name,(page.getPage() - 1) * page.getPageSize(), page.getPageSize());
		
		return questionsList;
	}

	//添加前查看本机构题库计算
	@Override
	public Long questionsListCount(Long insId,Long quesTypeId,List<Long>quesTypeIdList,String name){
		Long count=questionsMapper.getquestionToAddBeCount(quesTypeIdList, insId, quesTypeId,name);
		
		return count;
	}
	
	//根据分类查找试题
	@Override
	public Map getquestionByFenLei(Long pid,Pagination page){
		List<Map<String,Object>> questionList=new ArrayList<>();
		List<Long> quesTypeIdList=new ArrayList<>();
		
		QuesTypeQuery query=new QuesTypeQuery();
		QuesTypeQuery.Criteria criteria=query.createCriteria();
		criteria.andPidEqualTo(pid);
		List<QuesType> quesTypesList=quesTypeMapper.selectByExample(query);
		if(quesTypesList.size()!=0){
			quesTypeIdList.add(pid);
			for(QuesType quesType:quesTypesList){
				quesTypeIdList.addAll(getQuesTypeIdList(quesType.getId()));
			}
			
			
		}
		if(quesTypesList.size()==0){
			quesTypeIdList.add(pid);
		}
		
		List<Map<String,Object>> questionsList=questionsMapper.getquestionToAddBe(quesTypeIdList, null, null,null,(page.getPage() - 1) * page.getPageSize(), page.getPageSize());
		Long count=questionsMapper.getquestionToAddBeCount(quesTypeIdList, null, null,null);
		
		Map ma=new HashMap<>();
		ma.put("questionsList", questionsList);
		ma.put("count", count);
		return ma;
	}
	
	
	//上面的递归
	@Override
	public List<Long> getQuesTypeIdList(Long pid){
		List<Long> quesTypeIdList=new ArrayList<>();
		
		QuesTypeQuery query=new QuesTypeQuery();
		QuesTypeQuery.Criteria criteria=query.createCriteria();
		criteria.andPidEqualTo(pid);
		List<QuesType>quesTypeList=quesTypeMapper.selectByExample(query);
		
		if(quesTypeList.size()!=0){
			for(QuesType quesType:quesTypeList) {
				quesTypeIdList.addAll(getQuesTypeIdList(quesType.getId()));
			}
		}
		if(quesTypeList.size()==0){
			quesTypeIdList.add(pid);
		}
		
		return quesTypeIdList;
	}
	
	//试卷试题页面点击树分页用，把当前分类及分类下的子分类放入一个集合
	@Override
	public  List<Long> getquesTypeIdList(Long quesTypeId){
		List<Long> quesTypeIdList=new ArrayList<>();
		
		QuesTypeQuery query=new QuesTypeQuery();
		QuesTypeQuery.Criteria criteria=query.createCriteria();
		criteria.andPidEqualTo(quesTypeId);
		List<QuesType> quesTypesList=quesTypeMapper.selectByExample(query);
		if(quesTypesList.size()!=0){
			quesTypeIdList.add(quesTypeId);
			for(QuesType quesType:quesTypesList){
				quesTypeIdList.addAll(getQuesTypeIdList(quesType.getId()));
			}
			
			
		}
		if(quesTypesList.size()==0){
			quesTypeIdList.add(quesTypeId);
		}
		
		return quesTypeIdList;
	}




	/**
	 * 根据机构查找试卷(前台用)
	 * @param insId
	 * @return
	 */
	@Override
	public List<Map<String,Object>> getPaperCreatWillDo(Long userId,String paperName){
		//先查考试关联表
		ExamPersonnelQuery query=new ExamPersonnelQuery();
		ExamPersonnelQuery.Criteria criteria=query.createCriteria();
		criteria.andUserIdEqualTo(userId);
//		criteria.andIsExamEqualTo(0);
		List<ExamPersonnel>examPersonnelList=examPersonnelMapper.selectByExample(query);
		List<Map<String,Object>> paperCreatList=new ArrayList<>();
		if(examPersonnelList.size()!=0) {
			List<Long> examinationIdList=new ArrayList<Long>();
			for(ExamPersonnel examPersonnel:examPersonnelList){
				//再查看考试表
				Examination examination=examinationMapper.selectByPrimaryKey(examPersonnel.getExamId());
				examinationIdList.add(examination.getId());
				
			}
			paperCreatList=paperCreatMapper.getPaperCreatToFornt(userId,examinationIdList,null,paperName,null,null);
		}
		
		
		return paperCreatList;
	}
	
	//获取题目设置的出题数量
	@Override
	public Map getPaperSet(Long paperCreatId) {
		PaperCreat paperCreat=paperCreatMapper.selectByPrimaryKey(paperCreatId);
		PaperSetQuery query=new PaperSetQuery();
		PaperSetQuery.Criteria criteria=query.createCriteria();
		criteria.andPaperIdEqualTo(paperCreatId);
		List<PaperSet> paperSetList=paperSetMapper.selectByExample(query);
		Map map=new HashMap<>();
		if(paperSetList.size()!=0) {
			/*String totalNum=paperSetList.get(0).*/
			/*String[] s=totalNum.split(":");*/
			
			String danxuanNum=String.valueOf(paperCreat.getAttr6());
			String duoxuanNum=String.valueOf(paperCreat.getAttr7());
			String panduanNum=String.valueOf(paperCreat.getAttr8());
			//考试时间限制
			String testTime=paperSetList.get(0).getExamTime();
			//分数线
			Integer line=paperSetList.get(0).getPaperLine();
			
			map.put("testTime", testTime);
			map.put("line", line);
			if(danxuanNum!=null && !"".equals(danxuanNum)){
				map.put("danxuanNum", Integer.valueOf(danxuanNum));
			}
			if(duoxuanNum !=null && "".equals(duoxuanNum)){
				map.put("duoxuanNum", Integer.valueOf(duoxuanNum));
			}
			if(panduanNum !=null && "".equals(panduanNum)){
				map.put("panduanNum", Integer.valueOf(panduanNum));
			}
			
			
			
		}
		return map;
	}

	//手动试题展示
	@Override
	public Map getQuestionShouDong(Long paperCreatId){
		PaperSetQuery query2=new PaperSetQuery();
		PaperSetQuery.Criteria criteria2=query2.createCriteria();
		criteria2.andPaperIdEqualTo(paperCreatId);
		List<PaperSet> pList=paperSetMapper.selectByExample(query2);
		//单选题分值
		Integer danxuantiFen=0;
		//多选题分值
		Integer duoxuantiFen=0;
		//判断题分值
		Integer panduantiFen=0;
		
		String testTime=null;
		Integer line=null;
		if(pList.size()!=0){
			danxuantiFen=pList.get(0).getAttr6();
			duoxuantiFen=pList.get(0).getAttr7();
			panduantiFen=pList.get(0).getAttr8();
			//考试时间限制
			testTime=pList.get(0).getExamTime();
			//分数线
			line=pList.get(0).getPaperLine();
			
		}
		
		
		PaperCreat pCreat=paperCreatMapper.selectByPrimaryKey(paperCreatId);
		//单选题
		//单选题id集合
		List<Long> danxuantiIdList=new ArrayList<>();
		String [] danxuantis=null;
		String danxuanti=pCreat.getOptionOne();
		List<Questions> questionsList=new ArrayList<>();
		Integer danxuantiZongFen=0;
		if(danxuanti!=null && danxuanti!="") {
			
			danxuantis=danxuanti.split(",");
			
			for(String s:danxuantis){
				danxuantiIdList.add(Long.valueOf(s));
			}
			
			QuestionsQuery query=new QuestionsQuery();
			QuestionsQuery.Criteria criteria=query.createCriteria();
			criteria.andIdIn(danxuantiIdList);
			//单选题试题集合
			questionsList=questionsMapper.selectByExample(query);
			//单选题总分
			danxuantiZongFen=questionsList.size()*danxuantiFen;
			//为试题添加题号
			Integer danxuanCount=0;
			for(Questions questions:questionsList) {
				danxuanCount+=1;
				questions.setAttr7(danxuanCount);
			}
		}
		
		
		//======================================================================
		//多选题
		//多选题id集合
		List<Long> duoxuantiIdList=new ArrayList<>();
		String [] duoxuantis=null;
		String duoxuanti=pCreat.getOptionMore();
		List<Questions> duoxuantiList=new ArrayList<>();
		Integer duoxuantiZongFen=0;
		if(duoxuanti !=null && duoxuanti !=""){
			
			duoxuantis=duoxuanti.split(",");
			
			for(String s:duoxuantis){
				duoxuantiIdList.add(Long.valueOf(s));
			}
			QuestionsQuery query3=new QuestionsQuery();
			QuestionsQuery.Criteria criteria3=query3.createCriteria();
			criteria3.andIdIn(duoxuantiIdList);
			//多选题试题集合
			duoxuantiList=questionsMapper.selectByExample(query3);
			//多选题总分
			duoxuantiZongFen=duoxuantiList.size()*duoxuantiFen;
			//为多选题添加题号
			Integer duoxuanCount=0;
			for(Questions questions:duoxuantiList){
				duoxuanCount+=1;
				questions.setAttr7(duoxuanCount);
			}
		}
		
		
		
		//==========================================================================
		//判断题
		//判断题id集合
		List<Long> panduantiIdList=new ArrayList<>();
		String [] panduantis=null;
		String panduanti=pCreat.getJudge();
		List<Questions>panduantiList=new ArrayList<>();
		Integer panduantiZongFen=0;
		if(panduanti!=null && panduanti!=""){
			panduantis=panduanti.split(",");
			for (String s:panduantis) {
				panduantiIdList.add(Long.valueOf(s));
			}
			QuestionsQuery query4=new QuestionsQuery();
			QuestionsQuery.Criteria criteria4=query4.createCriteria();
			criteria4.andIdIn(panduantiIdList);
			panduantiList=questionsMapper.selectByExample(query4);
			//判断题总分
			panduantiZongFen=panduantiList.size()*panduantiFen;
			//为判断题添加题号
			Integer panduanCount=0;
			for(Questions questions:panduantiList){
				panduanCount+=1;
				questions.setAttr7(panduanCount);
			}
		}
		
		
		
		Map<String,Object> map=new HashMap<>();
		//考试时间
		map.put("testTime", testTime);
		//分数线
		map.put("line", line);
		//单选题集合
		map.put("questionsList", questionsList);
		//单选题总分
		map.put("danxuantiZongFen", danxuantiZongFen);
		//单选id集合
		map.put("danxuantiIdList", danxuantiIdList);
		//单选题分值
		map.put("danxuantiFen",danxuantiFen);
		
		
		//多选题集合
		map.put("duoxuantiList", duoxuantiList);
		//多选题总分
		map.put("duoxuantiZongFen", duoxuantiZongFen);
		//多选id集合
		map.put("duoxuantiIdList", duoxuantiIdList);
		//多选题分值
		map.put("duoxuantiFen",duoxuantiFen);
		
		//判断题集合
		map.put("panduantiList", panduantiList);
		//判断题总分
		map.put("panduantiZongFen", panduantiZongFen);
		//判断id集合
		map.put("panduantiIdList", panduantiIdList);
		//判断题分值
		map.put("panduantiFen",panduantiFen);
		
		return map;
	}
	
	//TODO
	//前台隨機獲取試題
	@Override
	public Map getquestions(Long orgId,Integer danxuanNum,Integer duoxuanNum,Integer panduanNum,Long paperCreatId){
		PaperCreat paperCreat=paperCreatMapper.selectByPrimaryKey(paperCreatId);
		//单选题总分
		Integer danxuantiZong=0;
		//多选题总分
		Integer duoxuantiZong=0;
		//判断题总分
		Integer panduantiZong=0;
		
		//单选题总数
		Integer danxuanNums=paperCreat.getAttr6();
		//多选题总数
		Integer duoxianNums=paperCreat.getAttr7();
		//判断题总数
		Integer panduanNums=paperCreat.getAttr8();
		
		PaperSetQuery query=new PaperSetQuery();
		PaperSetQuery.Criteria criteria=query.createCriteria();
		criteria.andPaperIdEqualTo(paperCreatId);
		List<PaperSet>paperSetsList=paperSetMapper.selectByExample(query);
		Integer danxuanFen=0;
		Integer duoxuanFen=0;
		Integer panduanFen=0;
		if(paperSetsList.size()!=0){
			//单选题分值
			danxuanFen=paperSetsList.get(0).getAttr6();
			//多选题分值
			duoxuanFen=paperSetsList.get(0).getAttr7();
			//判断题分值
			panduanFen=paperSetsList.get(0).getAttr8();
		}
		
		//单选题总分
		danxuantiZong=danxuanNums*danxuanFen;
		//多选题总分
		duoxuantiZong=duoxianNums*duoxuanFen;
		//判断题总分
		panduantiZong=panduanNums*panduanFen;
		
		
		/*QuesTypeQuery query=new QuesTypeQuery();
		QuesTypeQuery.Criteria criteria=query.createCriteria();
		criteria.andInsIdEqualTo(orgId);*/
		//根據機構id獲取機構下的分類list
		/*List<QuesType> quesTypeList=quesTypeMapper.selectByExample(query);*/
		
		
		//题库中的试题
		List<Questions> QuestionsFromTIku=new ArrayList<Questions>();
		
		//题库中的单选试题
		List<Questions> danxuanList=new ArrayList<Questions>();
		//题库中的多选试题
		List<Questions> duoxuanList=new ArrayList<Questions>();
		//题库中的判断题
		List<Questions> panduanList=new ArrayList<Questions>();
		
		//要添加的单选题下标
		List<Integer> danxuantiIdAddList=new ArrayList<Integer>();
		//要添加的多选题下标
		List<Integer> duoxuantiIdAddList=new ArrayList<Integer>();
		//要添加的判断题下标
		List<Integer> panduantiIdAddList=new ArrayList<Integer>();
		
		
		PapersetNumQuery querys=new PapersetNumQuery();
		PapersetNumQuery.Criteria criterias=querys.createCriteria();
		criterias.andCreatidEqualTo(paperCreatId);
		List<PapersetNum> papersetNumList=papersetNumMapper.selectByExample(querys);
		
		//获得试题分类id集合
		List<Long> quesTypeIdList=new ArrayList<>();
		Integer dancount=0;
		Integer duocount=0;
		Integer pancount=0;
		//要添加的单选题
		List<Questions> danxuansList=new ArrayList<>();
		//要添加的多选题
		List<Questions> duoxuansList=new ArrayList<>();
		//要添加的判断题
		List<Questions> panduansList=new ArrayList<>();
		
		for(PapersetNum papersetNum:papersetNumList){
			//当前单选题限制
			Integer danxuantiLimit=papersetNum.getDanxuannum();
			//当前多选题限制
			Integer duoxuantiLimit=papersetNum.getDuoxuannum();
			//当前判断题限制
			Integer panduantiLimit=papersetNum.getPanudannum();
			
			//当前分类下单选题集合
			List<Questions> danxuanNowList=new ArrayList<>();
			//当前分类下多选题集合
			List<Questions> duoxuanNowList=new ArrayList<>();
			//当前分类下判断题集合
			List<Questions> panduanNowList=new ArrayList<>();
			
			Long quesTypeId=papersetNum.getQuestypeid();
			QuestionsQuery query2=new QuestionsQuery();
			QuestionsQuery.Criteria criteria2=query2.createCriteria();
			criteria2.andQuesIdEqualTo(quesTypeId);
			//当前题库中的该类型下的试题
			List<Questions>questionsList=questionsMapper.selectByExample(query2);
			for(Questions questions:questionsList){
				if(questions.getType()==0){
					//该分类的单选题
					danxuanNowList.add(questions);
				}
				if(questions.getType()==1){
					//该分类的多选题
					duoxuanNowList.add(questions);
				}
				if(questions.getType()==2){
					//该分类的判断题
					panduanNowList.add(questions);
				}
				
			}
			//==============================================================
			//单选随机
			if(danxuantiLimit > danxuanNowList.size()){
				for(Questions questions:danxuanNowList){
					dancount+=1;
					questions.setAttr7(dancount);
				}
				danxuansList.addAll(danxuanNowList);
			}else {
				if(danxuantiLimit!=null && danxuantiLimit!=0){
					for(int i=0;i>=0;i++){
						//通过random产生随机数,随机抽取一道选择题
						Random random=new Random();
						int nd2=random.nextInt(danxuantiLimit);
						if(!danxuantiIdAddList.contains(nd2) ) {
							danxuantiIdAddList.add(nd2);
						}
						if(danxuantiIdAddList.size()==danxuantiLimit) {
							break;
						}
						
					}
					for(Integer danxuan:danxuantiIdAddList){
						dancount+=1;
						danxuanNowList.get(danxuan).setAttr7(dancount);
						//要添加的单选========================
						danxuansList.add(danxuanNowList.get(danxuan));
					}
				}
				
				
			}
			
			//=====================================================================
			
			//多选随机
			if(duoxuantiLimit > duoxuanNowList.size()){
				for(Questions questions:duoxuanNowList){
					duocount+=1;
					questions.setAttr7(duocount);
				}
				duoxuansList.addAll(duoxuanNowList);
			}else {
				if(duoxuantiLimit!= null && duoxuantiLimit!=0){
					for(int i=0;i>=0;i++){
						//通过random产生随机数,随机抽取一道选择题
						Random random=new Random();
						int nd2=random.nextInt(duoxuantiLimit);
						if(!duoxuantiIdAddList.contains(nd2) ) {
							duoxuantiIdAddList.add(nd2);
						}
						if(duoxuantiIdAddList.size()==duoxuantiLimit) {
							break;
						}
					}
					for(Integer duoxuan:duoxuantiIdAddList){
						duocount+=1;
						duoxuanNowList.get(duoxuan).setAttr7(duocount);
						//要添加的单选========================
						duoxuansList.add(duoxuanNowList.get(duoxuan));
					}
				}
				
			}
			
			//=====================================================================
			
			//判断随机
			if(panduantiLimit > panduanNowList.size()){
				for(Questions questions:panduanNowList){
					pancount+=1;
					questions.setAttr7(pancount);
				}
				panduansList.addAll(panduanNowList);
			}else {
				if(panduantiLimit!=null && panduantiLimit!=0){
					for(int i=0;i>=0;i++){
						//通过random产生随机数,随机抽取一道选择题
						Random random=new Random();
						int nd2=random.nextInt(panduantiLimit);
						if(!panduantiIdAddList.contains(nd2) ) {
							panduantiIdAddList.add(nd2);
						}
						if(panduantiIdAddList.size()==panduantiLimit) {
							break;
						}
					}
					for(Integer panduan:panduantiIdAddList){
						pancount+=1;
						panduanNowList.get(panduan).setAttr7(pancount);
						//要添加的单选========================
						panduansList.add(panduanNowList.get(panduan));
					}
				}
			}
			
			/*//要选择试题的下标
			List<Integer> questionsNowIndex=new  ArrayList<Integer>();*/
			
		}
		
		
		
		
		//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		//循環當前機構的分類list
		/*for(Long quesTypeId:quesTypeIdList) {
			QuestionsQuery query2=new QuestionsQuery();
			QuestionsQuery.Criteria criteria2=query2.createCriteria();
			criteria2.andQuesIdEqualTo(quesTypeId);
			//根據當前分類獲取當前機構的當前分類下的試題
			List<Questions> questionsList =questionsMapper.selectByExample(query2);
			//循環試題
			for(Questions questions:questionsList) {
				//把單選題集中到一個list中
				if(questions.getType()==0) {
					danxuanList.add(questions);
				}else if(questions.getType()==1){
					//把多选题集中到一個list中
					duoxuanList.add(questions);
				}else if(questions.getType()==2) {
					//把判断题集中到一个list中
					panduanList.add(questions);
				}
			}
		}
		
		//随机获取题库中的单选题，把其id放入danxuantiAddList中
		Integer danxuanCount=danxuanList.size();
		for(int i=0;i>=0;i++) {
			//通过random产生随机数,随机抽取一道选择题
			Random random=new Random();
			int nd2=random.nextInt(danxuanCount);
			if(!danxuantiIdAddList.contains(nd2) ) {
				danxuantiIdAddList.add(nd2);
			}
			if(danxuantiIdAddList.size()==danxuanNum) {
				break;
			}
			
		}   
		
		//随机获取题库中的多选题，把其id放入xuoxuantiAddList中
		Integer duoxuanCount=duoxuanList.size();
		for(int i=0;i>=0;i++) {
			//通过random产生随机数,随机抽取一道选择题
			Random random=new Random();
			int nd3=random.nextInt(duoxuanCount);
			if(!duoxuantiIdAddList.contains(nd3) ) {
				duoxuantiIdAddList.add(nd3);
			}
			if(duoxuantiIdAddList.size()==duoxuanNum) {
				
				break;
			}
		}
		
		//随机获取题库中的判断题，把其id放入danxuantiAddList中
		Integer panduanCount=panduanList.size();
		for(int i=0;i>=0;i++) {
			//通过random产生随机数,随机抽取一道选择题
			Random random=new Random();
			int nd4=random.nextInt(panduanCount);
			if(!panduantiIdAddList.contains(nd4) ) {
				panduantiIdAddList.add(nd4);
			}
			if(panduantiIdAddList.size()==panduanNum){
				
				break;
			}
		}
		
		//单选题
		List<Questions> danxuanToList=new ArrayList<>();
		//多选题
		List<Questions> duoxianToList=new ArrayList<>();
		//判断题
		List<Questions> panduanToList=new ArrayList<>();
		
		//获取单选题
		Integer danCount=0;
		for(Integer danIndex:danxuantiIdAddList) {
			danCount+=1;
			danxuanList.get(danIndex).setAttr7(danCount);
			danxuanToList.add(danxuanList.get(danIndex));
		}
		
		//获取多选题
		Integer duoCount=0;
		for(Integer duoIndex:duoxuantiIdAddList) {
			duoCount+=1;
			duoxuanList.get(duoIndex).setAttr7(duoCount);
			duoxianToList.add(duoxuanList.get(duoIndex));
		}
		
		//获取判断题
		Integer panCount=0;
		for(Integer panIndex:panduantiIdAddList) {
			panCount+=1;
			panduanList.get(panIndex).setAttr7(panCount);
			panduanToList.add(panduanList.get(panIndex));
		}
		
		//TODO
		
		PaperSetQuery query2=new PaperSetQuery();
		PaperSetQuery.Criteria criteria2=query2.createCriteria();
		criteria2.andPaperIdEqualTo(paperCreatId);
		List<PaperSet> paperSetList=paperSetMapper.selectByExample(query2);
		if(paperSetList.size()!=0){
			danxuantiZong=paperSetList.get(0).getAttr6()*danxuanNum;
			duoxuantiZong=paperSetList.get(0).getAttr7()*duoxuanNum;
			panduantiZong=paperSetList.get(0).getAttr8()*panduanNum;
		}*/
		
		//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		/*for(Questions danquestions:danxuanToList) {
			danxuantiZong+=danquestions.getAttr6();
		}
		for(Questions duoquestions:duoxianToList) {
			duoxuantiZong+=duoquestions.getAttr6();
		}
		
		for(Questions panquestions:panduanToList) {
			panduantiZong+=panquestions.getAttr6();
		}*/
		
		Map map=new HashMap<>();
		//单选题分值
		map.put("danxuanFen", danxuanFen);
		//多选题分值
		map.put("duoxuanFen", duoxuanFen);
		//判断题分值
		map.put("panduanFen", panduanFen);
		
		//单选题
		map.put("danxuanToList", danxuansList);
		//多选题
		map.put("duoxianToList", duoxuansList);
		//判断题
		map.put("panduanToList", panduansList);
		//单选题总分
		map.put("danxuantiZong", danxuantiZong);
		//多选题总分
		map.put("duoxuantiZong", duoxuantiZong);
		//判断题总分
		map.put("panduantiZong", panduantiZong);
		return map;
	}
	
	//单选题解析
	@Override
	public Map getDanxuanAnswer(String danxuansss,List<Questions> danxuanToList,Integer danxuantiZong,Long paperCreatId) {
		PaperSetQuery query=new PaperSetQuery();
		PaperSetQuery.Criteria criteria=query.createCriteria();
		criteria.andPaperIdEqualTo(paperCreatId);
		List<PaperSet>paperSetsList=paperSetMapper.selectByExample(query);
		Integer danxuanCount=paperSetsList.get(0).getAttr6();
		
		int massage=0;
		//单选数组
		String [] danxuanGroup=danxuansss.split(",");
		//单选题试题总分
		Integer countFen=0;
		
		//计算选择题总得分
		Double zongFenDanxuan = (double)0;
		/*List<Double> zongFenDanxuanList=new ArrayList<Double>();*/
		if(danxuanGroup.length!=0){
			for(int i=0;i<danxuanToList.size();i++) {
				if(danxuanGroup[i].equals(danxuanToList.get(i).getAnswer())) {
					zongFenDanxuan+=danxuanCount;
				}
				countFen+=danxuanCount;
			}
			/*zongFenDanxuanList.add(zongFenDanxuan);*/
		}
		//单选题答错的试题id集合
		List<Long> danxuanWrongIdsList=new ArrayList<Long>();
		Map<String,Object> map=new HashMap<String,Object>();
		if(danxuanGroup.length!=0){
			//创建答对题目题号的集合
			List<Integer> danxuanRighrList=new ArrayList<Integer>();
			//创建答错题目题号的集合
			List<Integer> danxuanWrongList=new ArrayList<Integer>();
			//答对题目的数量
			int danxuanRightNum=0;
			//答错题目的数量
			int danxuanWrongNum=0;
			
			for(int i=0;i<danxuanGroup.length;i++) {
				String aa=danxuanToList.get(i).getAnswer();
				String bb=danxuanGroup[i];
				if(bb.equals(aa)){
					//正确题目的数量+1
					danxuanRightNum+=1;
					//得到答对题目的题号
					int s=i+1;
					int rightAnswer=s;
					danxuanToList.get(i).setAttr7(i+1);
					//添加到集合里
					danxuanRighrList.add(rightAnswer);
					
				}else{
					//错误的题目数量+1
					danxuanWrongNum+=1;
					//得到答错题目题号
					int weongAnswer=i+1;
					danxuanToList.get(i).setAttr7(i+1);
					//添加到集合里
					danxuanWrongList.add(weongAnswer);
					danxuanWrongIdsList.add(danxuanToList.get(i).getId());
				}
				
			}
			//把用户的答案暂时放入model中传到前台
			int index=0;
			for(String s:danxuanGroup){
				danxuanToList.get(index).setAttr0(s);
				index++;
			}
			//TODO
			//判断是否及格
			/*PaperSetQuery query=new PaperSetQuery();
			PaperSetQuery.Criteria criteria=query.createCriteria();
			criteria.andPaperIdEqualTo(paperCreatId);
			List<PaperSet> paperSetList=paperSetMapper.selectByExample(query);
			if(paperSetList.size()!=0){
				if(zongFenDanxuan<new Double((double)paperSetList.get(0).getPaperLine())){
					map.put("line",0);
				}else {
					map.put("line",1);
				}
			}*/
			
			
			//单选题试题总分
			map.put("countFen",countFen);
			//单选题答错的试题id集合
			map.put("danxuanWrongIdsList", danxuanWrongIdsList);
			//答对的题目数量
			map.put("danxuanRighrNum", danxuanRighrList.size());
			//答对题目题号的集合
			map.put("danxuanRighrList", danxuanRighrList);
			//答错的题目数量
			map.put("danxuanWrongNum", danxuanWrongList.size());
			//答错题目题号的集合
			map.put("danxuanWrongList", danxuanWrongList);
			//用户总得分
			map.put("zongFenDanxuan", zongFenDanxuan);
			//单选题
			map.put("danxuanToList", danxuanToList);
			
		}
		
		return map;
	}
	
	//判断题解析
	@Override
	public Map getPanduanAnswer(String panduanaaa,List<Questions> panduanToList,Integer panduantiZong,Long paperCreatId) {
		PaperSetQuery query=new PaperSetQuery();
		PaperSetQuery.Criteria criteria=query.createCriteria();
		criteria.andPaperIdEqualTo(paperCreatId);
		List<PaperSet>paperSetsList=paperSetMapper.selectByExample(query);
		Integer panduanCount=paperSetsList.get(0).getAttr8();
		
		
		//答案数组
		String[] duoxuanGroup=panduanaaa.split(",");
		
		Integer panCountFen=0;
		
		//计算选择题总得分
		Double zongFenPanduan = (double)0;
		if(duoxuanGroup.length!=0 && !"".equals(duoxuanGroup[0]) && duoxuanGroup!=null){
			for(int i=0;i<panduanToList.size();i++){
				if(duoxuanGroup[i].equals(panduanToList.get(i).getAnswer())) {
					zongFenPanduan+=panduanCount;
				}
				panCountFen+=panduanCount;
			}
		}
		//答错的判断题id集合
		List<Long> panduanWrongIdsList=new ArrayList<Long>();
		Map<String,Object> map=new HashMap<String,Object>();
		//
		if(duoxuanGroup.length!=0){
			//创建答对题目题号的集合
			List<Integer> panduanRightList=new ArrayList<Integer>();
			//创建答错题目题号的集合
			List<Integer> panduanWrongList=new ArrayList<Integer>();
			//答对题目的数量
			int panduanRightNum=0;
			//答错题目的数量
			int panduanWrongNum=0;
			for(int i=0;i<duoxuanGroup.length;i++){
				String aa=panduanToList.get(i).getAnswer();
			    String bb=duoxuanGroup[i];
			    if(bb.equals(aa)){
			    	//正确题目的数量+1
			    	panduanRightNum+=1;
			    	//得到答对题目的题号
			    	int rightAnswer=i+1;
			    	panduanToList.get(i).setAttr7(i+1);
			    	//添加到集合里
			    	panduanRightList.add(rightAnswer);
			    	
			    }else {
			    	//错误的题目数量+1
			    	panduanWrongNum+=1;
			    	//得到答错题目题号
			    	int wrongAnswer=i+1;
			    	panduanToList.get(i).setAttr7(i+1);
			    	//添加到集合里
			    	panduanWrongList.add(wrongAnswer);
			    	panduanWrongIdsList.add(panduanToList.get(i).getId());
			    }
			}
			
			//用户选择的答案
			int index=0;
			for(String s:duoxuanGroup){
				panduanToList.get(index).setAttr0(s);;
				index++;
			}
			
			//判断题总分
			map.put("panCountFen", panCountFen);
			
			//答错的判断题id集合
			map.put("panduanWrongIdsList", panduanWrongIdsList);
			//答对的题目数量
			map.put("panduanRightNum", panduanRightList.size());
			//答对题目题号的集合
			map.put("panduanRightList", panduanRightList);
			//答错的题目数量
			map.put("panduanWrongNum", panduanWrongList.size());
			//答错题目题号的集合
			map.put("panduanWrongList", panduanWrongList);
			//用户总得分
			map.put("zongFenPanduan", zongFenPanduan);
			//判断题
			map.put("panduanToList", panduanToList);
			
		}
		return map;
	}
	
	//TODO
	//多选
	@Override
	public Map getDuoxuanAnswer(String duoxuanddd,List<Questions> duoxianToList,Integer duoxuantiZong,Long paperCreatId){
		PaperSetQuery query=new PaperSetQuery();
		PaperSetQuery.Criteria criteria=query.createCriteria();
		criteria.andPaperIdEqualTo(paperCreatId);
		List<PaperSet>paperSetsList=paperSetMapper.selectByExample(query);
		Integer duoxuanCount=paperSetsList.get(0).getAttr7();
		
		//答案数组
		String[] duoxuanGroup=duoxuanddd.split(",");
		
		Integer duoCountFen=0;
		
		//计算选择题总得分
		Double zongFenDuoxuan = (double)0;
		if(duoxuanGroup.length!=0){
			for(int i=0;i<duoxianToList.size();i++){
				if(duoxuanGroup[i].equals(duoxianToList.get(i).getAnswer())){
					zongFenDuoxuan+=duoxuanCount;
				}
				duoCountFen+=duoxuanCount;
				
			}
			
		}
		//答错的多选题id集合
		List<Long> duoxuanWrongIdsList=new ArrayList<Long>();
		Map<String,Object> map=new HashMap<String,Object>();
		if(duoxuanGroup.length!=0){
			//创建答对题目题号的集合
			List<Integer> duoxuanRightList=new ArrayList<Integer>();
			//创建答错题目题号的集合
			List<Integer> duoxuanWrongList=new ArrayList<Integer>();
			//答对题目的数量
			int duoxuanRightNum=0;
			//答错题目的数量
			int duoxuanWrongNum=0;
			
			for(int i=0;i<duoxuanGroup.length;i++){
				String aa=duoxianToList.get(i).getAnswer();
				String bb=duoxuanGroup[i];
				if(bb.equals(aa)){
					//正确题目的数量+1
					duoxuanRightNum+=1;
					//得到答对题目的题号
					int rightAnswer=i+1;
					duoxianToList.get(i).setAttr7(i+1);
					//添加到集合里
					duoxuanRightList.add(rightAnswer);
				}else{
					//错误的题目数量+1
					duoxuanWrongNum+=1;
					//得到答错题目题号
					int wrongAnswer=i+1;
					duoxianToList.get(i).setAttr7(i+1);
					//添加到集合里
					duoxuanWrongList.add(wrongAnswer);
					duoxuanWrongIdsList.add(duoxianToList.get(i).getId());
				}
			}
			//用户选择的答案
			int index=0;
			for(String s:duoxuanGroup){
				duoxianToList.get(index).setAttr0(s);
				index++;
			}
			
			
			
			//多选题总分数
			map.put("duoCountFen",duoCountFen);
			
			//答错的多选题id集合
			map.put("duoxuanWrongIdsList", duoxuanWrongIdsList);
			//答对的题目数量
			map.put("duoxuanRightNum", duoxuanRightList.size());
			//答对题目题号的集合
			map.put("duoxuanRightList", duoxuanRightList);
			//答错的题目数量
			map.put("duoxuanWrongNum", duoxuanWrongList.size());
			//答错题目题号的集合
			map.put("duoxuanWrongList", duoxuanWrongList);
			//用户总得分
			map.put("zongFenDuoxuan", zongFenDuoxuan);
			//多选题
			map.put("duoxianToList", duoxianToList);
		}
		return map;
	}
	
	//统计试题记录
	@Override
	public void toRecord(Long userId,Long paperCreatId,Map danxuanMap,Map duoxuanMap,Map panduanMap,String danxuansss,String panduanaaa,String duoxuanddd,Integer danxuanNum,Integer duoxuanNum,Integer panduanNum,Double zongDeFen,Integer a,Long examId) {
		PaperRecord paperRecord=new PaperRecord();
		//用户id
		paperRecord.setUserid(userId);
		//试卷id
		paperRecord.setAttr9(paperCreatId);
		//用户单选
		if(danxuansss!=null && danxuansss.contains(",")) {
			danxuansss=danxuansss.substring(0, danxuansss.lastIndexOf(","));
			paperRecord.setOptionanswerofuser(danxuansss);
		}
		if(duoxuanddd!=null && duoxuanddd.contains(",")) {
			//用户多选
			duoxuanddd=duoxuanddd.substring(0, duoxuanddd.lastIndexOf(","));
			paperRecord.setOptionmoreofuser(duoxuanddd);
		}
		if(panduanaaa!=null && panduanaaa.contains(",")) {
			//用户判断
			panduanaaa=panduanaaa.substring(0, panduanaaa.lastIndexOf(","));
			paperRecord.setDecidanswerofuser(panduanaaa);
		}
		
		//题目总数
		paperRecord.setOptionNum(danxuanNum+duoxuanNum+panduanNum);
		
		//试题类型（练习，考试）
		paperRecord.setType(paperCreatMapper.selectByPrimaryKey(paperCreatId).getTypes());
		
		paperRecord.setCreattime(DateUtil.getDate());
		
		//机构id
		paperRecord.setOrgId(paperCreatMapper.selectByPrimaryKey(paperCreatId).getInsId());
		
		//把考试id set到记录表里
		paperRecord.setAttr10(examId);
		
		//TODO
		//单选答错的题目id集合
		List<Long> danxuanWrongIdsList=(List<Long>) danxuanMap.get("danxuanWrongIdsList");
		StringBuffer danxuanWrongIdsLists=new StringBuffer();
		for(Long danxuanWrongId:danxuanWrongIdsList) {
			danxuanWrongIdsLists.append(danxuanWrongId+",");
		}
		danxuanWrongIdsLists=danxuanWrongIdsLists.deleteCharAt(danxuanWrongIdsLists.lastIndexOf(","));
		paperRecord.setAttr16(danxuanWrongIdsLists.toString());
		
		//多选答错的题目id集合
		List<Long> duoxuanWrongIdsList=(List<Long>) duoxuanMap.get("duoxuanWrongIdsList");
		StringBuffer duoxuanWrongIdsLists=new StringBuffer();
		for(Long duoxuanWrongId:duoxuanWrongIdsList) {
			duoxuanWrongIdsLists.append(duoxuanWrongId+",");
		}
		duoxuanWrongIdsLists=duoxuanWrongIdsLists.deleteCharAt(duoxuanWrongIdsLists.lastIndexOf(","));
		paperRecord.setAttr17(duoxuanWrongIdsLists.toString());
		
		//判断答错的题目id集合
		List<Long> panduanWrongIdsList=(List<Long>) panduanMap.get("panduanWrongIdsList");
		StringBuffer panduanWrongIdsLists=new StringBuffer();
		for(Long panduanWrongId:panduanWrongIdsList) {
			panduanWrongIdsLists.append(panduanWrongId+",");
		}
		panduanWrongIdsLists=panduanWrongIdsLists.deleteCharAt(panduanWrongIdsLists.lastIndexOf(","));
		paperRecord.setAttr18(panduanWrongIdsLists.toString());
		
		
		// 单选总分
		Integer countFen = (Integer) danxuanMap.get("countFen");
		// 多选答总分
		Integer duoCountFen = (Integer) duoxuanMap.get("duoCountFen");
		// 判断答总分
		Integer panCountFen = (Integer) panduanMap.get("panCountFen");
		Integer allCountFen=countFen+duoCountFen+panCountFen;
		paperRecord.setAttr5(allCountFen);
		// 用户总得分
		paperRecord.setFen(zongDeFen);
		
		Double allCountFens=(double)allCountFen;
		Double bili =(zongDeFen/allCountFens)*100;
		
		// 及格状态，0不及格 1及格
		if (a>bili) {
			paperRecord.setAttr6(0);
			paperRecord.setAttr19("0");
		} else if(a<bili){
			paperRecord.setAttr6(1);
			paperRecord.setAttr19("1");
		}
		
		
		//单选答对的题目数量
		Integer danxuanRighrNum=(Integer) danxuanMap.get("danxuanRighrNum");
		//多选答对的题目数量
		Integer duoxuanRightNum=(Integer) duoxuanMap.get("duoxuanRightNum");
		//判断答对的题目数量
		Integer panduanRightNum=(Integer) panduanMap.get("panduanRightNum");
		
		//答对的题数
		paperRecord.setRightnum(danxuanRighrNum+duoxuanRightNum+panduanRightNum);
		
		List<Questions> danxuanToList=(List<Questions>) danxuanMap.get("danxuanToList");
			//单选题id集合
			StringBuffer danxuantiIdList=new StringBuffer();
			//单选题答案集合
			StringBuffer danxuantiAnswerList=new StringBuffer();
			for(Questions questions:danxuanToList){
				danxuantiIdList.append(questions.getId()+",");
				danxuantiAnswerList.append(questions.getAnswer()+",");
			}
			danxuantiIdList=danxuantiIdList.deleteCharAt(danxuantiIdList.lastIndexOf(","));
			if(danxuantiAnswerList!=null && !"".equals(danxuantiAnswerList)) {
				danxuantiAnswerList=danxuantiAnswerList.deleteCharAt(danxuantiAnswerList.lastIndexOf(","));
			}
			paperRecord.setOptionid(danxuantiIdList.toString());
			paperRecord.setOptionanswer(danxuantiAnswerList.toString());
			
		List<Questions> duoxianToList=(List<Questions>) duoxuanMap.get("duoxianToList");
			//多选题id集合
			StringBuffer duoxuanIdList=new StringBuffer();
			//多选题答案集合
			StringBuffer duoxuanAnswerList=new StringBuffer();
			for(Questions questions:duoxianToList){
				duoxuanIdList.append(questions.getId()+",");
				duoxuanAnswerList.append(questions.getAnswer()+",");
			}
			duoxuanIdList=duoxuanIdList.deleteCharAt(duoxuanIdList.lastIndexOf(","));
			duoxuanAnswerList=duoxuanAnswerList.deleteCharAt(duoxuanAnswerList.lastIndexOf(","));
			paperRecord.setOptionmoreanswerid(duoxuanIdList.toString());
			paperRecord.setOptionmoreanswer(duoxuanAnswerList.toString());
		
		List<Questions> panduanToLists=(List<Questions>) panduanMap.get("panduanToList");
			//判断题id集合
			StringBuffer panduanIdList=new StringBuffer();
			//多选题答案集合
			StringBuffer panduanAnswerList=new StringBuffer();
			for(Questions questions:panduanToLists){
				panduanIdList.append(questions.getId()+",");
				panduanAnswerList.append(questions.getAnswer()+",");
			}
			panduanIdList=panduanIdList.deleteCharAt(panduanIdList.lastIndexOf(","));
			panduanAnswerList=panduanAnswerList.deleteCharAt(panduanAnswerList.lastIndexOf(","));
			paperRecord.setDecidid(panduanIdList.toString());
			paperRecord.setDecidanswer(panduanAnswerList.toString());
			
		
		
		//单选题答对题目题号的集合
		List<Integer> danxuanRighrList=(List<Integer>) danxuanMap.get("danxuanRighrList");
			StringBuffer danxuanRighrLists=new StringBuffer();
			for(Integer danRid:danxuanRighrList){
				danxuanRighrLists.append(String.valueOf(danRid)+",");
			}
		if(danxuanRighrList!=null && danxuanRighrList.size()!=0) {
			danxuanRighrLists=danxuanRighrLists.deleteCharAt(danxuanRighrLists.lastIndexOf(","));
		}
		paperRecord.setAttr1(danxuanRighrLists.toString());
		//单选题答错题目题号的集合
		List<Integer> danxuanWrongList=(List<Integer>) danxuanMap.get("danxuanWrongList");
			StringBuffer danxuanWrongLists=new StringBuffer();
			for(Integer danWrId:danxuanWrongList){
				danxuanWrongLists.append(String.valueOf(danWrId)+",");
			}
		if(danxuanWrongList!=null && danxuanWrongList.size()!=0){
			danxuanWrongLists=danxuanWrongLists.deleteCharAt(danxuanWrongLists.lastIndexOf(","));
		}
		paperRecord.setAttr4(danxuanWrongLists.toString());
		
		
		//多选题答对的题号集合
		List<Integer> duoxuanRightList=(List<Integer>) duoxuanMap.get("duoxuanRightList");
			StringBuffer duoxuanRightLists=new StringBuffer();
			for(Integer duoRid:duoxuanRightList){
				duoxuanRightLists.append(String.valueOf(duoRid)+",");
			}
		if(duoxuanRightList!=null && duoxuanRightList.size()!=0) {
			duoxuanRightLists=duoxuanRightLists.deleteCharAt(duoxuanRightLists.lastIndexOf(","));	
		}
		
		paperRecord.setAttr2(duoxuanRightLists.toString());
		//多选题答错的题号集合
		List<Integer> duoxuanWrongList=(List<Integer>) duoxuanMap.get("duoxuanWrongList");
			StringBuffer duoxuanWrongLists=new StringBuffer();
			for(Integer duoWr:duoxuanWrongList) {
				duoxuanWrongLists.append(String.valueOf(duoWr)+",");
			}
		if(duoxuanWrongList!=null && duoxuanWrongList.size()!=0) {
			duoxuanWrongLists=duoxuanWrongLists.deleteCharAt(duoxuanWrongLists.lastIndexOf(","));
		}
		paperRecord.setAttr14(duoxuanWrongLists.toString());
		
		
		//判断答对题目题号的集合
		List<Integer> panduanRightList=(List<Integer>) panduanMap.get("panduanRightList");
			StringBuffer panduanRightLists=new StringBuffer();
			for(Integer panRi:panduanRightList) {
				panduanRightLists.append(panRi+",");
			}
		if(panduanRightList!=null && panduanRightList.size()!=0) {
			panduanRightLists=panduanRightLists.deleteCharAt(panduanRightLists.lastIndexOf(","));
		}
		paperRecord.setAttr3(panduanRightLists.toString());
		//判断答错题目题号的集合
		List<Integer> panduanWrongList=(List<Integer>) panduanMap.get("panduanWrongList");
			StringBuffer panduanWrongLists=new StringBuffer();
			for(Integer panWr:panduanWrongList) {
				panduanWrongLists.append(panWr+",");
			}
		if(panduanWrongList!=null && panduanWrongList.size()!=0) {
			panduanWrongLists=panduanWrongLists.deleteCharAt(panduanWrongLists.lastIndexOf(","));	
		}
		
		paperRecord.setAttr15(panduanWrongLists.toString());
		
		paperRecordMapper.insert(paperRecord);
			
	}
	
	
	@Override
	public Map getAllList(String danxuanIdList,String duoxuanIdList,String panduanIdList) {
		List<Long> danxuanIdLists=new ArrayList<Long>();
		
		if(danxuanIdList!=null && !"".equals(danxuanIdList)){
			String[] dan=danxuanIdList.split(",");
			for(String s:dan) {
				danxuanIdLists.add(Long.valueOf(s));
			}
		}
		
		List<Long> duoxuanIdLists=new ArrayList<Long>();
		if(duoxuanIdList!=null && !"".equals(duoxuanIdList)){
			String[] duo=duoxuanIdList.split(",");
			for(String c:duo) {
				duoxuanIdLists.add(Long.valueOf(c));
			}
		}
		
		List<Long> panduanIdLists=new ArrayList<Long>();
		if(panduanIdList!=null && !"".equals(panduanIdList)){
			String[] pan=panduanIdList.split(",");
			for(String d:pan) {
				panduanIdLists.add(Long.valueOf(d));
			}
		}
		
		
		
		QuestionsQuery query=new QuestionsQuery();
		QuestionsQuery.Criteria criteria=query.createCriteria();
		criteria.andIdIn(danxuanIdLists);
		List<Questions> danxuanToList=questionsMapper.selectByExample(query);
		
		QuestionsQuery query2=new QuestionsQuery();
		QuestionsQuery.Criteria criteria2=query2.createCriteria();
		criteria2.andIdIn(duoxuanIdLists);
		List<Questions> duoxianToList=questionsMapper.selectByExample(query2);
		
		QuestionsQuery query3=new QuestionsQuery();
		QuestionsQuery.Criteria criteria3=query3.createCriteria();
		criteria3.andIdIn(panduanIdLists);
		List<Questions> panduanToList=questionsMapper.selectByExample(query3);
		
		Map ms=new HashMap<String,Object>();
		ms.put("danxuanToList", danxuanToList);
		ms.put("duoxianToList", duoxianToList);
		ms.put("panduanToList", panduanToList);
		return ms;
	}
	
	//判断用户是否及格
	@Override
	public Integer idToLine(Long paperCreatId,Double zongDeFen) {
		PaperSetQuery query=new PaperSetQuery();
		PaperSetQuery.Criteria criteria=query.createCriteria();
		criteria.andPaperIdEqualTo(paperCreatId);
		List<PaperSet> paperSetList=paperSetMapper.selectByExample(query);
		return paperSetList.get(0).getPaperLine();
		
		
	}

	/**
	 * 根据试卷id查找机构id，在根据机构id查找题库分类，试卷试题页面用
	 * @param paperCreatId
	 * @return
	 */
	@Override
	public List<QuesType> getQuesTypeListByOrgId(Long paperCreatId){
		
		QuesTypeQuery query=new QuesTypeQuery();
		QuesTypeQuery.Criteria criteria=query.createCriteria();
		criteria.andInsIdEqualTo(paperCreatMapper.selectByPrimaryKey(paperCreatId).getInsId());
		List<QuesType> quesTypeList=quesTypeMapper.selectByExample(query);
		return quesTypeList;
	}



	@Override
	public List<PaperCreat> findAllSelectTwo(Long orgId) {
		return paperCreatMapper.findAllSelectTwo(orgId);
	}



	
	//一级分页
	@Override
	public List<Map<String, Object>> getPaperCreat(Long pid,Pagination page){
		List<Map<String, Object>>paperCreatList=paperCreatMapper.getList(null,pid, null, null, null, null,(page.getPage() - 1) * page.getPageSize(), page.getPageSize());
		return paperCreatList;
	}
	//一级分页计数
	@Override
	public Long getCountss(Long pid){
		Long countss=paperCreatMapper.getCount(null, pid, null, null, null, null);
		
		return countss;
	}
	
	
	@Override
	public String getName(Long paperCreatId) {
		String name=paperCreatMapper.selectByPrimaryKey(paperCreatId).getName();
		
		return name;
	}
	

	@Override
	public String getOrgName(Long paperCreatId){
		String orgName=windyOrgMapper.selectByPrimaryKey(paperCreatMapper.selectByPrimaryKey(paperCreatId).getInsId()).getName();
		
		return orgName;
	}
	
	@Override
	public PaperCreat getDaoShu(Long paperCreatId) {
		PaperCreat pc=paperCreatMapper.selectByPrimaryKey(paperCreatId);
		
		return pc;
	}
	
	//判断试卷是自动的还是手动的
	@Override
	public String getPanduan(Long paperCreatId){
		PaperCreat paperCreat=paperCreatMapper.selectByPrimaryKey(paperCreatId);
		String result="zidong";
		if(paperCreat.getSets()==0){
			return result;
		}else {
			result="shoudong";
			return result;
		}
	}
	
	//根据试卷Id查找机构id
	@Override
	public Long yulan(Long paperCreatId){
		PaperCreat paperCreat =paperCreatMapper.selectByPrimaryKey(paperCreatId);
		Long insId=paperCreat.getInsId();
		
		return insId;
	}
	
	//改变用户考试关联表的状态
	@Override
	public void updateStaute(Long examId,Long userId){
		ExamPersonnelQuery query=new ExamPersonnelQuery();
		ExamPersonnelQuery.Criteria criteria=query.createCriteria();
		criteria.andUserIdEqualTo(userId);
		criteria.andExamIdEqualTo(examId);
		List<ExamPersonnel> examPersonnelList=examPersonnelMapper.selectByExample(query);
		if(examPersonnelList.size()!=0){
			//修改为已考试过
			ExamPersonnel examPersonnel=examPersonnelList.get(0);
			examPersonnel.setIsExam(1);
			examPersonnelMapper.updateByPrimaryKeySelective(examPersonnel);
			//考试次数
			/*Integer isCount=examPersonnelList.get(0).getIsCount()+1;
			examPersonnelList.get(0).setIsCount(isCount);*/
		}
		
	}
	
	//考试后计算该用户还能考多少次
	@Override
	public Integer getToTestTime(Long userId,Long examId,Long paperCreatId){
		PaperSetQuery query=new PaperSetQuery();
		PaperSetQuery.Criteria criteria=query.createCriteria();
		criteria.andPaperIdEqualTo(paperCreatId);
		List<PaperSet>paperSetQueriesList=paperSetMapper.selectByExample(query);
		Integer examUse=0;
		if(paperSetQueriesList.size()!=0){
			examUse=paperSetQueriesList.get(0).getExamUse();
			
		}
		
		UserPapercreatQuery query2=new UserPapercreatQuery();
		UserPapercreatQuery.Criteria criteria2=query2.createCriteria();
		criteria2.andUseridEqualTo(userId);
		criteria2.andPapercreatidEqualTo(examId);
		List<UserPapercreat>  userPapercreatsList=userPapercreatMapper.selectByExample(query2);
		Integer counts=0;
		if(userPapercreatsList.size()!=0){
			counts=userPapercreatsList.get(0).getTimes();
		}
		Integer nums=examUse-counts;
		return nums;
	}
	
	//获取试题打印word
	@Override
	public Map getShiTiForWord(Long paperCreatId){
		//获取当前试卷
		PaperCreat paperCreat=paperCreatMapper.selectByPrimaryKey(paperCreatId);
		
		//==============================================================================
		//获取试卷中的单选题id
		List<Questions>danxuanList=new ArrayList<>();
		if(paperCreat.getOptionOne()!=null && paperCreat.getOptionOne()!="") {
			String danxuantiIdList=paperCreat.getOptionOne();
			String[] dan=danxuantiIdList.split(",");
			//单选题id集合
			List<Long> danxuantiIdsList=new ArrayList<>();
			for(String dans:dan){
				danxuantiIdsList.add(Long.valueOf(dans));
			}
			QuestionsQuery query=new QuestionsQuery();
			QuestionsQuery.Criteria criteria=query.createCriteria();
			criteria.andIdIn(danxuantiIdsList);
			//单选题集合
			danxuanList=questionsMapper.selectByExample(query);
		}
		
		
		//==============================================================================
		//获取试卷中的多选题id
		List<Questions>duoxuanList=new ArrayList<Questions>();
		if(paperCreat.getOptionMore()!=null && paperCreat.getOptionMore()!=""){
			String duoxuantiIdList=paperCreat.getOptionMore();
			String[] duo=duoxuantiIdList.split(",");
			//多选题id集合
			List<Long> duoxuantiIdsList=new ArrayList<>();
			for(String duos:duo){
				duoxuantiIdsList.add(Long.valueOf(duos));
			}
			QuestionsQuery query2=new QuestionsQuery();
			QuestionsQuery.Criteria criteria2=query2.createCriteria();
			criteria2.andIdIn(duoxuantiIdsList);
			//多选题集合
			duoxuanList=questionsMapper.selectByExample(query2);
		}
		
		
		//==============================================================================
		//获取试卷中的判断题
		List<Questions> panduanList=new ArrayList<Questions>();
		if(paperCreat.getJudge()!=null && paperCreat.getJudge()!=""){
			String panduanIdList=paperCreat.getJudge();
			String[] pan=panduanIdList.split(",");		
			//判断题id集合
			List<Long> panduantiIdsList=new ArrayList<>();
			for(String pans:pan){
				panduantiIdsList.add(Long.valueOf(pans));
			}
			QuestionsQuery query3=new QuestionsQuery();
			QuestionsQuery.Criteria criteria3=query3.createCriteria();
			criteria3.andIdIn(panduantiIdsList);
			panduanList=questionsMapper.selectByExample(query3);
		}
		
		
		
		Map<String,Object>map=new HashMap<>();
		map.put("danxuanList", danxuanList);
		map.put("duoxuanList", duoxuanList);
		map.put("panduanList", panduanList);
		return map;
	}
	
	//获取一级机构
	@Override
	public String getOneWindyOrg() {
		WindyOrgQuery query=new WindyOrgQuery();
		WindyOrgQuery.Criteria criteria=query.createCriteria();
		criteria.andPidEqualTo((long)0);
		List<WindyOrg> windyOrgsList=windyOrgMapper.selectByExample(query);
		String GOrgName = null;
		if(windyOrgsList.size()!=0){
			GOrgName=windyOrgsList.get(0).getName();
		}
		
		return GOrgName;
	}
	
	//修改试卷设置前查找
	@Override
	public List<Map<String,Object>> getExamNum(Long paperCreatId){
		List<Map<String,Object>> paperSetNumList=paperCreatMapper.getExamNum(paperCreatId);
		
		for(Map<String,Object> paperSet:paperSetNumList) {
			Long quesTypeId=(Long) paperSet.get("quesTypeId");
			Map map=getTypeQuestionsNum(quesTypeId);
			Integer typeDanxuanNum=(Integer) map.get("typeDanxuanNum");
			Integer typeDuoxuanNum=(Integer) map.get("typeDuoxuanNum");
			Integer typePanduanNum=(Integer) map.get("typePanduanNum");
			paperSet.put("typeDanxuanNum", typeDanxuanNum);
			paperSet.put("typeDuoxuanNum",typeDuoxuanNum);
			paperSet.put("typePanduanNum",typePanduanNum);
		}
		
		return paperSetNumList;
	}
	
	//把用户和试卷表绑定，如果有数据则+1，如果没有，则添加数据
	@Override
	public void put(Long userId,Long examId){
		UserPapercreatQuery query=new UserPapercreatQuery();
		UserPapercreatQuery.Criteria criteria=query.createCriteria();
		criteria.andUseridEqualTo(userId);
		criteria.andPapercreatidEqualTo(examId);
		List<UserPapercreat> userPapercreatsList=userPapercreatMapper.selectByExample(query);
		if(userPapercreatsList.size()!=0){
			UserPapercreat userPapercreat=userPapercreatsList.get(0);
			Integer times=userPapercreat.getTimes();
			times+=1;
			userPapercreat.setTimes(times);
			UserPapercreatQuery query2=new UserPapercreatQuery();
			UserPapercreatQuery.Criteria criteria2=query2.createCriteria();
			criteria2.andUseridEqualTo(userId);
			criteria2.andPapercreatidEqualTo(examId);
			userPapercreatMapper.updateByExampleSelective(userPapercreat, query2);
			
		}else {
			UserPapercreat userPapercreat=new UserPapercreat();
			userPapercreat.setUserid(userId);
			userPapercreat.setPapercreatid(examId);
			userPapercreat.setTimes(1);
			userPapercreatMapper.insert(userPapercreat);
			
		}
		
	}
	
	//查找当前分类的试题数量
	@Override
	public Map getTypeQuestionsNum(Long quesTypeId){
		QuestionsQuery query=new QuestionsQuery();
		QuestionsQuery.Criteria criteria=query.createCriteria();
		criteria.andQuesIdEqualTo(quesTypeId);
		//当前分类下的所有试题
		List<Questions>qList=questionsMapper.selectByExample(query);
		//当前分类下的单选数量
		Integer typeDanxuanNum=0;
		//当前分类下的多选数量
		Integer typeDuoxuanNum=0;
		//当前分类下的判断数量
		Integer typePanduanNum=0;
		for(Questions questions:qList){
			if(questions.getType()==0){
				typeDanxuanNum+=1;
			}
			if(questions.getType()==1){
				typeDuoxuanNum+=1;
			}
			if(questions.getType()==2){
				typePanduanNum+=1;
			}
		}
		
		Map<String,Object>map=new HashMap<>();
		map.put("typeDanxuanNum", typeDanxuanNum);
		map.put("typeDuoxuanNum", typeDuoxuanNum);
		map.put("typePanduanNum", typePanduanNum);
		return map;
	}

	//机务段查看最所有试卷
	@Override
	public List<Map<String,Object>> getAllPaperCreat(Pagination page){
		PaperCreatQuery query=new PaperCreatQuery();
		List<Map<String, Object>> paperCreatList=paperCreatMapper.getList(null, null, null, null, null, null, (page.getPage() - 1) * page.getPageSize(), page.getPageSize());
		
		return paperCreatList;
	}
	
	//机务段查看最所有试卷计数
	@Override
	public Long getAllPaperCreatCount(){
		
		Long counts=paperCreatMapper.getCount(null, null, null, null, null, null);
		return counts;
	}

	//判断改试卷是否设置
	@Override
	public boolean getIdSet(Long paperCreatId){
		PaperSetQuery query=new PaperSetQuery();
		PaperSetQuery.Criteria criteria=query.createCriteria();
		criteria.andPaperIdEqualTo(paperCreatId);
		List<PaperSet> pList=PaperSetMapper.selectByExample(query);
		boolean result=false;
		if(pList.size()!=0){
			result=true;
		}
		
		return result;
	}
	
	
	@Override
	public Long getCount() {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 *  传入试题分类id 获取试卷下试题
	 * @param creatId 试卷 id
	 * @param quesTypeId 分类id
	 * @return
	 */
	@Override
	public List<Map<String, Object>> findCreatQuestions(Long creatId, Long quesTypeId,Pagination page) {
		List<Long> list = getquesTypeIdList(quesTypeId);
		return paperCreatMapper.findCreatQuestions((page.getPage() - 1) * page.getPageSize(),page.getPageSize(),creatId,list);
	}


}
