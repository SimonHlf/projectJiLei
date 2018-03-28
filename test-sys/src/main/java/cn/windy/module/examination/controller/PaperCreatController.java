package cn.windy.module.examination.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.annotations.common.util.StringHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import com.jacob.com.Dispatch;

import cn.windy.module.admin.hibernate.model.User;
import cn.windy.module.core.controller.BaseController;
import cn.windy.module.examination.dao.PaperCreatMapper;
import cn.windy.module.examination.dao.QuesTypeMapper;
import cn.windy.module.examination.dao.WindyOrgMapper;
import cn.windy.module.examination.mybatis.model.PaperCreat;
import cn.windy.module.examination.mybatis.model.PaperCreatQuery;
import cn.windy.module.examination.mybatis.model.PaperSet;
import cn.windy.module.examination.mybatis.model.PaperSetQuery;
import cn.windy.module.examination.mybatis.model.PaperType;
import cn.windy.module.examination.mybatis.model.QuesType;
import cn.windy.module.examination.mybatis.model.QuesTypeQuery;
import cn.windy.module.examination.mybatis.model.Questions;
import cn.windy.module.examination.mybatis.model.WindyOrg;
import cn.windy.module.examination.mybatis.model.WindyOrgQuery;
import cn.windy.module.examination.service.PaperCreatService;
import cn.windy.module.examination.service.PaperSetService;
import cn.windy.module.examination.service.QuesTypeService;
import cn.windy.module.examination.service.QuestionsService;
import cn.windy.module.examination.service.impl.WindyOrgService;
import cn.windy.module.util.WindyConstants;
import cn.windy.module.util.WordDemo;
import cn.windy.util.DateUtil;
import cn.windy.util.FileDownLoadUtil;
import cn.windy.util.Pagination;

@Controller
@RequestMapping("/admin/PaperCreatController")
public class PaperCreatController extends BaseController{

	@Autowired
	private PaperCreatService paperCreatService;
	
	@Autowired
	private QuesTypeService quesTypeService;
	
	@Autowired
	private PaperSetService paperSetService;	
	
	@Autowired
	private QuestionsService questionsService;
	
	@Autowired
	private WindyOrgMapper windyOrgMapper;
	
	@Autowired
	private WindyOrgService windyOrgService;
	
	@Autowired
	private QuesTypeMapper quesTypeMapper;

	
	
	/**
	 * 列表，条件查询可用
	 * @param page
	 * @param name
	 * @param orgName
	 * @param paperTypeId
	 * @param type
	 * @param map
	 * @return
	 */
	@RequestMapping("/getList")
	public String getList(Pagination page,String name, String orgName,Long paperTypeId,Integer type,ModelMap map){
		User user=(User) getSession(WindyConstants.SESSION_USER);
		//判断后台登录的是否有权限查看所有机构的考试数据
		boolean s=quesTypeService.getRole(user.getId());
		//查询所有机构
		/*List<WindyOrg> windyOrgList=paperCreatService.getWindyOrgList();
    	map.put("windyOrgList", windyOrgList);*/
    	//查询当前机构分类
    	/*map.put("paperTypeList",paperCreatService.getPaperType(user.getUpdateUser()));*/
    	List<WindyOrg> windyOrgList;
		if(s) {
			//树形结构用
			/*List<MenuTree> zTreeList=quesTypeService.getZtrees(null);*/
			windyOrgList=quesTypeService.getWindyOrgList();
			/*List<QuesType> QuesType1List=quesTypeService.getAll();*/
			map.put("list", paperCreatService.paperCreatList(null,page, null,name, orgName, paperTypeId, type));
			page.setTotal(paperCreatService.getCount(null,null,name, orgName, paperTypeId, type));
		}else {
			windyOrgList=quesTypeService.getquesTypeNow(user.getUpdateUser());
			map.put("notNodes","not");
			map.put("list", paperCreatService.paperCreatList(null,page, user.getUpdateUser(),name, orgName, paperTypeId, type));
			page.setTotal(paperCreatService.getCount(null,user.getUpdateUser(),name, orgName, paperTypeId, type));
		}
		map.put("page",page);
		String ss=JSON.toJSONString(windyOrgList);
		map.put("nodes", ss.replaceAll("icon", "_icon_"));
		map.put("pid",user.getUpdateUser());
		
		return "admin/examination/paperCreat/list";
	}
	
	//首次进入分页
	@RequestMapping("/mainFenYe")
	public String mainFenYe(Pagination page,ModelMap map){
		List<Map<String, Object>> paperCreatList=paperCreatService.getAllPaperCreat(page);
		Long count=paperCreatService.getAllPaperCreatCount();
		page.setTotal(count);
		
		map.put("list",paperCreatList);
		map.put("page",page);
		return "admin/examination/paperCreat/mainFenYe";
	}
	
	
	//一级分页
	@RequestMapping("/twoZtree")
	public String twoZtree(Long pid,ModelMap map,Pagination page){
		Long pids=windyOrgService.getById(pid);
		
		if(pids==0) {
			List<Map<String, Object>>paperCreatLists=paperCreatService.getAllPaperCreat(page);
			Long counts=paperCreatService.getAllPaperCreatCount();
			page.setTotal(counts);
			map.put("list", paperCreatLists);
			map.put("page", page);
			map.put("pid", pid);
			return "admin/examination/paperCreat/ztreeTwo";
		}
		
		List<Map<String, Object>>paperCreatList=paperCreatService.getPaperCreat(pid,page);
		
		Long countss=paperCreatService.getCountss(pid);
		page.setTotal(countss);
		map.put("list", paperCreatList);
		map.put("page", page);
		map.put("pid",pid);
		/*map.put("", );*/
		/*List<QuesType>quesTypeList=quesTypeService.twoZtree(pid);
		String ss=JSON.toJSONString(quesTypeList);
		map.put("nodes2", ss.replaceAll("icon", "_icon_"));*/
		
		return "admin/examination/paperCreat/ztreeTwo";
	}
	
	
	/**
	 * 添加或修改前查找所有机构(超级管理员用)
	 * @return
	 */
	@RequestMapping("/addBefore")
	public String addBefore(ModelMap map) {
		User user=(User) getSession(WindyConstants.SESSION_USER);
		//判断后台登录的是否有权限查看所有机构的考试数据，true为超管
		boolean s=quesTypeService.getRole(user.getId());
		String result="false";
		if(s) {
			List<WindyOrg> WindyOrgList=quesTypeService.getWindyOrg();
			result="true";
			map.put("WindyOrgList", WindyOrgList);
		}else {
			List<PaperType> paperTypeList=paperCreatService.getPaperType(user.getUpdateUser());
			map.put("paperTypeList", paperTypeList);
		}
		map.put("result", result);
		return "admin/examination/paperCreat/add";
	}
	
	//添加后修改前查找试卷分类
	@RequestMapping("/PaperTypeList")
	@ResponseBody
	public List<PaperType> PaperTypeList(Long insId){
		List<PaperType> paperTypeList=paperCreatService.getPaperType(insId);
		return paperTypeList;
	}
	
	
	/**
	 * 添加
	 * @param paperCreat
	 * @param page
	 * @param mm
	 * @return
	 */
	@RequestMapping("/add")
	public String add(PaperCreat paperCreat,Pagination page,ModelMap mm) {
		User user=(User) getSession(WindyConstants.SESSION_USER);
		//判断后台登录的是否有权限查看所有机构的考试数据，true为超管
		boolean s=quesTypeService.getRole(user.getId());
		paperCreat.setStatuss("0");
		if(s) {
			paperCreat.setCreatTime(DateUtil.getDate());
			paperCreatService.add(paperCreat);
		}else {
			paperCreat.setCreatTime(DateUtil.getDate());
			paperCreat.setInsId(user.getUpdateUser());
			paperCreatService.add(paperCreat);
		}
		return getList(page,null,null,null,null,mm);
	}
	
