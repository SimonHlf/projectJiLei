package cn.windy.module.examination.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.windy.module.examination.dao.PaperCreatMapper;
import cn.windy.module.examination.dao.PaperSetMapper;
import cn.windy.module.examination.dao.PapersetNumMapper;
import cn.windy.module.examination.mybatis.model.PaperCreat;
import cn.windy.module.examination.mybatis.model.PaperSet;
import cn.windy.module.examination.mybatis.model.PaperSetQuery;
import cn.windy.module.examination.mybatis.model.PapersetNum;
import cn.windy.module.examination.mybatis.model.PapersetNumQuery;
import cn.windy.module.examination.mybatis.model.QuesType;
import cn.windy.module.examination.service.PaperSetService;

@Service
public class PaperSetServiceImpl implements PaperSetService{

	@Autowired
	private PaperSetMapper paperSetMapper;
	
	@Autowired
	private PapersetNumMapper papersetNumMapper;
	
	@Autowired
	private PaperCreatMapper paperCreatMapper;
	/**
	 * 点击试卷设置
	 */
	@Override
	public Map paperSetList(Long paperId) {
		Map<String,Object> mm=new HashMap<>();
		String result="false";
		PaperSetQuery query=new PaperSetQuery();
		PaperSetQuery.Criteria criteria=query.createCriteria();
		criteria.andPaperIdEqualTo(paperId);
		List<PaperSet> paperSetList=paperSetMapper.selectByExample(query);
		//判断是否有数据，若没则添加
		if(paperSetList.size()==0) {
			result="true";
			mm.put("result", result);
			return mm;
		}else {
			PaperSet paperSet=paperSetList.get(0);
			mm.put("result", result);
			mm.put("paperSet", paperSet);
			return mm;
		}
		
	}

	//手动添加
	@Override
	public void addNotSet(PaperSet paperSet,String res,Long paperCreatId) {
		if("true".equals(res)){
			paperSetMapper.insert(paperSet);
		}
		if("false".equals(res)){
			paperSetMapper.updateByPrimaryKeySelective(paperSet);
		}
		
		
	}
	//自动添加
	@Override
	public void add(PaperSet paperSet,String paperids,String oneslects,String towslects,String judges,String res,Long paperCreatId) {
		PapersetNum pNum=new PapersetNum();
		
		String[] paperid = paperids.split(",");
		String[] oneslect = oneslects.split(",");
		String[] towslect = towslects.split(",");
		String[] judge = judges.split(",");
		pNum.setCreatid(paperCreatId);
		
		
		
		PaperCreat paperCreat =paperCreatMapper.selectByPrimaryKey(paperCreatId);
		//原来的单选数量
		Integer dan=paperCreat.getAttr6();
		//原来的多选数量
		Integer duo=paperCreat.getAttr7();
		//原来的判断数量
		Integer pan=paperCreat.getAttr8();
		
		PapersetNumQuery query=new PapersetNumQuery();
		PapersetNumQuery.Criteria criteria=query.createCriteria();
		criteria.andCreatidEqualTo(paperCreatId);
		papersetNumMapper.deleteByExample(query);
		
		if("true".equals(res)){
			//添加的单选数量
			Integer danxuanCount=0;
			//添加的多选数量
			Integer duoxuanCount=0;
			//添加的判断数量
			Integer panduanCount=0;
			for (int i = 0; i < paperid.length; i++) {
				pNum.setQuestypeid(Long.valueOf(paperid[i]));
				
				pNum.setDanxuannum(Integer.valueOf(oneslect[i]));
				//单选数量累计
				danxuanCount+=Integer.valueOf(paperid[i]);
				
				pNum.setDuoxuannum(Integer.valueOf(towslect[i]));
				//多选数量累计
				duoxuanCount+=Integer.valueOf(towslect[i]);
				
				pNum.setPanudannum(Integer.valueOf(judge[i]));
				//判断数量累计
				panduanCount+=Integer.valueOf(judge[i]);
				
				//往试卷设置中添加数据
				papersetNumMapper.insertSelective(pNum);
				
			}
			//把单选，多选判断set到试卷表里
			if(danxuanCount!=0){
				if(dan==null) {
					paperCreat.setAttr6(danxuanCount);
				}else {
					paperCreat.setAttr6(dan+danxuanCount);
				}
			}
			if(duoxuanCount!=0){
				if(dan==null) {
					paperCreat.setAttr7(duoxuanCount);
				}else {
					paperCreat.setAttr7(duo+duoxuanCount);
				}
				
			}
			if(panduanCount!=0){
				if(dan==null) {
					paperCreat.setAttr8(panduanCount);
				}else {
					paperCreat.setAttr8(pan+panduanCount);
				}
				
			}
			
			paperSetMapper.insert(paperSet);
		}
		if("false".equals(res)){
			//添加的单选数量
			Integer danxuanCount=0;
			//添加的多选数量
			Integer duoxuanCount=0;
			//添加的判断数量
			Integer panduanCount=0;
			for (int i = 0; i < paperid.length; i++) {
				pNum.setQuestypeid(Long.valueOf(paperid[i]));
				
				pNum.setDanxuannum(Integer.valueOf(oneslect[i]));
				//单选数量累计
				danxuanCount+=Integer.valueOf(paperid[i]);
				
				pNum.setDuoxuannum(Integer.valueOf(towslect[i]));
				//多选数量累计
				duoxuanCount+=Integer.valueOf(towslect[i]);
				
				pNum.setPanudannum(Integer.valueOf(judge[i]));
				//判断数量累计
				panduanCount+=Integer.valueOf(judge[i]);
				
				//往试卷设置中添加数据
				/*PapersetNumQuery query2=new PapersetNumQuery();
				PapersetNumQuery.Criteria criteria2=query2.createCriteria();
				criteria2.andCreatidEqualTo(paperCreatId);
				criteria2.andQuestypeidEqualTo(Long.valueOf(oneslect[i]));*/
				papersetNumMapper.insert(pNum);
				
			}
			//把单选，多选判断set到试卷表里
			if(danxuanCount!=0){
				paperCreat.setAttr6(dan+danxuanCount);
			}
			if(duoxuanCount!=0){
				paperCreat.setAttr7(duo+duoxuanCount);
			}
			if(panduanCount!=0){
				paperCreat.setAttr8(pan+panduanCount);
			}
			paperSetMapper.updateByPrimaryKeySelective(paperSet);
			
		}
		
		paperCreatMapper.updateByPrimaryKeySelective(paperCreat);
		
		
	}

