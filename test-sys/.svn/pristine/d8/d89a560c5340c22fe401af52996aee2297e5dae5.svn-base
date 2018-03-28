package cn.windy.module.web.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.windy.module.examination.service.ExaminationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;

import cn.windy.module.admin.service.IOrgService;
import cn.windy.module.core.controller.BaseController;
import cn.windy.module.examination.dao.ExaminationMapper;
import cn.windy.module.examination.mybatis.model.ExamPersonnelQuery;
import cn.windy.module.examination.mybatis.model.Examination;
import cn.windy.module.examination.mybatis.model.ExaminationQuery;
import cn.windy.module.examination.mybatis.model.FrontUser;
import cn.windy.module.examination.mybatis.model.Questions;
import cn.windy.module.examination.service.PaperCreatService;
import cn.windy.module.examination.service.QuestionsService;
import cn.windy.module.examination.service.RecordService;
import cn.windy.module.examination.service.impl.FrontUserService;
import cn.windy.module.util.WindyConstants;
import cn.windy.util.Pagination;

@Controller
@RequestMapping("/web/module/login/inter/frontuser/PaperCreatFontCountroller")
public class PaperCreatFontCountroller extends BaseController{
	
	@Autowired
	QuestionsService questionsService;
	
	@Autowired
	PaperCreatService paperCreatService;
	
	@Autowired
    IOrgService orgService;
	
	@Autowired
	RecordService recordService;

	@Autowired
	FrontUserService frontUserService;
	
	@Autowired
	ExaminationMapper examinationMapper;

	@Autowired
	ExaminationService examinationService;
	
	
	
	/**
	 * 根据当前用户获取即将要考试的试卷列表
	 * @param userId
	 * @return
	 */
	@RequestMapping("/getPaperCreatNow")
	public String getPaperCreatNow(Long userId,String paperName,ModelMap map) {
		FrontUser user=(FrontUser) getSession(WindyConstants.SESSION_FRONTUSER);
		List<Map<String,Object>> paperCreatList=paperCreatService.getPaperCreatWillDo(user.getUserId(),paperName);
		/*InterJson paperCreatListJson=new InterJson();
		paperCreatListJson.setCode("200");*/
		map.put("paperCreatList", paperCreatList);
		return "web/module/personalCen/examInformation";
	}
	