	//删除前判断改试卷是否与考试绑定
	@RequestMapping("/deleteBefor")
	@ResponseBody
	public Map deleteBefor(String ids,ModelMap mm){
		boolean result=paperCreatService.deletBeTosee(ids);
		Map ma=new HashMap<>();
		//为true则可以删除，为false则不能删除
		ma.put("result", result);
		
		return ma;
		
	}
	
	/**
	 * 删除,且删除试卷设置表
	 * @param ids
	 * @param page
	 * @param mm
	 * @return
	 */
	@RequestMapping("/delete")
	
	public String delete(String ids,Pagination page,ModelMap mm) {
		paperCreatService.delet(ids);
		return getList(page,null,null,null,null,mm);
	}
	
	//修改前查找
	@RequestMapping("/updateBefore")
	public String updateBefore(Long id,ModelMap map) {
		User user=(User) getSession(WindyConstants.SESSION_USER);
		//判断后台登录的是否有权限查看所有机构的考试数据，true为超管
		boolean s=quesTypeService.getRole(user.getId());
		String result="false";
		if(s) {
			List<WindyOrg> WindyOrgList=paperCreatService.getWindyOrgList();
			
			result="true";
			
			map.put("WindyOrgList", WindyOrgList);
		}
		List<PaperType> paperTypeList=paperCreatService.getPaperType(paperCreatService.getById(id).getInsId());
		map.put("paperTypeList", paperTypeList);
		map.put("result", result);
		map.put("PaperCreat", paperCreatService.getById(id));
		
		return "admin/examination/paperCreat/edit";
	}
	
	/**
	 * 修改
	 * @param paperCreat
	 * @param page
	 * @param mm
	 * @return
	 */
	@RequestMapping("/update")
	public String update(PaperCreat paperCreat,Pagination page,ModelMap mm) {
		paperCreatService.update(paperCreat);
		
		return getList(page,null,null,null,null,mm);
	}
	
	
	/**
	 * 试题设置
	 * @param `
	 * @param map
	 * @return
	 */
	@RequestMapping("/setPaper")
	public String setPaper(Long paperCreatId,ModelMap map,Integer page) {
		
		String paperName=paperCreatService.getName(paperCreatId);
		String orgName=paperCreatService.getOrgName(paperCreatId);
		PaperCreat paperCreat=paperCreatService.getById(paperCreatId);
		//是自动还是手动
		Integer isSets=paperCreat.getSets();
		map.put("isSets", isSets);
		/*PaperCreat paperCreat=paperCreatService.getDaoShu(paperCreatId);*/
		//自动
		if(isSets==0) {
			//试题分类,获取试题分类下的试题数量
			List<QuesType>paperTypeList=paperCreatService.getQuesTypeList(paperCreat.getInsId());
			String ss=JSON.toJSONString(paperTypeList);
			map.put("nodes", ss.replaceAll("icon", "_icon_"));
		}
		//手动,
		if(isSets==1){
			//单选道数
			Integer danxuanNum=paperCreat.getAttr6();
			//多选道数
			Integer duoxuanNum=paperCreat.getAttr7();
			//判断道数
			Integer panduanNum=paperCreat.getAttr8();
			
			map.put("danxuanNum", danxuanNum);
			map.put("duoxuanNum", duoxuanNum);
			map.put("panduanNum", panduanNum);
		}
		
		/*map.put("danxuanFen", paperCreat.getAttr6());
		map.put("duoxuanFen", paperCreat.getAttr7());
		map.put("panduanFen", paperCreat.getAttr8());*/
		
		map.put("paperName", paperName);
		map.put("orgName", orgName);
		
		Map<String,Object> mm=paperSetService.paperSetList(paperCreatId);
		String result=(String) mm.get("result");
		/*List<QuesType> quesTypeList=paperCreatService.QuesTypeList(paperCreatId);*/
		/*map.put("quesTypeList", quesTypeList);*/
		map.put("page", page);
		if(result=="true"){
			map.put("result", result);
			map.put("paperCreatId", paperCreatId);
			/*map.put("super", "super");*/
			return "admin/examination/paperCreat/set";
		}else {
			//获取试题设置中的试题分类道数设置
			List<Map<String, Object>> paperSetNumList=paperCreatService.getExamNum(paperCreatId);
			//获取试题设置
			PaperSet paperSet=(PaperSet) mm.get("paperSet");
			
			map.put("paperCreatId", paperCreatId);
			map.put("result", result);
			map.put("paperSet", paperSet);
			map.put("paperSetNumList", paperSetNumList);
			/*map.put("", value);*/
			return "admin/examination/paperCreat/setUpdate";
		}
		
	}
	
	/**
	 * 添加试题设置
	 * @param paperSet
	 * @return
	 */
	@RequestMapping("/addPaperSet")
	public String addPaperSet(PaperSet paperSet,Pagination page,String danxuan,String duoxuan,String panduan,String res,Long paperCreatId,Integer isSets,ModelMap map,HttpServletRequest request) {
		/*String attr1=danxuan+":"+duoxuan+":"+panduan;
		paperSet.setPaperProportion(attr1);*/
		if(isSets==0){
			//获取试题分类id
			String paperids = request.getParameter("paperids");
			// 获取试题单选题数量
			String oneslects = request.getParameter("oneslects");
			// 获取试题多选题数量
			String towslects = request.getParameter("towslects");
			// 获取试题判断题数量
			String judges = request.getParameter("judges");
			paperSetService.add(paperSet, paperids, oneslects, towslects, judges,res,paperCreatId);
		}
		if(isSets!=0){
			paperSetService.addNotSet(paperSet, res, paperCreatId);
		}
		
		
		
		
		return getList(page,null,null,null,null,map);
	}
	
	/*@RequestMapping("/updateBefor")
	public String updateBefor() {
		paperSetService.getByPaperCreatId(id)
		
		return
	}*/
	
	/**
	 * 修改试题设置
	 * @param paperSet
	 * @return
	 */
	@RequestMapping("/updatePaperSet")
	public String updatePaperSet(String papertypes,PaperSet paperSet,Pagination page,String danxuan,String duoxuan,String panduan,ModelMap map,HttpServletRequest request) {
		//获取试题分类id
		String paperids = request.getParameter("papertypes");
		//获取试题单选题数量
		String oneslects = request.getParameter("oneslects");
		//获取试题多选题数量
		String towslects = request.getParameter("towslects");
		//获取试题判断题数量
		String judges = request.getParameter("judges");
		
		String paperProportion=danxuan+":"+duoxuan+":"+panduan;
		paperSet.setPaperProportion(paperProportion);
		paperSetService.update(paperSet,paperids,oneslects,towslects,judges, null);
		
		return getList(page,null,null,null,null,map);
	}
	
	//TODO
	//獲取試卷中的試題
	@RequestMapping("/getPaperQuer")
	public String getPaperQuer(Long paperCreatId,Long typeId,ModelMap map,Pagination page) {
		
		//根据试卷id查找試題
		List<Questions> questionsList=paperCreatService.questionsFromPaperList(typeId,paperCreatId,page);
		List<QuesType> quesTypeList=paperCreatService.getQuesTypeListByOrgId(paperCreatId);
		
		String nodes = JSON.toJSONString(quesTypeList);
		map.put("nodes",nodes.replaceAll("icon","_icon_"));
		map.put("quesTypeList", quesTypeList);
		map.put("questionsList", questionsList);
		Long count=paperCreatService.getPaperQuestionCount(typeId,paperCreatId);
		page.setTotal(count);
		map.put("page", page);
		map.put("paperCreatId", paperCreatId);
		return "admin/examination/paperCreat/paperQuer";
	}
	
	//当前试卷试题分页
	@RequestMapping("/getFenYeOne")
	public String getFenYeOne(Long paperCreatId,Pagination page,ModelMap map){
		//根据试卷id查找試題
		List<Questions> questionsList=paperCreatService.questionsFromPaperList(null,paperCreatId,page);
		Long count=paperCreatService.getPaperQuestionCount(null,paperCreatId);
		page.setTotal(count);
		
		map.put("questionsList", questionsList);
		map.put("page", page);
		map.put("paperCreatId", paperCreatId);
		return "admin/examination/paperCreat/paperQuerFenYe";
		
	}


