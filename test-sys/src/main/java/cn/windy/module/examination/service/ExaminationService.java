package cn.windy.module.examination.service;

import cn.windy.module.examination.mybatis.model.Examination;
import cn.windy.util.Pagination;
import org.apache.poi.ss.formula.functions.T;

import java.util.List;
import java.util.Map;

public interface ExaminationService {

    List<Map<String,Object>> findAll(Pagination page,String examName,Long orgId);

    //添加考试 暂不用
    void add(Examination examination,String ids);

    //添加考试
    void addExam(Examination examination);

    //添加练习
    void addExamPraction(Examination examination);

    Examination findById(Long id);


    void update(Examination examination);

    void delete(String ids);

    void saveExaminatinForm(Examination examination);

    void ExamUpdate(Examination examination,String ids,String zeroIds);

    //跳转添加考试选择考生页面
    List<Map<String,Object>> findJumpAddFrontUser();

    /**
     * 前端即将开始的考试
     */
    List<Map<String,Object>> findWebExamination(Pagination page,Long orgId);

    /**
     * 后台审核考试状态(启用/不启用)
     * @param cmd
     * @param examId
     */
    void EnableorNotEnable(Integer cmd,Long examId);

    /**
     * 后台审核考试答案是显示(显示/不显示)
     * @param cmd
     * @param examId
     */
    void AnswerDisplay(Integer cmd,Long examId);

    /**
     * 考试管理 添加考生
     * @param orgId
     * @return
     */
    List<Map<String,Object>> addfrontUserTable(Long orgId);

    List<Map<String,Object>> updatefrontUserTable(Long orgId,Long examId);

    List<Map<String,Object>> findOpenExamOrFrongUser(Long orgId,Long examId,Integer cmd,Integer level);

    /**
     * 考试绑定考生
     * @param examId 考试id
     * @param ids 选中的 id
     * @param zeroIds 未选中的 id
     */
    void ExamOrFrontUser(Long examId,String ids,String zeroIds);

    List<Map<String,Object>> Examdetails(Long examId);


    Map<String,Object> checkExamSecond(Long userId,Long examId);

}
