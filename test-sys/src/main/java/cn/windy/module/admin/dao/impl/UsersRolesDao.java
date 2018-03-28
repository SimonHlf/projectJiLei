package cn.windy.module.admin.dao.impl;

import cn.windy.module.admin.dao.IUsersRolesDao;
import cn.windy.module.admin.hibernate.model.UsersRoles;
import cn.windy.module.core.dao.impl.BaseDao;
import org.springframework.stereotype.Repository;

@Repository
public class UsersRolesDao extends BaseDao<UsersRoles> implements IUsersRolesDao {
}