	/**
	 * 查看试卷下分类试题
	 * @param typeId
	 * @param paperCreatId
	 * @param mm
	 * @param page
	 * @return
	 */
	@RequestMapping("/getPaperQuerTbody")
	public String getPaperQuerTbody(Long typeId,Long paperCreatId,ModelMap mm,Pagination page){
/*		//获取试卷中的所有试题
		List<Questions> questionsList=paperCreatService.questionsFromPaperList(typeId,paperCreatId,null);
		//获取当前机构的分类id集合
		List<Long> quesTypeIdList=paperCreatService.getquesTypeIdList(typeId);
		
		List<Long>questionsIdLists=new ArrayList<>();
		for(Questions questions:questionsList){
			if(quesTypeIdList.contains(questions.getQuesId())) {
				questionsIdLists.add(questions.getId());
			}
		}
		*/
		
//		=List<Questions> questionsList = questionsService.getQuestionByType(typeId,page);
//		page.setTotal(questionsService.getCounts(typeId, null));
//		mm.put("questionsList",questionsList);
		mm.put("questionsList",paperCreatService.findCreatQuestions(paperCreatId,typeId,page));
		Pagination pagination = new Pagination();
		pagination.setPageSize(0);
		page.setTotal((Long) paperCreatService.findCreatQuestions(paperCreatId,typeId,pagination).get(0).get("TOTAL"));
		mm.put("page", page);
		mm.put("typeId",typeId);
		mm.put("paperCreatId",paperCreatId);
		return "admin/examination/paperCreat/getPaperQuerTbody";
	}
	
	
	
	//删除试卷中用户选中的试题
	@RequestMapping("/deleteQuestion")
	public String  deleteQuestion(String ids,Pagination page,Long paperCreatId,ModelMap map){
		PaperCreat paperCreat =paperCreatService.getById(paperCreatId);
		
		String [] deleteIds=ids.split(",");
		for(String id:deleteIds){
			if(!"-1".equals(id) && !"-2".equals(id)) {
				//如果是单选题
				if(questionsService.getById(Long.valueOf(id)).getType()==0) {
					String [] danxuan=paperCreat.getOptionOne().split(",");
					List<String> danxuanList=new ArrayList<>();
					for(String danxuans:danxuan) {
						danxuanList.add(danxuans);
					}
					if(danxuanList.contains(id)) {
						//删除单选题id
						danxuanList.remove(id);

					}
					//把删除后的id集合放入StringBuffe
					StringBuffer danxuanSb=new StringBuffer();
					for(String danxuanId:danxuanList) {
						danxuanSb.append(danxuanId+",");
					}
					//去掉最后一个逗号
					danxuanSb.deleteCharAt(danxuanSb.lastIndexOf(","));
					//重新把单选题set进试卷
					paperCreat.setOptionOne(danxuanSb.toString());
					
				}
				
				//如果是多选题
				if(questionsService.getById(Long.valueOf(id)).getType()==1) {
					String[] duoxuan=paperCreat.getOptionMore().split(",");
					List<String> duoxuanList=new ArrayList<String>();
					for(String duanxuans:duoxuan){
						duoxuanList.add(duanxuans);
					}
					if(duoxuanList.contains(id)) {
						duoxuanList.remove(id);
					}
					//把删除后的id集合放入StringBuffer
					StringBuffer duoxuanSb=new StringBuffer();
					for(String duoxuanId:duoxuanList){
						duoxuanSb.append(duoxuanId+",");
					}
					//去掉最后一个逗号
					duoxuanSb.deleteCharAt(duoxuanSb.lastIndexOf(","));
					//重新把多选题set进试卷
					paperCreat.setOptionMore(duoxuanSb.toString());
				}
				
				//如果是判断题
				if(questionsService.getById(Long.valueOf(id)).getType()==2){
					String[] panduan=paperCreat.getJudge().split(",");
					List<String> panduanList=new ArrayList<String>(); /*Arrays.asList(panduan)*/
					for(String panudans:panduan) {
						panduanList.add(panudans);
					}
					if(panduanList.contains(id)) {
						panduanList.remove(id);
					}
					
			
					//把删除后的id集合放入StringBuffer
					StringBuffer panduanSb=new StringBuffer();
					for(String panduanId:panduanList){
						panduanSb.append(panduanId+",");
					}
					//去掉最后一个逗号
					panduanSb.deleteCharAt(panduanSb.lastIndexOf(","));
					paperCreat.setJudge(panduanSb.toString());
				}
			}
			
			
		}
		paperCreatService.update(paperCreat);
		return getPaperQuer(paperCreatId,null,map,page);
	}
	
	
	//查看试题详情
	@RequestMapping("/getQuestionDetila")
	public String getQuestionDetila(Long id,Integer page,ModelMap map) {
		Questions questions =questionsService.getById(id);
		String questTypeName=quesTypeService.getById(questions.getQuesId()).getName();
		map.put("questions", questions);
		map.put("questTypeName", questTypeName);
		map.put("page", page);
		return "admin/examination/paperCreat/paperQuestionDetail";
	}
	
	//TODO
	//去添加，查看题库
	@RequestMapping("/toQuestList")
	public String toQuestList(Long paperCreatId,ModelMap map,Pagination page) {

		PaperCreat paperCreat = paperCreatService.getById(paperCreatId);
		//查找當前試卷所屬機構id
		Long insId=paperCreat.getInsId();
		//树形结构用
		
		List<QuesType> quesTypeList=paperCreatService.getQuesTypeListByOrgId(paperCreatId);
		String nodes = JSON.toJSONString(quesTypeList);
		map.put("nodes",nodes.replaceAll("icon","_icon_"));
		
		/*List<WindyOrg> windyOrgLists=quesTypeService.getByOrg(insId);
		String ss=JSON.toJSONString(windyOrgLists);
		map.put("nodes", ss.replaceAll("icon", "_icon_"));*/

		if(paperCreat.getSets() == 0){
			//查找當前試卷的規範，即試卷設置
			PaperSet paperSet=paperSetService.getByPaperCreatId(paperCreatId);
			//查询单选题，多选题，判断题的数量
			String bili=paperSet.getPaperProportion();
			Integer paperTotail=paperSet.getPaperTotail();
			Map<String,Object> ms=questionsService.getshitiBili(bili, paperTotail,paperCreatId);

			map.put("danxuanNums", ms.get("danxuanNums"));
			map.put("duoxianNums",ms.get("duoxianNums"));
			map.put("panduanNums",ms.get("panduanNums"));
			map.put("paperTotail", paperTotail);
		}
		Long count=paperCreatService.questionsListCount(insId, null, null,null);
		page.setTotal(count);
		
		map.put("page", page);
		map.put("questionsList", paperCreatService.questionsList(insId,null,null,null,page));
		map.put("paperCreatId", paperCreatId);
		return "admin/examination/paperCreat/questionsLists";
	}
	
	/*@Override
	public String getFenYeOne(Long insId){
		
		
		
		return
	}*/

	
	
