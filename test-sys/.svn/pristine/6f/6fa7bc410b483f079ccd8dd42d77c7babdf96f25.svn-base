package cn.windy.module.examination.service.impl;

import cn.windy.module.examination.dao.FrontUserMapper;
import cn.windy.module.examination.dao.WindyOrgMapper;
import cn.windy.module.examination.inter.InterJson;
import cn.windy.module.examination.mybatis.model.FrontUser;
import cn.windy.module.examination.mybatis.model.FrontUserQuery;
import cn.windy.module.examination.mybatis.model.WindyOrg;
import cn.windy.module.examination.mybatis.model.WindyOrgQuery;
import cn.windy.module.examination.service.IFrontUserService;
import cn.windy.util.DateUtil;
import cn.windy.util.Pagination;
import cn.windy.util.ReadExcel;
import cn.windy.util.encrypt.MD5;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class FrontUserService implements IFrontUserService {

    @Autowired
    FrontUserMapper frontUserMapper;

    @Autowired
    WindyOrgMapper windyOrgMapper;
    /**
     * 列表，条件查询可用
     */
    @Override
    public List<Map<String,Object>> findAll(Pagination page,String nickName,String theSignature,String attr0,Long orgId) {
    	List<Map<String,Object>> FrontUserList=frontUserMapper.getList(nickName,theSignature,attr0,orgId,(page.getPage() - 1) * page.getPageSize(), page.getPageSize());
    	return FrontUserList;
    }

    
    /**
     * 计数
     */
    @Override
    public long countAll(String nickName,String theSignature,String attr0,Long orgId) {
        
    	return frontUserMapper.getCount(nickName,theSignature,attr0,orgId);
    }
    
    /**
     * 添加或修改前查找所有机构
     * @return
     */
    @Override
    public List<WindyOrg> getWindyOrgList() {
    	WindyOrgQuery query=new WindyOrgQuery();
    	List<WindyOrg> windyOrgList=windyOrgMapper.selectByExample(query);
		return windyOrgList;
	}




    /**
     * 添加
     */
    @Override
    public void add(FrontUser frontUser) {
        frontUserMapper.insert(frontUser);
    }

    /**
     * 根据id查找
     */
    @Override
    public FrontUser findById(Long id) {
        return frontUserMapper.selectByPrimaryKey(id);
    }

    /**
     * 修改
     */
    @Override
    public void Update(FrontUser frontUser) {
        frontUserMapper.updateByPrimaryKeySelective(frontUser);
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
        FrontUserQuery frontUserQuery = new FrontUserQuery();
        FrontUserQuery.Criteria criteria = frontUserQuery.createCriteria();
        criteria.andUserIdIn(list);
        frontUserMapper.deleteByExample(frontUserQuery);
    }


    @Override
    public List<FrontUser> searchFrontUserName(String name) {
        return null;
    }



    //批量导入考生 excel
    @Override
    public void ImportFrontUserExcel(MultipartFile multipartFile,Integer pid) {
        ReadExcel readExcel = new ReadExcel();
        List<Map<String,Object>> list = readExcel.getExcelInfo(multipartFile,0);
        String password = MD5.getMD5Big("123456");
        //遍历list
        for (Map<String,Object> map:list){
            FrontUser frontUser = new FrontUser();
            frontUser.setPassword(password);
            frontUser.setBirthday((String) map.get("birthday"));//生日
            frontUser.setCellPhone((String) map.get("phone"));//手机号
            frontUser.setAttr0((String) map.get("code"));//工号
            if("男".equals(map.get("sex"))){
                frontUser.setSex("1");
            } else {
                frontUser.setSex("0");
            }
            frontUser.setNickName((String) map.get("name"));
            frontUser.setRegTime(DateUtil.getDate());
            frontUser.setOrgId(Long.valueOf(pid));
            frontUser.setLocked("0");
            frontUserMapper.insert(frontUser);
        }
    }


    /**
     * 恢复默认密码
     * @param ids
     */
    @Override
    public void recoveryPassword(String ids) {
        String[] idc = ids.split(",");
        String newPassword = MD5.getMD5Big("123456");
        for (int i = 1; i < idc.length; i++) {
            FrontUser frontUser = frontUserMapper.selectByPrimaryKey(Long.valueOf(idc[i]));
            frontUser.setPassword(newPassword);
            frontUserMapper.updateByPrimaryKeySelective(frontUser);
        }
    }

    /**
     * 后台点击ztree
     * @param
     * @return
     */
    @Override
    public List<Map<String, Object>> ztreeMenuTable(Pagination page,Long orgId) {
        return frontUserMapper.ztreeMenuTable((page.getPage() - 1) * page.getPageSize(), page.getPageSize(),orgId);
    }

    //添加考试跳转添加考生页面
    @Override
    public List<FrontUser> findExamAddFrontUser() {
        return frontUserMapper.selectByExample(null);
    }


    /**
     * 考生考试记录
     * @param page
     * @param userId
     * @return
     */
    @Override
    public List<Map<String, Object>> ExamineeRecord(Pagination page, Long userId) {
        return frontUserMapper.ExamineeRecord((page.getPage() - 1) * page.getPageSize(),page.getPageSize(),userId);
    }



     /*====================     前端接口      ==============================*/

     //登陆接口
    @Override
    public InterJson InterFrontUserLogin(String code, String password) {
        InterJson interJson = new InterJson();
        List<FrontUser> list = frontUserMapper.interFrontUserLogin(code);
        if(list != null && list.size() != 0){
            FrontUser frontUser = list.get(0);
            if(frontUser.getPassword().equals(MD5.getMD5Big(password))){
                 interJson.setCode("200");
                 interJson.setMsg("登陆成功");
                 interJson.setResult(true);
                 interJson.setFrontUser(frontUser);
                 //修改最近登录时间
                 frontUser.setAttr1(DateUtil.getDate());
                 frontUserMapper.updateByPrimaryKeySelective(frontUser);
            } else {
                 interJson.setCode("403");
                 interJson.setMsg("密码错误");
                 interJson.setResult(false);
            }
        } else {
            interJson.setCode("404");
            interJson.setMsg("工号错误");
            interJson.setResult(false);
        }
        return interJson;
    }

    //修改密码接口
    @Override
    public InterJson InterUpdatePasswordFrontUser(FrontUser frontUser,String password,String newPassword) {
        InterJson interJson = new InterJson();
        FrontUser frontUser1 = frontUserMapper.selectByPrimaryKey(frontUser.getUserId());
        if(MD5.getMD5Big(password).equals(frontUser1.getPassword())){
            frontUser1.setPassword(MD5.getMD5Big(newPassword));
            frontUserMapper.updateByPrimaryKeySelective(frontUser1);
            interJson.setCode("200");
            interJson.setMsg("修改成功");
        } else {
            interJson.setCode("400");
            interJson.setMsg("原密码错误");
        }
        return interJson;
    }


    /**
     * 个人中心折线图
     * @param userId
     * @return
     */
    @Override
    public List<Map<String, Object>> findLineEcharts(Long userId) {
        return frontUserMapper.findLineEcharts(DateUtil.format(new Date(),"yyyy"),userId);
    }
    





	@Override
	public List<Map<String, Object>> ztreeMenuTable(Pagination page,
			List<Long> ids,String attr0) {
		return frontUserMapper.ztreeMenuTable1((page.getPage() - 1) * page.getPageSize(), page.getPageSize(),ids,attr0);
	}


	//查找考生考试记录
	@Override
	public List<Map<String, Object>> userRecod(Long orgId,Long userId,Pagination page){
		List<Map<String, Object>> userRecodList=frontUserMapper.getOne(orgId, userId,(page.getPage()-1)*page.getPageSize(),page.getPageSize());
		
		return userRecodList;
	}
	//查找考生考试记录计数
	@Override
	public Long getOneCount(Long orgId,Long userId) {
		Long count=frontUserMapper.getOneCount(orgId, userId);
		
		return count;
	}
	
	
}
