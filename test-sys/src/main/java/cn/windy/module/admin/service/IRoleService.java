package cn.windy.module.admin.service;

import cn.windy.module.admin.hibernate.model.Role;
import cn.windy.module.admin.hibernate.model.User;
import cn.windy.module.core.service.IBaseService;

import java.util.List;

public interface IRoleService extends IBaseService<Role> {

    List<Role> findByUserId(Long uid);
    void saveUsersRols(Long rid,String uids,String zeroIds);



}