	//随机生成试题
	@RequestMapping("/toStartTest")
	public String toStartTest(Long orgId,Long paperCreatId,Long examId,ModelMap ma) {
		FrontUser frontUser = (FrontUser) getSession(WindyConstants.SESSION_FRONTUSER);
		ma.put("frontUser",frontUser);
		Map mm=paperCreatService.getPaperSet(paperCreatId);
		
		//判断是否要显示答案
		/*Examination examination=examinationMapper.selectByPrimaryKey(examId);
		ma.put("isShow",examination.getAttr0());*/
		//考试id
		ma.put("examId", examId);
		
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
		if(paperCreatService.getById(paperCreatId).getSets()==1){
			Map map=paperCreatService.getQuestionShouDong(paperCreatId);
			//考试时间限制
			String testTimes=(String) map.get("testTime");
			//考试分数线
			Integer lines=(Integer) map.get("line");
			Integer danxuantiFen=(Integer) map.get("danxuantiFen");
			Integer duoxuantiFen=(Integer) map.get("duoxuantiFen");
			Integer panduantiFen=(Integer) map.get("panduantiFen");
			
			//单选题集合
			List<Questions>danxuanToList=(List<Questions>) map.get("questionsList");
			//单选题id集合
			List<Long> danxuanIdLists=new ArrayList<>();
			for(Questions questions:danxuanToList){
				danxuanIdLists.add(questions.getId());
			}
			StringBuffer danSb=new StringBuffer();
			for(Long sLong:danxuanIdLists){
				danSb.append(sLong+",");
			}
			danSb=danSb.deleteCharAt(danSb.lastIndexOf(","));
			String danxuaIdList=danSb.toString();
			ma.put("danxuanIdList", danxuaIdList);
			//单选题总分
			Integer danxuantiZong=(Integer) map.get("danxuantiZongFen");
			
			//多选题集合
			List<Questions> duoxianToList=(List<Questions>) map.get("duoxuantiList");
			//多选题id集合
			List<Long> duoxaintiIdList=new ArrayList<>();
			for(Questions questions:duoxianToList){
				duoxaintiIdList.add(questions.getId());
			}
			StringBuffer duoSb=new StringBuffer();
			for(Long s:duoxaintiIdList){
				duoSb.append(s+",");
			}
			duoSb=duoSb.deleteCharAt(duoSb.lastIndexOf(","));
			String duoxuanIdList=duoSb.toString();
			ma.put("duoxuanIdList", duoxuanIdList);
			//多选题总分
			Integer duoxuantiZong=(Integer) map.get("duoxuantiZongFen");
			
			
			//判断题集合
			List<Questions> panduanToList=(List<Questions>) map.get("panduantiList");
			List<Long> panduantiIdList=new ArrayList<>();
			for(Questions questions:panduanToList){
				panduantiIdList.add(questions.getId());
			}
			StringBuffer panSb=new StringBuffer();
			for(Long sLong:panduantiIdList){
				panSb.append(sLong+",");
			}
			panSb=panSb.deleteCharAt(panSb.lastIndexOf(","));
			String panduanIdList=panSb.toString();
			ma.put("panduanIdList", panduanIdList);
			//判断题总分
			Integer panduantiZong=(Integer) map.get("panduantiZongFen");
			
			
			ma.put("testTime", testTimes);
			ma.put("line", lines);
			//单选题集合
			ma.put("danxuanToList", danxuanToList);
			//单选题总分
			ma.put("danxuantiZong", danxuantiZong);
			//单选题分值
			ma.put("danxuantiFen", danxuantiFen);
			
			//多选题集合
			ma.put("duoxianToList", duoxianToList);
			//多选题总分
			ma.put("duoxuantiZong", duoxuantiZong);
			//多选分值
			ma.put("duoxuantiFen", duoxuantiFen);
			
			//判断题集合
			ma.put("panduanToList", panduanToList);
			//判断题总分
			ma.put("panduantiZong", panduantiZong);
			//判断题分值
			ma.put("panduantiFen", panduantiFen);
			
			
			//单选题数量
			ma.put("danxuanNum",danxuanToList.size());
			//多选题数量
			ma.put("duoxuanNum", duoxianToList.size());
			//判断题数量
			ma.put("panduanNum", panduanToList.size());
			
		}
		
		if(paperCreatService.getById(paperCreatId).getSets()==0){
			Map map=paperCreatService.getquestions(orgId, danxuanNum, duoxuanNum, panduanNum,paperCreatId);
			//生成的单选题
			List<Questions> danxuanToList=(List<Questions>) map.get("danxuanToList");
			//生成的多选题
			List<Questions> duoxianToList=(List<Questions>) map.get("duoxianToList");
			//生成的判断题
			List<Questions> panduanToList=(List<Questions>) map.get("panduanToList");
			
			Integer danxuanFen=(Integer) map.get("danxuanFen");
			Integer duoxuanFen=(Integer) map.get("duoxuanFen");
			Integer panduanFen=(Integer) map.get("panduanFen");
			
			////生成的单选题ID集合
			List<Long> danxuanIdList=new ArrayList<Long>();
			for(Questions questions:danxuanToList) {
				 danxuanIdList.add(questions.getId());
			}
			 StringBuffer dans=new StringBuffer();
			 for(int i=0;i<danxuanIdList.size();i++){
				 
				 if(i!=danxuanIdList.size()-1){
					 dans.append(danxuanIdList.get(i)+",");
				 }
				 if(i==danxuanIdList.size()-1) {
					 dans.append(String.valueOf(danxuanIdList.get(i)));
				 }
			 }
			 /*for(Long danxuanid:danxuanIdList) {
				 dans.append(danxuanid+",");
				 (String.valueOf(danxuanid)+",");
			 }*/
			 /*dans.deleteCharAt(dans.lastIndexOf(","));*/
			 String danxuanIdLists=dans.toString();
			 ma.put("danxuanIdList", danxuanIdLists);
			 
			//生成的多选题ID集合
			List<Long> duoxuanIdList=new ArrayList<Long>();
			for(Questions questions:duoxianToList) {
				duoxuanIdList.add(questions.getId());
			}
			StringBuffer duos=new StringBuffer();
			for(int i=0;i<duoxuanIdList.size();i++){
				if(i==duoxuanIdList.size()-1){
					duos.append(String.valueOf(duoxuanIdList.get(i)));
				}
				if(i!=duoxuanIdList.size()-1){
					duos.append(duoxuanIdList.get(i)+",");
				}
			} 
			
			/*for(Long duoxuanid:duoxuanIdList) {
				 duos.append(duoxuanid+",");
			 }*/
			 /*duos.deleteCharAt(duos.lastIndexOf(","));*/
			 String duoxuanIdLists=duos.toString();
			 ma.put("duoxuanIdList", duoxuanIdLists);
			
			//生成的判断题ID集合
			List<Long> panduanIdList=new ArrayList<Long>();
			for(Questions questions:panduanToList) {
				panduanIdList.add(questions.getId());
			}
			StringBuffer pans=new StringBuffer();
			for(int i=0;i<panduanIdList.size();i++){
				if(i!=panduanIdList.size()-1) {
					pans.append(panduanIdList.get(i)+",");
				}
				if(i==panduanIdList.size()-1) {
					pans.append(String.valueOf( panduanIdList.get(i)));
				}
			} 
			/*for(Long panid:panduanIdList) {
				 pans.append(panid+",");
			 }*/
			 /*pans.deleteCharAt(pans.lastIndexOf(","));*/
			 String panduanIdLists=pans.toString();
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
			ma.put("danxuanNum", danxuanToList.size());
			//多选数量
			ma.put("duoxuanNum", duoxianToList.size());
			//判断数量
			ma.put("panduanNum", panduanToList.size());
	
			//单选分值
			ma.put("danxuantiFen", danxuanFen);
			//多选分值
			ma.put("duoxuantiFen", duoxuanFen);
			//判断分值
			ma.put("panduantiFen", panduanFen);
		}

		ma.put("paperCreatId", paperCreatId);
	

		return "web/module/exam/beginExam";
	}
	
	

	
	//提交试卷   List<Questions> danxuanToList,List<Questions> duoxianToList,List<Questions> panduanToList
	@RequestMapping("/submitTest")	
	@ResponseBody
	public String submitTest(ModelMap map,String nn,String mm,String cnn,String cmm,String danxuanIdList,String duoxuanIdList,String panduanIdList,Integer danxuanNum,Integer duoxuanNum,Integer panduanNum,Integer danxuantiZong,Integer duoxuantiZong,Integer panduantiZong,Long paperCreatId,Integer line,Long isShow,Long examId) {
		Map ms=paperCreatService.getAllList(danxuanIdList, duoxuanIdList, panduanIdList);
		List<Questions> danxuanToList=(List<Questions>) ms.get("danxuanToList");
		
		List<Questions> duoxianToList=(List<Questions>) ms.get("duoxianToList");

		List<Questions> panduanToList=(List<Questions>) ms.get("panduanToList");
		
		FrontUser user=(FrontUser) getSession(WindyConstants.SESSION_FRONTUSER);
		
		//改变用户考试关联表的状态
		paperCreatService.updateStaute(examId, user.getUserId());
		
		paperCreatService.put(user.getUserId(), examId);
		
		//TODO
		//选中的选框下标
		String []rnn=nn.split(",");
		//所有的radio下标
		String []rmm=mm.split(",");
		//单选答案
		String danxuansss="";
		//判断答案
		String panduanaaa="";
		
		if("".equals(nn)) {
			for(int i=0;i<danxuanNum;i++) {
				danxuansss+="E,";
			}
			for(int i=danxuanNum;i<panduanNum+danxuanNum;i++) {
				panduanaaa+="2,";
			}
		}else {
			int [] a=new int[rmm.length];//答案个数
			for(int i=0;i<rnn.length;i++) {
				a[i]=Integer.parseInt(rnn[i]);
			}
			
			
			int[] c=new int[danxuanNum];
			int k=0;
			int l=0;
			int j;
			int danxuanNums=danxuanNum*4;
			for(int p=0;p<danxuanNums;p=p+4) {
				for(j=0;j<=4;j++) {
					if(j<4) {
						if((p+j)==a[l]) {
							c[k]=a[l]%4;
							l++;
							k++;
							break;
						}
					}
					if(j==4) {
						c[k]=4;
						k++;
					}
				}
			}
			for(int i=0;i<danxuanNum;i++) {
				switch(c[i]) {
				case 0:danxuansss=danxuansss+"A,";break;
				case 1:danxuansss=danxuansss+"B,";break;
				case 2:danxuansss=danxuansss+"C,";break;
				case 3:danxuansss=danxuansss+"D,";break;
				case 4:danxuansss=danxuansss+"E,";break;
				}
			}
			
			
			//判断题
			int [] d=new int[panduanNum];
			int k1=0;//答案下标
			int j1;
			int panduanNums=danxuanNums+panduanNum*2;
			for(int p=danxuanNums;p<panduanNums;p=p+2) {
				for(j1=0;j1<=2;j1++) {
					if(j1<2) {
						if((p+j1)==a[l]){
							d[k1]=a[l]%2;
							l++;
							k1++;
							break;
						}
					}
					if(j1==2) {
						d[k1]=2;
						k1++;
					}
				}
			}
			for(int i=0;i<panduanNum;i++) {
				switch(d[i]) {
				case 0:panduanaaa=panduanaaa+"0,";break; 
				case 1:panduanaaa=panduanaaa+"1,";break;
				case 2:panduanaaa=panduanaaa+"2,";break;
				}
			}
			
		}
		
		
		String[] ccnn=cnn.split(",");//选中的
		String[] ccmm=cmm.split(",");
		//多选答案
		String duoxuanddd=""; 
		
		Integer duoxuanNums=duoxuanNum*4;
		
		if("".equals(ccnn[0].trim()) || ccnn==null || ccnn.length==0) {
			for(int i=0;i<duoxuanNum;i++) {
				duoxuanddd+="EEEE,";
			}
		}else {
			int[] d=new int[ccmm.length];//
			for(int i=0;i<ccnn.length;i++) {
				d[i]=Integer.parseInt(ccnn[i]);
			}
			
			StringBuffer [] f=new StringBuffer[ccmm.length];
			
			int q=0;//答案下标
			int w=0;//选中的下标
			for(int p=0;p<duoxuanNums;p=p+4) {
				f[q]=new StringBuffer();
				
				for(int j=0;j<=4;j++) {
					
					if(j<4){
						if((p+j)==d[w]){
							f[q].append(String.valueOf(d[w]%4));
							w++;
							//TODO
						}else{
							f[q].append("4");
							
						}
						/*if((p+j)!=d[w]) {
							
						}*/
					}
					/*if(j==4) {
						f[q].append(String.valueOf(4));q++;
					}*/
				}
				q++;
			}
			
			StringBuffer sb1=new StringBuffer("0444");
			StringBuffer sb2=new StringBuffer("0144");
			StringBuffer sb3=new StringBuffer("0124");
			StringBuffer sb4=new StringBuffer("0123");
			StringBuffer sb5=new StringBuffer("0143");
			StringBuffer sb6=new StringBuffer("0424");
			StringBuffer sb7=new StringBuffer("0423");
			StringBuffer sb8=new StringBuffer("0443");
			StringBuffer sb9=new StringBuffer("4144");
			StringBuffer sb10=new StringBuffer("4124");
			StringBuffer sb11=new StringBuffer("4123");
			StringBuffer sb12=new StringBuffer("4143");
			StringBuffer sb13=new StringBuffer("4424");
			StringBuffer sb14=new StringBuffer("4423");
			StringBuffer sb15=new StringBuffer("4443");
			StringBuffer sb16=new StringBuffer("4444");
			for(int i=0;i<duoxuanNum;i++) {
				if((sb1.toString()).equals(f[i].toString())) {
					duoxuanddd+="A,";
				}
				if((sb2.toString()).equals(f[i].toString())) {
					duoxuanddd+="AB,";
				}
				if((sb3.toString()).equals(f[i].toString())) {
					duoxuanddd+="ABC,";
				}
				if((sb4.toString()).equals(f[i].toString())) {
					duoxuanddd+="ABCD,";
				}
				if((sb5.toString()).equals(f[i].toString())) {
					duoxuanddd+="ABD,";
				}
				
				if((sb6.toString()).equals(f[i].toString())) {
					duoxuanddd+="AC,";
				}
				
				if((sb7.toString()).equals(f[i].toString())) {
					duoxuanddd+="ACD,";
				}
				
				if((sb8.toString()).equals(f[i].toString())) {
					duoxuanddd+="AD,";
				}
				
				if((sb9.toString()).equals(f[i].toString())) {
					duoxuanddd+="B,";
				}
				
				if((sb10.toString()).equals(f[i].toString())) {
					duoxuanddd+="BC,";
				}
				
				if((sb11.toString()).equals(f[i].toString())) {
					duoxuanddd+="BCD,";
				}
				
				if((sb12.toString()).equals(f[i].toString())) {
					duoxuanddd+="BD,";
				}
				
				if((sb13.toString()).equals(f[i].toString())) {
					duoxuanddd+="C,";
				}
				
				if((sb14.toString()).equals(f[i].toString())) {
					duoxuanddd+="CD,";
				}
				
				if((sb15.toString()).equals(f[i].toString())) {
					duoxuanddd+="D,";
				}
				if((sb16.toString()).equals(f[i].toString())) {
					duoxuanddd+="EEEE,";
				}
			}
		}
		
		//单选题解析
		Map danxuanMap=paperCreatService.getDanxuanAnswer(danxuansss,danxuanToList,danxuantiZong,paperCreatId);
			//答对的题目数量
			Integer danxuanRighrNum=(Integer) danxuanMap.get("danxuanRighrNum");
			//答对题目题号的集合
			List<Integer> danxuanRighrList=(List<Integer>) danxuanMap.get("danxuanRighrList");
			//答错的题目数量
			Integer danxuanWrongNum=(Integer) danxuanMap.get("danxuanWrongNum");
			//答错题目题号的集合
			List<Integer> danxuanWrongList=(List<Integer>) danxuanMap.get("danxuanWrongList");
			//用户总得分
			Double zongFenDanxuan=(Double) danxuanMap.get("zongFenDanxuan");
			//单选题(需要返回到前段展示给用户)
			List<Questions> danxuanToLists=(List<Questions>) danxuanMap.get("danxuanToList");
			
		//多选题解析
		Map duoxuanMap=paperCreatService.getDuoxuanAnswer(duoxuanddd, duoxianToList, duoxuantiZong,paperCreatId);
			//答对的题目数量
			Integer duoxuanRightNum=(Integer) duoxuanMap.get("duoxuanRightNum");
			//答对题目题号的集合
			List<Integer> duoxuanRightList=(List<Integer>) duoxuanMap.get("duoxuanRightList");
			//答错的题目数量
			Integer duoxuanWrongNum=(Integer) duoxuanMap.get("duoxuanWrongNum");
			//答错题目题号的集合
			List<Integer> duoxuanWrongList=(List<Integer>) duoxuanMap.get("duoxuanWrongList");
			//用户总得分
			Double zongFenDuoxuan=(Double) duoxuanMap.get("zongFenDuoxuan");
			//多选题(需要返回到前段展示给用户)
			List<Questions> duoxianToLists=(List<Questions>) duoxuanMap.get("duoxianToList");
			
		//判断题解析
		Map panduanMap=paperCreatService.getPanduanAnswer(panduanaaa,panduanToList, panduantiZong,paperCreatId);
			//答对的题目数量
			Integer panduanRightNum=(Integer) panduanMap.get("panduanRightNum");
			//答对题目题号的集合
			List<Integer> panduanRightList=(List<Integer>) panduanMap.get("panduanRightList");
			//答错的题目数量
			Integer panduanWrongNum=(Integer) panduanMap.get("panduanWrongNum");
			//答错题目题号的集合
			List<Integer> panduanWrongList=(List<Integer>) panduanMap.get("panduanWrongList");
			//用户总得分
			Double zongFenPanduan=(Double) panduanMap.get("zongFenPanduan");
			//判断题(需要返回到前段展示给用户)
			List<Questions> panduanToLists=(List<Questions>) panduanMap.get("panduanToList");
			//用户总得分
			Double zongDeFen=zongFenDanxuan+zongFenDuoxuan+zongFenPanduan;
			Integer a=paperCreatService.idToLine(paperCreatId,zongDeFen);
			
			
		//把数据放入记录表中
		paperCreatService.toRecord(user.getUserId(), paperCreatId, danxuanMap, duoxuanMap, panduanMap, danxuansss, panduanaaa, duoxuanddd,danxuanNum,duoxuanNum,panduanNum,zongDeFen,a,examId);
		
		//单选
		map.put("danxuanToLists", danxuanToLists);
		//多选
		map.put("duoxianToLists", duoxianToLists);
		//判断
		map.put("panduanToLists", panduanToLists);
		
		//单选题总分值
		map.put("countFen", danxuanMap.get("countFen"));
		//多选题总分值
		map.put("duoCountFen", duoxuanMap.get("duoCountFen"));
		//判断题总分值
		map.put("panCountFen", panduanMap.get("panCountFen"));
		
		//答对的题数
		map.put("rightNum", danxuanRighrNum+duoxuanRightNum+panduanRightNum);
		//总得分
		map.put("zongDeFen", zongDeFen);
		//单选答对的数量
		map.put("danxuanRighrNum", danxuanRighrNum);
		//单选答错的数量
		map.put("danxuanWrongNum", danxuanWrongNum);
		//多选答对的数量
		map.put("duoxuanRightNum", duoxuanRightNum);
		//多选答错的数量
		map.put("duoxuanWrongNum", duoxuanWrongNum);
		//判断答对的数量
		map.put("panduanRightNum", panduanRightNum);
		//判断答错的数量
		map.put("panduanWrongNum", panduanWrongNum);
		
		//单选答对的题号
		map.put("danxuanRighrList", danxuanRighrList);
		//单选答错的题号
		map.put("danxuanWrongList", danxuanWrongList);
		//多选答对的题号
		map.put("duoxuanRightList", duoxuanRightList);
		//多选答错的题号
		map.put("duoxuanWrongList", duoxuanWrongList);
		//判断答对的题号
		map.put("panduanRightList", panduanRightList);
		//判断答错的题号
		map.put("panduanWrongList", panduanWrongList);
		
		map.put("paperCreatId", paperCreatId);
		//是否显示答案
		map.put("isShow",isShow);
		Integer counts=paperCreatService.getToTestTime(user.getUserId(), examId,paperCreatId);
		map.put("counts", counts);
		
		Map<String,Object> mms=new HashMap<>();
		mms.put("zongDeFen", zongDeFen);
		mms.put("counts", counts);
//		return "admin/examination/paperCreat/results";
		StringBuffer sBuffer=new StringBuffer();
		sBuffer.append("本次考试您的分数是");
		sBuffer.append(zongDeFen+",");
		sBuffer.append("本套试卷您还能再考");
		sBuffer.append(counts);
		String ss=sBuffer.toString();
		return ss;
		
	}
	
