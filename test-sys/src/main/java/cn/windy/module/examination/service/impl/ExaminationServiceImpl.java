package cn.windy.module.examination.service.impl;

import cn.windy.module.examination.dao.ExamPersonnelMapper;
import cn.windy.module.examination.dao.ExaminationMapper;
import cn.windy.module.examination.dao.UserPapercreatMapper;
import cn.windy.module.examination.dao.WindyOrgMapper;
import cn.windy.module.examination.mybatis.model.*;
import cn.windy.module.examination.service.ExaminationService;
import cn.windy.util.DateUtil;
import cn.windy.util.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class ExaminationServiceImpl implements ExaminationService {


    /**
     * 考试表
     */
    @Autowired
    ExaminationMapper examinationMapper;

    /**
     * 考试关联表
     */
    @Autowired
    ExamPersonnelMapper examPersonnelMapper;

    @Autowired
    private UserPapercreatMapper userPapercreatMapper;

    @Autowired
    private WindyOrgMapper windyOrgMapper;
    
    @Override
    public List<Map<String, Object>> findAll(Pagination page,String examName,Long orgId) {
        return examinationMapper.findAll((page.getPage() - 1) * page.getPageSize(),page.getPageSize(),orgId,examName);
    }

    @Override
    public void add(Examination examination,String ids) {
        examinationMapper.insert(examination);
        String[] idc = ids.split(",");
        Integer count = 0;
        if(idc.length > 1){
            if(idc[1].equals("-2")){
                count = 2;
            } else {
                count = 1;
            }
            for (int i = count; i < idc.length; i++) {
                ExamPersonnel examPersonnel = SetExamPersonnerl(examination.getId(),examination.getCreatId(),Long.parseLong(idc[i]));
            /*ExamPersonnel examPersonnel = new ExamPersonnel();
            examPersonnel.setExamId(examination.getId());//考试Id
            examPersonnel.setCreatId(examination.getCreatId());//试卷Id
            examPersonnel.setUserId(Long.parseLong(idc[i]));//考生Id
            examPersonnel.setIsExam(0);//是否考试*/
                examPersonnelMapper.insert(examPersonnel);

                UserPapercreatQuery query=new UserPapercreatQuery();
                UserPapercreatQuery.Criteria criteria=query.createCriteria();
                criteria.andUseridEqualTo(Long.valueOf(Long.valueOf(idc[i])));
                criteria.andPapercreatidEqualTo(examination.getCreatId());
                List<UserPapercreat> userPapercreatsList=userPapercreatMapper.selectByExample(query);
                if(userPapercreatsList.size()==0){
                    UserPapercreat  uPapercreat=new UserPapercreat();
                    uPapercreat.setUserid(Long.valueOf(idc[i]));
                    uPapercreat.setPapercreatid(examination.getCreatId());
                    uPapercreat.setTimes(0);
                    userPapercreatMapper.insert(uPapercreat);
            	/* UserPapercreat uPapercreat=userPapercreatsList.get(0);
            	 Integer times=uPapercreat.getTimes();
            	 times+=1;
            	 uPapercreat.setTimes(times);
            	 userPapercreatMapper.updateByExampleSelective(uPapercreat, null);*/
                }
            }
        }


      /*  String []strings=ids.split(",");

        List<Long> userIds=new ArrayList<>();

        for(String userId:strings){
        	 UserPapercreatQuery query=new UserPapercreatQuery();
             UserPapercreatQuery.Criteria criteria=query.createCriteria();
             criteria.andUseridEqualTo(Long.valueOf(userId));
             criteria.andPapercreatidEqualTo(examination.getCreatId());
             List<UserPapercreat> userPapercreatsList=userPapercreatMapper.selectByExample(query);
             if(userPapercreatsList.size()==0){
            	 UserPapercreat  uPapercreat=new UserPapercreat();
            	 uPapercreat.setUserid(Long.valueOf(userId));
            	 uPapercreat.setPapercreatid(examination.getCreatId());
            	 uPapercreat.setTimes(0);
            	 userPapercreatMapper.insert(uPapercreat);
            	*//* UserPapercreat uPapercreat=userPapercreatsList.get(0);
            	 Integer times=uPapercreat.getTimes();
            	 times+=1;
            	 uPapercreat.setTimes(times);
            	 userPapercreatMapper.updateByExampleSelective(uPapercreat, null);*//*
             }
        }*/
       
        
    }

    //添加考试
    @Override
    public void addExam(Examination examination) {
        examinationMapper.insert(examination);
    }

    @Override
    public void addExamPraction(Examination examination) {
        examinationMapper.insert(examination);
    }

    @Override
    public Examination findById(Long id) {
        return examinationMapper.selectByPrimaryKey(id);
    }



    @Override
    public void update(Examination examination) {
        examinationMapper.updateByPrimaryKeySelective(examination);
    }

    @Override
    public void delete(String ids) {
        String[] idc = ids.split(",");
        List<Long> list = new ArrayList<>();
        for (String str : idc){
            list.add(Long.valueOf(str));
            examPersonnelMapper.deleteExamFrontUser(Long.parseLong(str));
        }
        ExaminationQuery query = new ExaminationQuery();
        ExaminationQuery.Criteria criteria = query.createCriteria();
        criteria.andIdIn(list);
        examinationMapper.deleteByExample(query);

    }

    @Override
    public void saveExaminatinForm(Examination examination) {
        examinationMapper.updateByPrimaryKeySelective(examination);
    }

    /**
     *
     * @param examination
     * @param ids 选中的 id
     * @param zeroIds 列表所有的 id
     */
    @Override
    public void ExamUpdate(Examination examination, String ids, String zeroIds) {
        String[] idc = ids.split(",");
        String[] zeroIdc = zeroIds.split(",");
        List<String> asList = Arrays.asList(idc);
        List<String> strList = new ArrayList<>();
        //获取表单中未选中的值
        for (String str : zeroIdc){
            if(!asList.contains(str)){
                strList.add(str);
            }
        }
        //删除为勾选用户关联考试表信息
        examPersonnelMapper.DeleteUncheckedExamUserId(examination.getId(),strList);

        //加入关联表用户信息
        Integer count = 0;
        if(idc.length > 1){
            if(idc[1].equals("-2")){
                count = 2;
            } else {
                count = 1;
            }
            for (int i = count; i < idc.length; i++) {
                ExamPersonnel examPersonnel = SetExamPersonnerl(examination.getId(),examination.getCreatId(),Long.parseLong(idc[i]));
                examPersonnelMapper.insert(examPersonnel);
            }
        }
        examinationMapper.updateByPrimaryKeySelective(examination);

    }


    public ExamPersonnel SetExamPersonnerl(Long examId,Long creatId,Long userId){
        ExamPersonnel examPersonnel = new ExamPersonnel();
        examPersonnel.setExamId(examId);//考试Id
        examPersonnel.setCreatId(creatId);//试卷Id
        examPersonnel.setUserId(userId);//考生Id
        examPersonnel.setIsExam(0);//是否考试
        return examPersonnel;
    }


    //跳转添加考试选择考生页面
    @Override
    public List<Map<String, Object>> findJumpAddFrontUser() {
        return null;
    }

    /**
     * 前端即将开始的考试
     * @param page
     * @return
     */
    @Override
    public List<Map<String, Object>> findWebExamination(Pagination page,Long orgId) {
        return examinationMapper.findWebExamination((page.getPage() - 1)*page.getPageSize(),page.getPageSize(),orgId);
    }

    /**
     * 后台审核考试状态(启用/不启用)
     * @param cmd
     * @param examId
     */
    @Override
    public void EnableorNotEnable(Integer cmd, Long examId) {
       Examination examination = examinationMapper.selectByPrimaryKey(examId);
       examination.setExamStatus(cmd);
       examinationMapper.updateByPrimaryKeySelective(examination);
    }

    /**
     * 后台审核考试答案是显示(显示/不显示)
     * @param cmd
     * @param examId
     */
    @Override
    public void AnswerDisplay(Integer cmd, Long examId) {
        Examination examination = examinationMapper.selectByPrimaryKey(examId);
        examination.setAttr0(cmd + "");
        examinationMapper.updateByPrimaryKeySelective(examination);
    }


    @Override
    public List<Map<String, Object>> addfrontUserTable(Long orgId) {
        return examinationMapper.addfrontUserTable(orgId);
    }

    @Override
    public List<Map<String, Object>> updatefrontUserTable(Long orgId, Long examId) {
        return examinationMapper.updatefrontUserTable(orgId,examId);
    }

    /**
     * 点击添加考生 ztree 加载考生列表
     * @param orgId
     * @param examId
     * @param cmd
     * @param level
     * @return
     */
    @Override
    public List<Map<String, Object>> findOpenExamOrFrongUser(Long orgId,Long examId,Integer cmd, Integer level) {
        List<Map<String,Object>> list = null;
        if(level == 1){
            List<WindyOrg> windOrglist = windyOrgMapper.findOrgListByOrgPid(orgId);
            if(windOrglist != null && windOrglist.size() != 0){
                list = new ArrayList<>();
                for (WindyOrg windyOrg : windOrglist){
                    list.addAll(examinationMapper.updatefrontUserTable(windyOrg.getId(),examId));
                }
            }
        } else {
            list = examinationMapper.updatefrontUserTable(orgId,examId);
        }
        return list;
    }

    /**
     * 考试绑定考生
     * @param examId 考试 ID
     * @param ids 选中的考生 Id 集合
     * @param zeroIds 列表页集合
     */
    @Override
    public void ExamOrFrontUser(Long examId, String ids, String zeroIds) {
        String[] idc = ids.split(",");//选中的考生id 数组
        String[] zeroIdc = zeroIds.split(",");//未选中的考生id 数组
        Examination examination = examinationMapper.selectByPrimaryKey(examId);

        //删除未勾选用户关联考试表信息
        examPersonnelMapper.DeleteUncheckedExamUserId(examination.getId(),Arrays.asList(zeroIdc));

        int idcount = 0;//计数选中的考生
        if(idc.length > 1){
            if(idc[1].equals("-2")){
                idcount = 2;
            } else {
                idcount = 1;
            }
            for (int i = idcount; i < idc.length; i++) {
                //添加前先查找用户关联表里有没有这场考试信息
                List<ExamPersonnel> examPersonnelList = examPersonnelMapper.findByListByExamIdAndUserId(examId,Long.parseLong(idc[i]));
                if(examPersonnelList == null || examPersonnelList.size() == 0)
                    //添加勾选的用户关联考试表信息
                    examPersonnelMapper.insert(SetExamPersonnerl(examId,examination.getCreatId(),Long.parseLong(idc[i])));

                UserPapercreatQuery query=new UserPapercreatQuery();
                UserPapercreatQuery.Criteria criteria=query.createCriteria();
                criteria.andUseridEqualTo(Long.valueOf(Long.valueOf(idc[i])));
                criteria.andPapercreatidEqualTo(examination.getId());
                List<UserPapercreat> userPapercreatsList=userPapercreatMapper.selectByExample(query);
                if(userPapercreatsList.size()==0) {
                    UserPapercreat uPapercreat = new UserPapercreat();
                    uPapercreat.setUserid(Long.valueOf(idc[i]));
                    uPapercreat.setPapercreatid(examination.getId());
                    uPapercreat.setTimes(0);
                    userPapercreatMapper.insert(uPapercreat);
                }

            }
        }


    }

    /**
     * 考试详情
     * @param examId
     * @return
     */
    @Override
    public List<Map<String, Object>> Examdetails(Long examId) {
        return examinationMapper.Examdetails(examId);
    }


    @Override
    public Map<String, Object> checkExamSecond(Long userId, Long examId) {
        List<Map<String,Object>> list = examinationMapper.checkExamSecond(examId,userId);
        Map<String,Object> map = new HashMap<>();
        //试卷限制次数
        Integer examUse = (Integer) list.get(0).get("exam_use");

        //考生考试次数
        Integer times = (Integer) list.get(0).get("times");

        //考试次数大于试卷限制次数
        if(times >= examUse){
            map.put("result","false");
        } else {
            map.put("result","true");
        }
        return map;
    }


}