	@RequestMapping("/getSonZtree")
	public String getSonZtree(Long pid,ModelMap map,Pagination page) {
		Map ma=paperCreatService.getquestionByFenLei(pid, page);
		List<Map<String,Object>> questionsList=(List<Map<String, Object>>) ma.get("questionsList");
		Long count=(Long) ma.get("count");
		page.setTotal(count);
		/*	List<QuesType> quesTypeList=quesTypeService.getS(pid);*/
		/*List<Map<String,Object>> questionQuestionList=new ArrayList<Map<String,Object>>();
		questionQuestionList.addAll(questionsService.getToZtree(pid));*/
		/*if(quesTypeList.size()!=0){
			for(QuesType quesType:quesTypeList) {
				questionQuestionList.addAll(questionsService.getToZtree(quesType.getId()));
			}
		}else {
			questionQuestionList.addAll(questionsService.getToZtree(pid));
		}*/
		map.put("page", page);
		
		map.put("pid", pid);
		map.put("questionsList", questionsList);
		return "admin/examination/paperCreat/tbody";
	}
	
	
	/*@Override
	public getTowFenYe(Long quesTypeId,Pagination page){
		
		
		
		
	}*/
	
	
	
	
	//添加试题时查看试题详情
	@RequestMapping("/toQuestListDetail")
	public String toQuestListDetail(Long id,Long paperCreatId,ModelMap map) {
		Questions questions =questionsService.getById(id);
		String questTypeName=quesTypeService.getById(questions.getQuesId()).getName();
		map.put("questions", questions);
		map.put("questTypeName", questTypeName);
		map.put("paperCreatId", paperCreatId);
		return "examination/paperCreat/questionListDetail";
	}