	@Override
	public void delet(String ids) {
		
		
	}

	@Override
	public PaperSet getByPaperCreatId(Long paperCreatId) {
		PaperSetQuery query=new PaperSetQuery();
		PaperSetQuery.Criteria criteria=query.createCriteria();
		criteria.andPaperIdEqualTo(paperCreatId);
		List<PaperSet> paperSetList=paperSetMapper.selectByExample(query);
		PaperSet paperSet = null;
		if(paperSetList.size()!=0) {
			paperSet=paperSetList.get(0);
		}
		return paperSet;
	}

	
	@Override
	public void update(PaperSet paperSet,String paperids,String oneslects,String towslects,String judges,Long paperCreatId) {
		
		String[] paperid = paperids.split(",");
		String[] oneslect = oneslects.split(",");
		String[] towslect = towslects.split(",");
		String[] judge = judges.split(",");
		PapersetNum pNum=new PapersetNum();
		pNum.setCreatid(paperCreatId);
		
		PaperCreat paperCreat =paperCreatMapper.selectByPrimaryKey(paperCreatId);
		//原来的单选分值
		Integer dan=paperCreat.getAttr6();
		//原来的多选分值
		Integer duo=paperCreat.getAttr7();
		//原来的判断分值
		Integer pan=paperCreat.getAttr8();
		
		//添加的单选数量
		Integer danxuanCount=0;
		//添加的多选数量
		Integer duoxuanCount=0;
		//添加的判断数量
		Integer panduanCount=0;
		for (int i = 0; i < paperid.length; i++) {
			pNum.setQuestypeid(Long.valueOf(paperid[i]));
			
			pNum.setDanxuannum(Integer.valueOf(oneslect[i]));
			//单选数量累计
			danxuanCount+=Integer.valueOf(paperid[i]);
			/*if(danxuanCount!=0){
				paperCreat.setAttr6(dan+danxuanCount);
			}*/
			
			pNum.setDuoxuannum(Integer.valueOf(towslect[i]));
			//多选数量累计
			duoxuanCount+=Integer.valueOf(towslect[i]);
			/*if(duoxuanCount!=0){
				paperCreat.setAttr7(duo+duoxuanCount);
			}*/
			
			
			pNum.setPanudannum(Integer.valueOf(judge[i]));
			//判断数量累计
			panduanCount+=Integer.valueOf(judge[i]);
			/*if(panduanCount!=0){
				paperCreat.setAttr8(pan+panduanCount);
			}*/
			
			papersetNumMapper.insert(pNum);
		}
		//把单选，多选判断set到试卷表里
		if(danxuanCount!=0){
			paperCreat.setAttr6(dan+danxuanCount);
		}
		if(duoxuanCount!=0){
			paperCreat.setAttr7(duo+duoxuanCount);
		}
		if(panduanCount!=0){
			paperCreat.setAttr8(pan+panduanCount);
		}
		paperCreatMapper.updateByPrimaryKeySelective(paperCreat);
		
		
		/*PaperSetQuery query=new PaperSetQuery();
		PaperSetQuery.Criteria criteria=query.createCriteria();
		criteria.andIdEqualTo(value)*/
		paperSetMapper.updateByPrimaryKeySelective(paperSet);
		
	}
	
	

}
