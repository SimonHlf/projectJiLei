package cn.windy.module.admin.service;

import java.util.List;
import java.util.Map;

import cn.windy.module.admin.hibernate.model.User;
import cn.windy.module.core.service.IBaseService;
import cn.windy.util.Pagination;

public interface IUserService extends IBaseService<User> {


    List<Map<String,Object>> findAll(Pagination page,Long orgId,String userName,int cmd);

    User login(String account,String password);
    List<Map<String, Object>> findUserByRoleId(Long roleId);
    List<User> findByCid(Long cid);
    List<User> findByCode();
    List<Map<String, Object>> findByOid(Long oid,Pagination page);
    int findNumByOid(Long oid);

    //角色关联点击目录树加载用户信息
    List<Map<String,Object>> findRelationUser(Long orgId,Long rid);

    List<Map<String,Object>> findZtreeUserByOrgId(Pagination page,Long orgId,int bs);

    //修改密码
    Map<String,Object> updateThisPassword(String password,String newPassword,Long id);


    /**
     * 后台柱状图
     * @param bs
     * @return
     */
    List<Map<String,Object>> findDocBar(Long orgId);

    /**
     * 后台饼状图
     * @return
     */
    List<Integer> findDocPie(Long orgId);

    /**
     * 后台折线图
     * @return
     */
    List<Map<String,Object>> findDocLine(Long orgId);


    /**
     * 后台即将开始的考试
     * @param orgId
     * @return
     */
    List<Map<String,Object>> findSoomStartExam(Long orgId);

}