	//往当前试卷中添加试题，要根据试题设置添加
	@RequestMapping("/addQuestions")
	@ResponseBody
	public Map addQuestions(String ids,Long paperCreatId,String danxuanNums,String duoxianNums,String panduanNums,String paperTotail,ModelMap map) {
		//查找当前试卷
		PaperCreat paperCreat=paperCreatService.getById(paperCreatId);
		Map mas=new HashMap<String, Object>();
		//id集合
		/*List<Long> questionIdList=new ArrayList<Long>();*/
		//计数，添加的单选题
		Integer countA=0;
		//计数，添加的多选题
		Integer countB=0;
		//计数，添加的判断题
		Integer countC=0;

		/*//单选题多加或者少加的题目数量
		String countAa=null;
		//多选题多加或者少加的题目数量
		String countBb=null;
		//判断题多加或者少加的题目数量
		String countCc=null;*/

		String[] s=ids.split(",");

		for(String ss:s) {
			if(!"-1".equals(ss) && !"-2".equals(ss)) {
				/*questionIdList.add(Long.valueOf(ss));*/
				if(questionsService.getById(Long.valueOf(ss)).getType()==0) {
					countA+=1;
				}else if(questionsService.getById(Long.valueOf(ss)).getType()==1) {
					countB+=1;
				}else if(questionsService.getById(Long.valueOf(ss)).getType()==2){
					countC+=1;
				}
			}

		}

		/*PaperCreat paperCreats =paperCreatService.getById(paperCreatId);
		//单选题计数，放入试卷表中的attr8字段
		Integer danxuancount=paperCreats.getAttr8()+countA;
		paperCreat.setAttr8(danxuancount);
		//多选题计数，放入试卷表中的attr9字段
		Integer duoxuancount=paperCreats.getAttr9()+countB;
		paperCreat.setAttr9(duoxuancount);
		//判断题计数，放入试卷表中的attr10字段
		Integer panduancount=paperCreats.getAttr10()+countC;
		paperCreat.setAttr10(panduancount);*/



		//========================================================


		//========================================================

		/*//如果单选题大于规定的数量
		if(Integer.valueOf(danxuanNums) < countA) {
			//多添加的题目数量
			countAa=String.valueOf(countA-(Integer.valueOf(danxuanNums)));
		}

		//如果多选题大于规定的数量
		if(Integer.valueOf(duoxianNums) < countB) {
			//多添加的题目数量
			countBb=String.valueOf(countB-(Integer.valueOf(duoxianNums)));
		}

		//如果多选题大于规定的数量
		if(Integer.valueOf(panduanNums) < countC) {
			//多添加的题目数量,
			countCc=String.valueOf(countC-(Integer.valueOf(panduanNums)));
		}*/

		/*//弹出框用
		StringBuffer sbf=new StringBuffer();
		//判断要弹出什么
		String result="false";*/

		//如果有试题少加或多加的话
		/*if(countAa!=null || countBb!=null || countCc!=null ) {
			//判断单选题是多添加了还是少添加了
			if(countAa!=null) {

					sbf.append("您多添加了"+countAa.substring(0)+"道单选题   ");

			}
			//判断多选题是多添加了还是少添加了
			if(countBb!=null ) {
				sbf.append("您多添加了"+countBb.substring(0)+"道多选题   ");

			}

			//判断判断题是多添加还是少添加
			if(countCc!=null) {
				sbf.append("您多添加了"+countCc.substring(0)+"道判断题   ");

			}
			mas.put("sbf", sbf);
			mas.put("result", result);

		}*/


		//=============================================



		//如果选的题正好是规定的，则就没有多选或少选的题，都是null,下面就是把试题添加到试卷里面
		/*if(countAa==null && countBb==null && countCc==null) {*/

		//把试卷中已有的单选题试题的数组转换成StringBuffer
		StringBuffer danxuantiSbfs=new StringBuffer();
		//把试卷中已有的多选题试题的数组转换成StringBuffer
		StringBuffer duoxuantiSbfs=new StringBuffer();
		//把试卷中已有的判断题试题的数组转换成StringBuffer
		StringBuffer panduantiSbfs=new StringBuffer();

		//判断试卷中是否有单选题
		String[] danxuans=null;
		List<String> danxuansList=new ArrayList<String>();
		if(paperCreat.getOptionOne()!=null && !"".equals(paperCreat.getOptionOne())) {
			//试卷中已有的单选题试题
			danxuans=paperCreat.getOptionOne().split(",");
			danxuansList=Arrays.asList(danxuans);
			for(String ds:danxuans) {
				danxuantiSbfs.append(ds+",");
			}
		}

		//判断试卷中是否有多选题
		String[] duoxuans=null;
		List<String> duoxuansList=new ArrayList<String>();
		if(paperCreat.getOptionMore()!=null && !"".equals(paperCreat.getOptionMore())) {
			//试卷中已有的多选题试题
			duoxuans=paperCreat.getOptionMore().split(",");
			duoxuansList=Arrays.asList(duoxuans);
			for(String duo:duoxuans) {
				duoxuantiSbfs.append(duo+",");
			}
		}

		//判断试卷中是否有判断题
		String[] panduans=null;
		List<String> panduansList=new ArrayList<String>();
		if(paperCreat.getJudge()!=null && !"".equals(paperCreat.getJudge())) {
			//试卷中已有的判断题试题
			panduans=paperCreat.getJudge().split(",");
			panduansList=Arrays.asList(panduans);
			for(String panduan:panduans) {
				panduantiSbfs.append(panduan+",");
			}
		}

		Integer danCount=0;
		Integer duoCount=0;
		Integer panCount=0;

		//循环当前添加试题的id集合
		for(String sss:s) {
			if(!"-1".equals(sss) && !"-2".equals(sss)) {
				//单选题=================================================
				if(questionsService.getById(Long.valueOf(sss)).getType()==0) {
					//如果试卷中有单选题则
					if(paperCreat.getOptionOne()!=null && !"".equals(paperCreat.getOptionOne())) {

						//如果原来没有这道试题则添加进去
						if(!danxuansList.contains(sss)) {
							danCount+=1;
							danxuantiSbfs.append(sss+",");
						}
					}else {
						danCount+=1;
						danxuantiSbfs.append(sss+",");
					}
				}

				//多选题==============================================
				if(questionsService.getById(Long.valueOf(sss)).getType()==1) {
					//如果试卷中有多选题则
					if(paperCreat.getOptionMore()!=null && !"".equals(paperCreat.getOptionMore())) {

						//如果原来没有这道试题则添加进去
						if(!duoxuansList.contains(sss)) {
							duoCount+=1;
							duoxuantiSbfs.append(sss+",");
						}
					}else {
						duoCount+=1;
						//如果原来没有多选题则
						duoxuantiSbfs.append(sss+",");
					}
				}


				//判断题=================================================
				if(questionsService.getById(Long.valueOf(sss)).getType()==2) {
					//如果试卷中有判断题则
					if(paperCreat.getJudge()!=null && !"".equals(paperCreat.getJudge())) {

						//如果原来没有这道试题则添加进去
						if(!panduansList.contains(sss)) {
							panCount+=1;
							panduantiSbfs.append(sss+",");
						}
					}else {
						//如果原来没有判断题则
						panCount+=1;
						panduantiSbfs.append(sss+",");
					}
				}
			}

		}

		//单选题计数，放入试卷表中的attr8字段
		if(danCount!=0){
			Integer danxuancount=0;
			if(paperCreat.getAttr6() != null && paperCreat.getAttr6() != 0){
				danxuancount = paperCreat.getAttr6()+danCount;
			} else {
				danxuancount = danCount;
			}
			paperCreat.setAttr6(danxuancount);
		}
		if(duoCount!=0) {
			//单选题计数，放入试卷表中的attr8字段
			Integer duoxuancount = 0;
			if(paperCreat.getAttr7() != null && paperCreat.getAttr7() != 0){
				duoxuancount=paperCreat.getAttr7()+duoCount;
			} else {
				duoxuancount = duoCount;
			}

			paperCreat.setAttr7(duoxuancount);
		}
		if(panCount!=0){
			//单选题计数，放入试卷表中的attr8字段
			Integer panduancount=0;
			if(paperCreat.getAttr8() != null && paperCreat.getAttr8() != 0){
				panduancount = paperCreat.getAttr8()+panCount;
			} else {
				panduancount = panCount;
			}

			paperCreat.setAttr8(panduancount);
		}



		//==================循环结束======================
		//单选题
		//去掉最后的一个逗号
		if(danxuantiSbfs.length()!=0){
			danxuantiSbfs=danxuantiSbfs.deleteCharAt(danxuantiSbfs.length()-1);
			//把StringBuffer转换成String
			String danxuantiAdd=danxuantiSbfs.toString();
			paperCreat.setOptionOne(danxuantiAdd);
		}
		

		//多选题
		//去掉最后的一个逗号
		if(duoxuantiSbfs.length()!=0){
			duoxuantiSbfs=duoxuantiSbfs.deleteCharAt(duoxuantiSbfs.length()-1);
			//把StringBuffer转换成String
			String duoxuantiAdd=duoxuantiSbfs.toString();
			paperCreat.setOptionMore(duoxuantiAdd);
		}
		


		//判断题
		//去掉最后的一个逗号
		if(panduantiSbfs.length()!=0) {
			panduantiSbfs=panduantiSbfs.deleteCharAt(panduantiSbfs.length()-1);
			//把StringBuffer转换成String
			String panduanAdd=panduantiSbfs.toString();
			paperCreat.setJudge(panduanAdd);
		}
		

		paperCreatService.update(paperCreat);
		/*	result="true";*/
		String result="true";
		mas.put("result", result);


		/*}*/
		mas.put("paperCreatId",paperCreatId);

		return mas;
	}


	
//	//往当前试卷中添加试题，要根据试题设置添加
//	@RequestMapping("/addQuestions")
//	@ResponseBody
//	public Map addQuestions(String ids,Long paperCreatId,String danxuanNums,String duoxianNums,String panduanNums,String paperTotail,ModelMap map) {
//		//查找当前试卷
//		PaperCreat paperCreat=paperCreatService.getById(paperCreatId);
//		Map mas=new HashMap<String, Object>();
//		//id集合
//		/*List<Long> questionIdList=new ArrayList<Long>();*/
//		//计数，添加的单选题
//		Integer countA=0;
//		//计数，添加的多选题
//		Integer countB=0;
//		//计数，添加的判断题
//		Integer countC=0;
//
//		/*//单选题多加或者少加的题目数量
//		String countAa=null;
//		//多选题多加或者少加的题目数量
//		String countBb=null;
//		//判断题多加或者少加的题目数量
//		String countCc=null;*/
//
//		String[] s=ids.split(",");
//
//		for(String ss:s) {
//			if(!"-1".equals(ss)) {
//				/*questionIdList.add(Long.valueOf(ss));*/
//				System.out.println(questionsService.getById(Long.valueOf(ss)).getType());
//				if(questionsService.getById(Long.valueOf(ss)).getType()==0) {
//					countA+=1;
//				}else if(questionsService.getById(Long.valueOf(ss)).getType()==1) {
//					countB+=1;
//				}else if(questionsService.getById(Long.valueOf(ss)).getType()==2){
//					countC+=1;
//				}
//			}
//
//		}
//
//		/*PaperCreat paperCreats =paperCreatService.getById(paperCreatId);
//		//单选题计数，放入试卷表中的attr8字段
//		Integer danxuancount=paperCreats.getAttr8()+countA;
//		paperCreat.setAttr8(danxuancount);
//		//多选题计数，放入试卷表中的attr9字段
//		Integer duoxuancount=paperCreats.getAttr9()+countB;
//		paperCreat.setAttr9(duoxuancount);
//		//判断题计数，放入试卷表中的attr10字段
//		Integer panduancount=paperCreats.getAttr10()+countC;
//		paperCreat.setAttr10(panduancount);*/
//
//
//
//		//========================================================
//
//
//		//========================================================
//
//		/*//如果单选题大于规定的数量
//		if(Integer.valueOf(danxuanNums) < countA) {
//			//多添加的题目数量
//			countAa=String.valueOf(countA-(Integer.valueOf(danxuanNums)));
//		}
//
//		//如果多选题大于规定的数量
//		if(Integer.valueOf(duoxianNums) < countB) {
//			//多添加的题目数量
//			countBb=String.valueOf(countB-(Integer.valueOf(duoxianNums)));
//		}
//
//		//如果多选题大于规定的数量
//		if(Integer.valueOf(panduanNums) < countC) {
//			//多添加的题目数量,
//			countCc=String.valueOf(countC-(Integer.valueOf(panduanNums)));
//		}*/
//
//		/*//弹出框用
//		StringBuffer sbf=new StringBuffer();
//		//判断要弹出什么
//		String result="false";*/
//
//		//如果有试题少加或多加的话
//		/*if(countAa!=null || countBb!=null || countCc!=null ) {
//			//判断单选题是多添加了还是少添加了
//			if(countAa!=null) {
//
//					sbf.append("您多添加了"+countAa.substring(0)+"道单选题   ");
//
//			}
//			//判断多选题是多添加了还是少添加了
//			if(countBb!=null ) {
//				sbf.append("您多添加了"+countBb.substring(0)+"道多选题   ");
//
//			}
//
//			//判断判断题是多添加还是少添加
//			if(countCc!=null) {
//				sbf.append("您多添加了"+countCc.substring(0)+"道判断题   ");
//
//			}
//			mas.put("sbf", sbf);
//			mas.put("result", result);
//
//		}*/
//
//
//		//=============================================
//
//
//
//		//如果选的题正好是规定的，则就没有多选或少选的题，都是null,下面就是把试题添加到试卷里面
//		/*if(countAa==null && countBb==null && countCc==null) {*/
//
//			//把试卷中已有的单选题试题的数组转换成StringBuffer
//			StringBuffer danxuantiSbfs=new StringBuffer();
//			//把试卷中已有的多选题试题的数组转换成StringBuffer
//			StringBuffer duoxuantiSbfs=new StringBuffer();
//			//把试卷中已有的判断题试题的数组转换成StringBuffer
//			StringBuffer panduantiSbfs=new StringBuffer();
//
//			//判断试卷中是否有单选题
//			String[] danxuans=null;
//			List<String> danxuansList=new ArrayList<String>();
//			if(paperCreat.getOptionOne()!=null && !"".equals(paperCreat.getOptionOne())) {
//				//试卷中已有的单选题试题
//				danxuans=paperCreat.getOptionOne().split(",");
//				danxuansList=Arrays.asList(danxuans);
//				for(String ds:danxuans) {
//					danxuantiSbfs.append(ds+",");
//				}
//			}
//
//			//判断试卷中是否有多选题
//			String[] duoxuans=null;
//			List<String> duoxuansList=new ArrayList<String>();
//			if(paperCreat.getOptionMore()!=null && !"".equals(paperCreat.getOptionMore())) {
//				//试卷中已有的多选题试题
//				duoxuans=paperCreat.getOptionMore().split(",");
//				duoxuansList=Arrays.asList(duoxuans);
//				for(String duo:duoxuans) {
//					duoxuantiSbfs.append(duo+",");
//				}
//			}
//
//			//判断试卷中是否有判断题
//			String[] panduans=null;
//			List<String> panduansList=new ArrayList<String>();
//			if(paperCreat.getJudge()!=null && !"".equals(paperCreat.getJudge())) {
//				//试卷中已有的判断题试题
//				panduans=paperCreat.getJudge().split(",");
//				panduansList=Arrays.asList(panduans);
//				for(String panduan:panduans) {
//					panduantiSbfs.append(panduan+",");
//				}
//			}
//
//			Integer danCount=0;
//			Integer duoCount=0;
//			Integer panCount=0;
//
//			//循环当前添加试题的id集合
//			for(String sss:s) {
//				if(!"-1".equals(sss)) {
//					//单选题=================================================
//					if(questionsService.getById(Long.valueOf(sss)).getType()==0) {
//						//如果试卷中有单选题则
//						if(paperCreat.getOptionOne()!=null && !"".equals(paperCreat.getOptionOne())) {
//
//							//如果原来没有这道试题则添加进去
//							if(!danxuansList.contains(sss)) {
//								danCount+=1;
//								danxuantiSbfs.append(sss+",");
//							}
//						}else {
//							danCount+=1;
//							danxuantiSbfs.append(sss+",");
//						}
//					}
//
//					//多选题==============================================
//					if(questionsService.getById(Long.valueOf(sss)).getType()==1) {
//						//如果试卷中有多选题则
//						if(paperCreat.getOptionMore()!=null && !"".equals(paperCreat.getOptionMore())) {
//
//							//如果原来没有这道试题则添加进去
//							if(!duoxuansList.contains(sss)) {
//								duoCount+=1;
//								duoxuantiSbfs.append(sss+",");
//							}
//						}else {
//							duoCount+=1;
//							//如果原来没有多选题则
//							duoxuantiSbfs.append(sss+",");
//						}
//					}
//
//
//					//判断题=================================================
//					if(questionsService.getById(Long.valueOf(sss)).getType()==2) {
//						//如果试卷中有判断题则
//						if(paperCreat.getJudge()!=null && !"".equals(paperCreat.getJudge())) {
//
//							//如果原来没有这道试题则添加进去
//							if(!panduansList.contains(sss)) {
//								panCount+=1;
//								panduantiSbfs.append(sss+",");
//							}
//						}else {
//							//如果原来没有判断题则
//							panCount+=1;
//							panduantiSbfs.append(sss+",");
//						}
//					}
//				}
//
//			}
//
//			//单选题计数，放入试卷表中的attr8字段
//			if(danCount!=0){
//				Integer danxuancount = 0;
//				if(paperCreat.getAttr6() != null && paperCreat.getAttr6() != 0){
//					 danxuancount=paperCreat.getAttr6()+danCount;
//				} else {
//					 danxuancount = danCount;
//				}
//				paperCreat.setAttr6(danxuancount);
//			}
//			if(duoCount!=0) {
//				//单选题计数，放入试卷表中的attr8字段
//				Integer duoxuancount = 0;
//				if(paperCreat.getAttr7() != null && paperCreat.getAttr7() != 0){
//					duoxuancount = paperCreat.getAttr7()+duoCount;
//				} else {
//					duoxuancount = duoCount;
//				}
//				paperCreat.setAttr7(duoxuancount);
//			}
//			if(panCount!=0){
//				//单选题计数，放入试卷表中的attr8字段
//				Integer panduancount = 0;
//				if(paperCreat.getAttr8() != null && paperCreat.getAttr8() != 0){
//					panduancount = paperCreat.getAttr8()+panCount;
//				} else {
//					panduancount = panCount;
//				}
//
//				paperCreat.setAttr8(panduancount);
//			}
//
//
//
//			//==================循环结束======================
//			//单选题
//			//去掉最后的一个逗号
//			danxuantiSbfs=danxuantiSbfs.deleteCharAt(danxuantiSbfs.length()-1);
//			//把StringBuffer转换成String
//			String danxuantiAdd=danxuantiSbfs.toString();
//			paperCreat.setOptionOne(danxuantiAdd);
//
//			//多选题
//			//去掉最后的一个逗号
//			duoxuantiSbfs=duoxuantiSbfs.deleteCharAt(duoxuantiSbfs.length()-1);
//			//把StringBuffer转换成String
//			String duoxuantiAdd=duoxuantiSbfs.toString();
//			paperCreat.setOptionMore(duoxuantiAdd);
//
//
//			//判断题
//			//去掉最后的一个逗号
//			panduantiSbfs=panduantiSbfs.deleteCharAt(panduantiSbfs.length()-1);
//			//把StringBuffer转换成String
//			String panduanAdd=panduantiSbfs.toString();
//			paperCreat.setJudge(panduanAdd);
//
//			paperCreatService.update(paperCreat);
//		/*	result="true";*/
//			String result="true";
//			mas.put("result", result);
//
//
//		/*}*/
//		mas.put("paperCreatId",paperCreatId);
//
//		return mas;
//	}

