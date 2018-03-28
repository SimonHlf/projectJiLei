package cn.windy.module.examination.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.aspectj.weaver.patterns.TypePatternQuestions.Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.windy.module.examination.dao.PaperRecordMapper;
import cn.windy.module.examination.dao.PaperSetMapper;
import cn.windy.module.examination.dao.QuestionsMapper;
import cn.windy.module.examination.mybatis.model.PaperRecord;
import cn.windy.module.examination.mybatis.model.PaperSet;
import cn.windy.module.examination.mybatis.model.PaperSetQuery;
import cn.windy.module.examination.mybatis.model.Questions;
import cn.windy.module.examination.mybatis.model.QuestionsQuery;
import cn.windy.module.examination.service.RecordService;
import cn.windy.util.Pagination;
import cn.windy.util.StringUtil;

@Service
public class RecordServiceImpl implements RecordService{
	@Autowired
	private PaperRecordMapper paperRecordMapper;
	
	@Autowired
	private QuestionsMapper questionsMapper;
	
	@Autowired
	private PaperSetMapper paperSetMapper;
	
	/*
	 * 查找当前用户考试记录
	 * (non-Javadoc)
	 * @see cn.windy.module.examination.service.RecordService#getRecord(java.lang.Long, java.lang.String, cn.windy.util.Pagination)
	 */
	@Override
	public List<Map<String,Object>> getRecord(String attr19,Long userId,String paperCreatName,Pagination page){
		List<Map<String,Object>> recordList=paperRecordMapper.getRecord(attr19,userId, paperCreatName,(page.getPage() - 1) * page.getPageSize(), page.getPageSize());
		return recordList;
	}
	
	/**
	 * 计数
	 */
	@Override
	public Long getRecordCount(String attr19,Long userId,String paperCreatName) {
		Long count=paperRecordMapper.getRecordCount(attr19,userId, paperCreatName);
		return count;
	}
	
