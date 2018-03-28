package cn.windy.module.admin.dao.impl;

import cn.windy.module.admin.dao.IDataPermissionDao;
import cn.windy.module.admin.hibernate.model.DataPermission;
import cn.windy.module.core.dao.impl.BaseDao;
import org.springframework.stereotype.Repository;

@Repository
public class DataPermissionDao extends BaseDao<DataPermission> implements IDataPermissionDao {
}