	//判断试卷是自动的还是手动的
	@RequestMapping("/getPanduan")
	@ResponseBody
	public String getPanduan(Long paperCeartId){
		String result=paperCreatService.getPanduan(paperCeartId);
		return result;
	}

	
	@RequestMapping("/yulan")
	@ResponseBody
	public Map yulan(Long paperCreatId) {
		boolean result=paperCreatService.getIdSet(paperCreatId);
		
		
		Map<String,Object> map=new HashMap<>();
		Long orgId=paperCreatService.yulan(paperCreatId);
		PaperCreat pCreat=paperCreatService.getById(paperCreatId);
		String idhave="false";
		if(pCreat.getSets()==1) {
			if((pCreat.getOptionOne()==null || "".equals(pCreat.getOptionOne())) && (pCreat.getOptionMore()==null || "".equals(pCreat.getOptionMore())) &&  (pCreat.getJudge()==null  || "".equals(pCreat.getJudge())) ) {
				map.put("idhave", idhave);
			} 
		}
		idhave="true";
		map.put("idhave", idhave);
		map.put("orgId", orgId);
		map.put("result", result);
		return map;
	}
	
	//预览
	@RequestMapping("/yulanBegin")
	public String yulanBegin(Long orgId,Long paperCreatId,ModelMap ma,Integer sets) {
		
		if(sets==0){
			Map mm=paperCreatService.getPaperSet(paperCreatId);

			//考试时间
			String testTime=(String) mm.get("testTime");
			//分数线
			Integer line=(Integer) mm.get("line");
			//出题的单选题数量
			Integer danxuanNum=(Integer) mm.get("danxuanNum");
			//出题的多选题数量
			Integer duoxuanNum=(Integer) mm.get("duoxuanNum");
			//出题的判断题数量
			Integer panduanNum=(Integer) mm.get("panduanNum");
			
			
			Map map=paperCreatService.getquestions(orgId, danxuanNum, duoxuanNum, panduanNum,paperCreatId);
			//生成的单选题
			List<Questions> danxuanToList=(List<Questions>) map.get("danxuanToList");
			//生成的多选题
			List<Questions> duoxianToList=(List<Questions>) map.get("duoxianToList");
			//生成的判断题
			List<Questions> panduanToList=(List<Questions>) map.get("panduanToList");
			////生成的单选题ID集合
			List<Long> danxuanIdList=new ArrayList<Long>();
			String danxuanIdLists=null;
			if(danxuanToList!=null && danxuanToList.size()!=0){
				for(Questions questions:danxuanToList) {
					 danxuanIdList.add(questions.getId());
				}
				 StringBuffer dans=new StringBuffer();
				 for(Long danxuanid:danxuanIdList) {
					 dans.append(danxuanid+",");
					 /*(String.valueOf(danxuanid)+",");*/
				 }
				 dans.deleteCharAt(dans.lastIndexOf(","));
				 danxuanIdLists=dans.toString();
			}
			ma.put("danxuanIdList", danxuanIdLists);
			 
			//生成的多选题ID集合
			List<Long> duoxuanIdList=new ArrayList<Long>();
			 String duoxuanIdLists=null;
			if(duoxianToList!=null && duoxianToList.size()!=0){
				for(Questions questions:duoxianToList) {
					duoxuanIdList.add(questions.getId());
				}
				StringBuffer duos=new StringBuffer();
				 for(Long duoxuanid:duoxuanIdList) {
					 duos.append(duoxuanid+",");
				 }
				 duos.deleteCharAt(duos.lastIndexOf(","));
				 duoxuanIdLists=duos.toString();
			}
			ma.put("duoxuanIdList", duoxuanIdLists);
			
			
			//生成的判断题ID集合
			List<Long> panduanIdList=new ArrayList<Long>();
			 String panduanIdLists=null;
			if(panduanToList!=null && panduanToList.size()!=0) {
				for(Questions questions:panduanToList) {
					panduanIdList.add(questions.getId());
				}
				StringBuffer pans=new StringBuffer();
				 for(Long panid:panduanIdList) {
					 pans.append(panid+",");
				 }
				 pans.deleteCharAt(pans.lastIndexOf(","));
				 panduanIdLists=pans.toString();
			}
			ma.put("panduanIdList", panduanIdLists);
			
			//考试时间
			ma.put("testTime",Integer.valueOf(testTime));
			//分数线
			ma.put("line", line);
			 
			//单选题总分
			Integer danxuantiZong=(Integer) map.get("danxuantiZong");
			//多选题总分
			Integer duoxuantiZong=(Integer) map.get("duoxuantiZong");
			//判断题总分
			Integer panduantiZong=(Integer) map.get("panduantiZong");
			
			//单选list
			ma.put("danxuanToList", danxuanToList);
			//多选list
			ma.put("duoxianToList",duoxianToList);
			//判断list
			ma.put("panduanToList", panduanToList);
			
			
			
			//单选总分
			ma.put("danxuantiZong", danxuantiZong);
			//多选总分
			ma.put("duoxuantiZong", duoxuantiZong);
			//判断总分
			ma.put("panduantiZong", panduantiZong);
			
			//单选数量
			ma.put("danxuanNum", danxuanNum);
			//多选数量
			ma.put("duoxuanNum", duoxuanNum);
			//判断数量
			ma.put("panduanNum", panduanNum);
			ma.put("paperCreatId", paperCreatId);
		}
		if(sets==1) {
			Map<String,Object>map=paperCreatService.getQuestionShouDong(paperCreatId);
			//考试时间
			String testTime=(String) map.get("testTime");
			//分数线
			Integer line=(Integer) map.get("line");
			//单选题集合
			List<Questions>questionsList=(List<Questions>) map.get("questionsList");
			//单选题总分
			Integer danxuantiZongFen=(Integer) map.get("danxuantiZongFen");
			//单选id集合
			List<Long>danxuantiIdList=(List<Long>) map.get("danxuantiIdList");
			
			//多选题集合
			List<Questions> duoxuantiList=(List<Questions>) map.get("duoxuantiList");
			//多选题总分
			Integer duoxuantiZongFen=(Integer) map.get("duoxuantiZongFen");
			//多选id集合
			List<Long> duoxuantiIdList=(List<Long>) map.get("duoxuantiIdList");
			
			//判断题集合
			List<Questions> panduantiList=(List<Questions>) map.get("panduantiList");
			//判断题总分
			Integer panduantiZongFen=(Integer) map.get("panduantiZongFen");
			//判断id集合
			List<Long> panduantiIdList=(List<Long>) map.get("panduantiIdList");
			
			
			ma.put("testTime", Integer.valueOf(testTime));
			ma.put("line", line);
			//单选题集合
			ma.put("danxuanToList", questionsList);
			//单选题总分
			ma.put("danxuantiZong", danxuantiZongFen);
			//单选id集合
			ma.put("danxuanIdList", danxuantiIdList);
			
			//多选题集合
			ma.put("duoxianToList", duoxuantiList);
			//多选题总分
			ma.put("duoxuantiZong", duoxuantiZongFen);
			//多选id集合
			ma.put("duoxuanIdList", duoxuantiIdList);
			
			//判断题集合
			ma.put("panduanToList", panduantiList);
			//判断题总分
			ma.put("panduantiZong", panduantiZongFen);
			//判断id集合
			ma.put("panduanIdList", panduantiIdList);
			
			
		}
		
		PaperSet paperSet =paperSetService.getByPaperCreatId(paperCreatId);
		//单选题分值
		Integer duanxuanFen=paperSet.getAttr6();
		//多选题分值
		Integer duoxuanFen=paperSet.getAttr7();
		//判断题分值
		Integer panduanFen=paperSet.getAttr8();
		
		//单选题分值
		ma.put("duanxuanFen", duanxuanFen);
		//多选题分值
		ma.put("duoxuanFen", duoxuanFen);
		//判断题分值
		ma.put("panduanFen", panduanFen);
		return "admin/examination/paperCreat/yulan";
	}
	
