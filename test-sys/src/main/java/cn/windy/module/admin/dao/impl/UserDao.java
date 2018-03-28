package cn.windy.module.admin.dao.impl;

import cn.windy.module.admin.dao.IUserDao;
import cn.windy.module.admin.hibernate.model.User;
import cn.windy.module.core.dao.impl.BaseDao;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao extends BaseDao<User> implements IUserDao {
}