	/**
	 * 前台用户查看考试记录
	 * @param paperCreatName
	 * @param page
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/getRecord")
	public String getRecord(String paperCreatName,Pagination page,ModelMap map) throws UnsupportedEncodingException {
		
		FrontUser user=(FrontUser) getSession(WindyConstants.SESSION_FRONTUSER);
		if(paperCreatName!=null && !"".equals(paperCreatName)) {
			//解码
			paperCreatName = URLDecoder.decode(paperCreatName, "UTF-8");
		}
		
		List<Map<String,Object>> recordList=recordService.getRecord(null,user.getUserId(), paperCreatName, page);
		page.setTotal(recordService.getRecordCount(null,user.getUserId(),paperCreatName));
		
		map.put("userId", user.getUserId());
		map.put("page", page);
		map.put("recordList", recordList);
		return "web/module/personalCen/examRecord";
	}
	
	@RequestMapping("/Fenye")
	public String Fenye(String paperCreatName,Pagination page,Long userId,ModelMap map){
		List<Map<String,Object>> recordList=recordService.getRecord(null,userId, paperCreatName, page);
		page.setTotal(recordService.getRecordCount(null,userId,paperCreatName));
		
		map.put("recordList", recordList);
		map.put("page", page);
		return "web/module/personalCen/examRecord2";
	}
	
	
	
	
	//查看补考信息
	@RequestMapping("/getFixRecord")
	public String getFixRecord(String paperCreatName,Pagination page,ModelMap map) throws UnsupportedEncodingException {
		FrontUser user=(FrontUser) getSession(WindyConstants.SESSION_FRONTUSER);
		if(paperCreatName!=null && !"".equals(paperCreatName)) {
			//解码
			paperCreatName = URLDecoder.decode(paperCreatName, "UTF-8");
		}
		String attr19="true";
		List<Map<String,Object>> recordList=recordService.getRecord(attr19,user.getUserId(), paperCreatName, page);
		map.put("recordList", recordList);
		map.put("page",page);
		return "web/module/personalCen/fixRecord";
	}
	
	//查看考试记录详情
	@RequestMapping("/getRecordDetail")
	public String getRecordDetail(Long recordId,Long examinationId,ModelMap mm){
		Map map=recordService.toDetail(recordId);
		
		Integer danxuanFen=(Integer) map.get("danxuanFen");
		Integer duoxuanFen=(Integer) map.get("duoxuanFen");
		Integer panduanFen=(Integer) map.get("panduanFen");
		//单选题分值
		mm.put("danxuanFen", danxuanFen);
		//多选题分值
		mm.put("duoxuanFen", duoxuanFen);
		//判断题分值
		mm.put("panduanFen", panduanFen);
		
		//一共答对的题数
		Integer rightNum=(Integer) map.get("rightNum");
		mm.put("rightNum", rightNum);
		
		//用户总得分
		Double zongDeFen=(Double) map.get("zongDeFen");
		mm.put("zongDeFen", zongDeFen);
		
		//单选题答对的数量
		Integer danxuanRighrNum=(Integer) map.get("danxuanRighrNum");
		mm.put("danxuanRighrNum", danxuanRighrNum);
		
		//单选题答对的题号list
		List<Integer> danxuanRighrList=(List<Integer>) map.get("danxuanRighrList");
		mm.put("danxuanRighrList", danxuanRighrList);
		
		//单选题答错的数量
		Integer danxuanWrongNum=(Integer) map.get("danxuanWrongNum");
		mm.put("danxuanWrongNum", danxuanWrongNum);
		
		//单选题答错的题号list
		List<Integer> danxuanWrongList=(List<Integer>) map.get("danxuanWrongList");
		mm.put("danxuanWrongList", danxuanWrongList);
		
		//多选题答对的数量
		Integer duoxuanRightNum=(Integer) map.get("duoxuanRightNum");
		mm.put("duoxuanRightNum", duoxuanRightNum);
		
		//多选题答对题号list
		List<Integer> duoxuanRightList=(List<Integer>) map.get("duoxuanRightList");
		mm.put("duoxuanRightList", duoxuanRightList);
		
		//多选题答错的数量
		Integer duoxuanWrongNum=(Integer) map.get("duoxuanWrongNum");
		mm.put("duoxuanWrongNum", duoxuanWrongNum);
		
		//多选题答错题号list
		List<Integer> duoxuanWrongList=(List<Integer>) map.get("duoxuanWrongList");
		mm.put("duoxuanWrongList", duoxuanWrongList);
		
		//判断题答对的数量
		Integer panduanRightNum=(Integer) map.get("panduanRightNum");
		mm.put("panduanRightNum", panduanRightNum);
		
		//判断题答对题号的list
		List<Integer>panduanRightList=(List<Integer>) map.get("panduanRightList");
		mm.put("panduanRightList", panduanRightList);
		
		//判断题答错的数量
		Integer panduanWrongNum=(Integer) map.get("panduanWrongNum");
		mm.put("panduanWrongNum", panduanWrongNum);
		
		//判断题答错的题号list
		List<Integer>panduanWrongList=(List<Integer>) map.get("panduanWrongList");
		mm.put("panduanWrongList", panduanWrongList);
		
		//获取单选题列表
		List<Questions> danxuantiList=(List<Questions>) map.get("danxuantiList");
		mm.put("danxuanToLists", danxuantiList);
		//获取单选题总分值
		Integer countFen=(Integer) map.get("countFen");
		mm.put("countFen", countFen);
		
		//获取多选题列表
		List<Questions> duoxuantiList=(List<Questions>) map.get("duoxuantiList");
		mm.put("duoxianToLists", duoxuantiList);
		//获取多选题总分值
		Integer duoCountFen=(Integer) map.get("duoCountFen");
		mm.put("duoCountFen", duoCountFen);
		
		//获取判断题列表
		List<Questions> panduantiList=(List<Questions>) map.get("panduantiList");
		mm.put("panduanToLists", panduantiList);
		//获取判断题总分值
		Integer panCountFen=(Integer) map.get("panCountFen");
		mm.put("panCountFen", panCountFen);
		FrontUser frontUser = (FrontUser) getSession(WindyConstants.SESSION_FRONTUSER);
		mm.put("frontUser",frontUser);
		
		ExaminationQuery query=new ExaminationQuery();
		Integer isShow=Integer.valueOf(examinationMapper.selectByPrimaryKey(examinationId).getAttr0());
		mm.put("isShow", isShow);
		return "web/module/exam/endExamDetail";
	}

//挑传到首页
	@RequestMapping("/toMain")
	public String toMain(ModelMap mm){
		 FrontUser user=(FrontUser) getSession(WindyConstants.SESSION_FRONTUSER);
		 mm.put("frontUser",user);
		 List<Map<String,Object>> paperCreatServiceList=paperCreatService.getPaperCreatWillDo(user.getUserId(),null);
         mm.put("paperCreatServiceList", paperCreatServiceList);
         mm.put("Org",orgService.findById(user.getOrgId()));
         putSession("org",orgService.findById(user.getOrgId()));
         return "web/module/personalCen/personalCen";
		
	}


	/**
	 *
	 * @param examId
	 * @return
	 */
	@RequestMapping("/checkExamSecond")
	@ResponseBody
	public Map<String,Object> checkExamSecond(Long examId){
		FrontUser frontUser = (FrontUser) getSession(WindyConstants.SESSION_FRONTUSER);
		return examinationService.checkExamSecond(frontUser.getUserId(),examId);
	}



}