	//生成word
	@RequestMapping("/brothWorld")
	public String brothWorld(Long paperCreatId,HttpServletRequest req,HttpSession session,HttpServletResponse response) throws IOException{
		Long orgId=paperCreatService.getById(paperCreatId).getInsId();
		User user=(User) getSession(WindyConstants.SESSION_USER);
		//用于取出部门名字
		WindyOrg qindyOrg=windyOrgMapper.selectByPrimaryKey(orgId);
		/*PaperCreat paperCreat =paperCreatService.getById(paperCreatId);
		paperCreat.get*/
		//用于判断是手动的还是自动的
		PaperCreat pCreat=paperCreatService.getById(paperCreatId);
		
		// 单选题
		List<Questions> danxuanList = new ArrayList<>();
		// 多选题
		List<Questions> duoxuanList = new ArrayList<>();
		// 判断题
		List<Questions> panduanList = new ArrayList<>();
		
		if(pCreat.getSets()==0){
			Map mm=paperCreatService.getPaperSet(paperCreatId);
			//出题的单选题数量
			Integer danxuanNum=(Integer) mm.get("danxuanNum");
			//出题的多选题数量
			Integer duoxuanNum=(Integer) mm.get("duoxuanNum");
			//出题的判断题数量
			Integer panduanNum=(Integer) mm.get("panduanNum");
			Map map=paperCreatService.getquestions(orgId, danxuanNum, duoxuanNum, panduanNum,paperCreatId);
			//生成的单选题
			danxuanList=(List<Questions>) map.get("danxuanToList");
			//生成的多选题
			duoxuanList=(List<Questions>) map.get("duoxianToList");
			//生成的判断题
			panduanList=(List<Questions>) map.get("panduanToList");
			
		}
		
		Map map=new HashMap<>();
		
		//手动
		if(pCreat.getSets()==1){
			//获取当前试卷试题
			map=paperCreatService.getShiTiForWord(paperCreatId);
			danxuanList=(List<Questions>) map.get("danxuanList");
			duoxuanList=(List<Questions>) map.get("duoxuanList");
			panduanList=(List<Questions>) map.get("panduanList");       
		}
		
		
		
		//获取当前系统路径分隔符
       /* String s=File.separator;*/
        String pathUrl=req.getSession().getServletContext().getRealPath("");
        String pathUrls=new File(pathUrl).getParentFile().getAbsolutePath();
        /*String pathUrls=pathUrl.substring(0,pathUrl.lastIndexOf("\\"));*/
        System.out.println(pathUrl+"============================");
        
		WordDemo wordDemo = new WordDemo(false);
		String openfile=pathUrls+"\\"+"file"+"\\"+"jiwu.docx";
		String outfile=pathUrl+"\\"+"file"+"\\"+"kaoshi.doc";
		System.out.println(openfile+"=============++++++++++++++++++");
		/*wordDemo.createNewDocument();*/
		wordDemo.openDocument(openfile);
		wordDemo.find(wordDemo.getSelection(), "{车间}");
		wordDemo.replaceAll(wordDemo.getSelection(), "{车间}",qindyOrg.getName());
		wordDemo. moveEnd();
		wordDemo.enterDown(1);//回车,向下移动一行
		Dispatch.call(wordDemo.getSelection(), "TypeParagraph");// 插入一个空行
		
		
		if(danxuanList.size()!=0) {
			wordDemo.insertText("一、单选题");
			/*wordDemo.find(wordDemo.getSelection(),"{单选题}");
			wordDemo.replaceAll(wordDemo.getSelection(),"{单选}", "一、单选题");*/
			/*wordDemo.moveRight(5);*/
			wordDemo.enterDown(1);//回车,向下移动一行
			//单选题
			int danxuanCount=0;
			for(Questions questions:danxuanList){
				danxuanCount+=1;
				//获取试题题目
				wordDemo.insertText(danxuanCount+"、"+questions.getName()+"(___)");
				/*wordDemo.enterDown(1);*///回车,向下移动一行
				
				if(questions.getImage()!=null && !"".equals(questions.getImage())){
					wordDemo.insertImage(pathUrls+"\\"+questions.getImage());//放入图片地址
				}
				
				//选项A
				wordDemo.insertText("A、"+questions.getOptionA());
				/*wordDemo.enterDown(1);*///回车,向下移动一行
				//选项B
				wordDemo.insertText("B、"+questions.getOptionB());
				/*wordDemo.enterDown(1);*///回车,向下移动一行
				//选项C
				wordDemo.insertText("C、"+questions.getOptionC());
				/*wordDemo.enterDown(1);*///回车,向下移动一行
				//选项D
				wordDemo.insertText("D、"+questions.getOptionD());
				/*wordDemo.enterDown(1);*///回车,向下移动一行
			}
		}
		
		
		Dispatch.call(wordDemo.getSelection(), "TypeParagraph");// 插入一个空行
		
		if(duoxuanList.size()!=0) {
			wordDemo.insertText("二、多选题");
			/*wordDemo.find(wordDemo.getSelection(),"{多选题}");
			wordDemo.replaceAll(wordDemo.getSelection(),"{多选}", "二、多选题");*/
			wordDemo.enterDown(1);//回车,向下移动一行
			
			//多选题
			int duoxuantiCount=0;
			for(Questions duoxuanti:duoxuanList){
				duoxuantiCount+=1;
				//获取试题题目
				wordDemo.insertText(duoxuantiCount+"、"+duoxuanti.getName()+"(_____)");
				/*wordDemo.enterDown(1);*///回车,向下移动一行
				
				if(duoxuanti.getImage()!=null && !"".equals(duoxuanti.getImage())){
					wordDemo.insertImage(pathUrls+"\\"+duoxuanti.getImage());//放入图片地址
				}
				//选项A
				wordDemo.insertText("A、"+duoxuanti.getOptionA());
				/*wordDemo.enterDown(1);*///回车,向下移动一行
				//选项B
				wordDemo.insertText("B、"+duoxuanti.getOptionB());
				/*wordDemo.enterDown(1);*///回车,向下移动一行
				//选项C
				wordDemo.insertText("C、"+duoxuanti.getOptionC());
				/*wordDemo.enterDown(1);*///回车,向下移动一行
				//选项D
				wordDemo.insertText("D、"+duoxuanti.getOptionD());
				/*wordDemo.enterDown(1);*///回车,向下移动一行
			}
		}
		
		
		Dispatch.call(wordDemo.getSelection(), "TypeParagraph");// 插入一个空行
		
		if(panduanList.size()!=0) {
			wordDemo.insertText("三、判断题");
			
			wordDemo.enterDown(1);//回车,向下移动一行
			
			//判断题
			int panduantiCount=0;
			for(Questions panudanti:panduanList){
				panduantiCount+=1;
				//获取试题题目
				wordDemo.insertText(panduantiCount+"、"+panudanti.getName()+"(_____)");
				/*wordDemo.enterDown(1);*///回车,向下移动一行
				
				if(panudanti.getImage()!=null && !"".equals(panudanti.getImage())){
					wordDemo.insertImage(pathUrls+"\\"+panudanti.getImage());//放入图片地址
				}
				
				//选项A
				wordDemo.insertText("A、对");
				/*wordDemo.enterDown(1);*///回车,向下移动一行
				//选项B
				wordDemo.insertText("B、错");
				/*wordDemo.enterDown(1);*///回车,向下移动一行
				
			}
			
		}
		
		String Fname=paperCreatService.getOneWindyOrg();
		
		wordDemo.save(outfile);
		/*wordDemo.closeDocument();*/
		wordDemo.close();
		String fileName=outfile;
		String downloadFilename=Fname+qindyOrg.getName()+"考试"+".doc";
		FileDownLoadUtil.downLoad(response, fileName, downloadFilename);
		
		File file=new File(fileName);
		if(file.exists()){
			file.delete();
		}
		
		return null;
	}
	