	/**
	 * 查看记录详情
	 * @param recordId
	 * @return
	 */
	@Override
	public Map toDetail(Long recordId){
		Map map=new HashMap<String,Object>();
		
		PaperRecord paperRecord=paperRecordMapper.selectByPrimaryKey(recordId);
		//一共答对的题数
		 Integer rightNum=paperRecord.getRightnum();
		map.put("rightNum", rightNum);
		 
		 
		//用户总得分
		Double zongDeFen=paperRecord.getFen();
		map.put("zongDeFen", zongDeFen);
		
		//单选题答对的数量
		Integer danxuanRighrNum=null;
		List<Integer> danxuanRighrList=new ArrayList<Integer>();
		if(paperRecord.getAttr1()!=null && !"".equals(paperRecord.getAttr1())) {
			String [] danxuanRi=paperRecord.getAttr1().split(",");
			danxuanRighrNum=danxuanRi.length;
			//单选题答对的题号list
			
			if(danxuanRi.length!=0 && danxuanRi!=null) {
				for(String dans:danxuanRi){
					danxuanRighrList.add(Integer.valueOf(dans));
				}
			}
		}
		map.put("danxuanRighrNum", danxuanRighrNum);
		map.put("danxuanRighrList", danxuanRighrList);
		
		
		
		//单选题答错的数量
		List<Integer> danxuanWrongList=new ArrayList<Integer>();
		Integer danxuanWrongNum=null;
		if(paperRecord.getAttr4()!=null && !"".equals(paperRecord.getAttr4())) {
			String [] danxuanWr=paperRecord.getAttr4().split(",");
			danxuanWrongNum=danxuanWr.length;
			//单选题答错的题号list
			if(danxuanWr.length!=0) {
				for(String danss:danxuanWr) {
					danxuanWrongList.add(Integer.valueOf(danss));
				}
			}
		}
		map.put("danxuanWrongNum", danxuanWrongNum);
		map.put("danxuanWrongList", danxuanWrongList);
		
		//多选题答对的数量
		List<Integer> duoxuanRightList=new ArrayList<Integer>();
		Integer duoxuanRightNum=null;
		if(!StringUtil.isBlank(paperRecord.getAttr2())) {
			String [] duoxuanRi=paperRecord.getAttr2().split(",");
			duoxuanRightNum=duoxuanRi.length;
			//多选题答对题号list
			if(duoxuanRi.length!=0) {
				for(String duos:duoxuanRi) {
					duoxuanRightList.add(Integer.valueOf(duos));
				}
			}
		}
		map.put("duoxuanRightNum", duoxuanRightNum);
		map.put("duoxuanRightList", duoxuanRightList);
		
		
		//多选题答错的数量
		List<Integer> duoxuanWrongList=new ArrayList<Integer>();
		Integer duoxuanWrongNum=null;
		if(paperRecord.getAttr14()!=null && !"".equals(paperRecord.getAttr14())) {
			String [] duoxuanWr=paperRecord.getAttr14().split(",");
			duoxuanWrongNum=duoxuanWr.length;
			//多选题答错题号list
			if(duoxuanWr.length!=0) {
				for(String duoss:duoxuanWr) {
					duoxuanWrongList.add(Integer.valueOf(duoss));
				}
			}
		}
		map.put("duoxuanWrongNum", duoxuanWrongNum);
		map.put("duoxuanWrongList", duoxuanWrongList);
		
		
		//判断题答对的数量
		List<Integer>panduanRightList=new ArrayList<Integer>();
		Integer panduanRightNum=null;
		if(paperRecord.getAttr3()!=null && !"".equals(paperRecord.getAttr3())) {
			String [] panduanRi=paperRecord.getAttr3().split(",");
			panduanRightNum=panduanRi.length;
			//判断题答对题号的list
			if(panduanRi.length!=0) {
				for(String pans:panduanRi){
					panduanRightList.add(Integer.valueOf(pans));
				}
			}
		}
		
		map.put("panduanRightNum", panduanRightNum);
		map.put("panduanRightList", panduanRightList);
		
		
		//判断题答错的数量
		List<Integer>panduanWrongList=new ArrayList<Integer>();
		Integer panduanWrongNum=null;
		if(paperRecord.getAttr15()!=null && !"".equals(paperRecord.getAttr15())) {
			String [] panduanWr=paperRecord.getAttr15().split(",");
			panduanWrongNum=panduanWr.length;
			//判断题答错的题号list
			if(panduanWr.length!=0) {
				for(String panss:panduanWr) {
					panduanWrongList.add(Integer.valueOf(panss));
				}
			}
			
		}
		
		map.put("panduanWrongNum", panduanWrongNum);
		map.put("panduanWrongList", panduanWrongList);
		
		
		
		//TODO
		//TODO
		//TODO
		PaperSetQuery paperSetQuery=new PaperSetQuery();
		PaperSetQuery.Criteria criteria=paperSetQuery.createCriteria();
		criteria.andPaperIdEqualTo(paperRecord.getAttr9());
		List<PaperSet>paperSetList=paperSetMapper.selectByExample(paperSetQuery);
		Integer danxuanFen=0;
		Integer duoxuanFen=0;
		Integer panduanFen=0;
		if(paperSetList.size()!=0){
			//单选题分值
			danxuanFen=paperSetList.get(0).getAttr6();
			//多选题分值
			duoxuanFen=paperSetList.get(0).getAttr7();
			//判断题分值
			panduanFen=paperSetList.get(0).getAttr8();
			
		}
		map.put("danxuanFen", danxuanFen);
		map.put("duoxuanFen", duoxuanFen);
		map.put("panduanFen", panduanFen);
		
		//获取单选题列表
		Integer danxuantihao=0;
		List<Long> danxuantiIdLists=new ArrayList<Long>();
		String[] danxuantiIdList=paperRecord.getOptionid().split(",");
		if(danxuantiIdList.length!=0) {
			for(String id:danxuantiIdList) {
				danxuantiIdLists.add(Long.valueOf(id));
			}
		}
		
		QuestionsQuery query=new QuestionsQuery();
		QuestionsQuery.Criteria criteria2=query.createCriteria();
		criteria2.andIdIn(danxuantiIdLists);
		List<Questions> danxuantiList=questionsMapper.selectByExample(query);
		//获取单选题总分值
		Integer danxuanZnum=danxuantiList.size();
		Integer countFen=danxuanFen*danxuanZnum;
		
		//试题序号
		Integer danxuanXuhao=0;
		String[] userDanxuan=paperRecord.getOptionanswerofuser().split(",");
		if(danxuantiList.size()!=0) {
			for(int i=0;i<danxuantiList.size();i++){
				/*countFen+=danxuantiList.get(i).getAttr6();*/
				danxuanXuhao+=1;
				danxuantiList.get(i).setAttr7(danxuanXuhao);
				//把用户选的答案放入list
				danxuantiList.get(i).setAttr0(userDanxuan[i]);
			}
		}
		
		map.put("danxuantiList", danxuantiList);
		map.put("countFen", countFen);
		
		//获取多选题列表
		List<Long> duoxuanIdLists=new ArrayList<Long>();
		String[] duoxuanIdList=paperRecord.getOptionmoreanswerid().split(",");
		if(duoxuanIdList.length!=0) {
			for(String id:duoxuanIdList) {
				duoxuanIdLists.add(Long.valueOf(id));
			}
		}
		
		QuestionsQuery query2=new QuestionsQuery();
		QuestionsQuery.Criteria criteria6=query2.createCriteria();
		criteria6.andIdIn(duoxuanIdLists);
		List<Questions> duoxuantiList=questionsMapper.selectByExample(query2);
		//获取多选题总分值
		Integer duoxuanZnum=duoxuantiList.size();
		Integer duoCountFen=duoxuanFen*duoxuanZnum;
		
		//多选题序号
		Integer duoxuanXuhao=0;
		String[] userDuoxuan=paperRecord.getOptionmoreofuser().split(",");
		if(duoxuantiList.size()!=0) {
			for(int i=0;i<duoxuantiList.size();i++) {
				/*duoCountFen+=duoxuantiList.get(i).getAttr6();*/
				duoxuanXuhao+=1;
				duoxuantiList.get(i).setAttr7(duoxuanXuhao);
				//把用户选的答案放入list
				duoxuantiList.get(i).setAttr0(userDuoxuan[i]);
			}
		}
		
		map.put("duoxuantiList", duoxuantiList);
		map.put("duoCountFen", duoCountFen);
		
		
		//获取判断题列表
		List<Long> panduanIdLists=new ArrayList<Long>();
		String[] panduanIdList=paperRecord.getDecidid().split(",");
		if(panduanIdList.length!=0) {
			for(String id:panduanIdList) {
				panduanIdLists.add(Long.valueOf(id));
			}
		}
		
		QuestionsQuery query3=new QuestionsQuery();
		QuestionsQuery.Criteria criteria3=query3.createCriteria();
		criteria3.andIdIn(panduanIdLists);
		List<Questions> panduantiList=questionsMapper.selectByExample(query3);
		//获取判断题总分值
		Integer panduanZnum=panduantiList.size();
		Integer panCountFen=panduanFen*panduanZnum;
		
		//判断题序号
		Integer panduanXuhao=0;
		String[] userPanduan=paperRecord.getDecidanswerofuser().split(",");
		if(panduantiList.size()!=0) {
			for(int i=0;i<panduantiList.size();i++){
				/*panCountFen+=panduantiList.get(i).getAttr6();*/
				panduanXuhao+=1;
				panduantiList.get(i).setAttr7(panduanXuhao);
				//把用户选的答案放入list
				panduantiList.get(i).setAttr0(userPanduan[i]);
				
			}
		}
		
		map.put("panduantiList", panduantiList);
		map.put("panCountFen", panCountFen);
		
		
		return map;
	}
	
	
	
	
}
