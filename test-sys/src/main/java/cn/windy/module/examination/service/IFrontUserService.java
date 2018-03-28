package cn.windy.module.examination.service;

import cn.windy.module.examination.inter.InterJson;
import cn.windy.module.examination.mybatis.model.FrontUser;
import cn.windy.module.examination.mybatis.model.WindyOrg;
import cn.windy.util.Pagination;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

public interface IFrontUserService {

	List<Map<String,Object>> findAll(Pagination page,String nickName,String theSignature,String attr0,Long orgId);

    long countAll(String nickName,String theSignature,String attr0,Long orgId);

    void add(FrontUser frontUser);

    FrontUser findById(Long id);

    void Update(FrontUser frontUser);

    void delete(String ids);

    List<FrontUser> searchFrontUserName(String name);

	List<WindyOrg> getWindyOrgList();

	//Excel 导入考生
	void ImportFrontUserExcel(MultipartFile multipartFile,Integer pid);

	//恢复默认密码
	void recoveryPassword(String ids);

	List<Map<String,Object>> ztreeMenuTable(Pagination page,Long orgId);

	//添加考试跳转添加考生页面
	List<FrontUser> findExamAddFrontUser();

	/**
	 * 考试考试记录
	 * @param page
	 * @param userId
	 * @return
	 */
	List<Map<String,Object>> ExamineeRecord(Pagination page,Long userId);
	
	List<Map<String,Object>> ztreeMenuTable(Pagination page,List<Long> ids,String attr0);


	/*=======================   前端接口    ================================*/

	//登陆接口
	InterJson InterFrontUserLogin(String code, String password);

	//修改密码接口
    InterJson InterUpdatePasswordFrontUser(FrontUser frontUser,String password,String newPassword);

    //个人中心折线图
	List<Map<String,Object>> findLineEcharts(Long userId);

	List<Map<String, Object>> userRecod(Long orgId, Long userId, Pagination page);

	Long getOneCount(Long orgId, Long userId);
}