	//跟据分类id查找其下的数量
	@RequestMapping("/getTypeQuestionsNum")
	@ResponseBody
	public Map getTypeQuestionsNum(Long quesTypeId) {
		Map<String, Object> map=paperCreatService.getTypeQuestionsNum(quesTypeId);
		
		Map<String,Object>mm=new HashMap<>();
		Integer typeDanxuanNum=(Integer) map.get("typeDanxuanNum");
		Integer typeDuoxuanNum=(Integer) map.get("typeDuoxuanNum");
		Integer typePanduanNum=(Integer) map.get("typePanduanNum");
		
		mm.put("typeDanxuanNum",typeDanxuanNum);
		mm.put("typeDuoxuanNum", typeDuoxuanNum);
		mm.put("typePanduanNum",typePanduanNum);
		return mm;
	}
	
	@RequestMapping("/getPaperDetail")
	public String getPaperDetail(Long paperCreatId,ModelMap map,Pagination page) {
		List<Map<String, Object>>paperCreatList=paperCreatService.paperCreatList(paperCreatId, null, null, null, null, null, null);
		Map<String, Object>paperCreat=new HashMap<>();
		if(paperCreatList.size()!=0) {
			paperCreat=paperCreatList.get(0);
		}
		
		map.put("page", page);
		map.put("paperCreat", paperCreat);
		return "admin/examination/paperCreat/paperCreatDetail";
	}
	

	@RequestMapping("/isSets")
	@ResponseBody
	public Map isSets(Long paperCreatId){
		//是否设置
		boolean result=paperCreatService.getIdSet(paperCreatId);
		PaperCreat paperCreat =paperCreatService.getById(paperCreatId);
		String isSetss=null;
		String haveTest=null;
		
		Integer a=paperCreat.getSets();
		//判断是手动还是自动 0是自动 1是手动
		if(a==0){
			isSetss="zidong";
			
		}
		if(a!=0){
			isSetss="shoudong";
			
			//判断手动试题里是否有题
			if((paperCreat.getOptionOne()==null || "".equals(paperCreat.getOptionOne())) && (paperCreat.getOptionMore()==null || "".equals(paperCreat.getOptionMore())) &&(paperCreat.getJudge()==null || "".equals(paperCreat.getJudge()))){
				haveTest="no";
			}
			
		}
		
		Map<String,Object> mm=new HashMap<>();
		mm.put("result", result);
		mm.put("isSetss", isSetss);
		mm.put("haveTest", haveTest);
		
		return mm;
	}
	
	/*@RequestMapping("/getIsTest")
	public String getIsTest(Long paperCreatId){
		
		
		
		
		return
	}*/
	
}
