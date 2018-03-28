package cn.windy.module.admin.service.impl;

import cn.windy.module.admin.dao.IDataPermissionDao;
import cn.windy.module.admin.hibernate.model.DataPermission;
import cn.windy.module.admin.service.IDataPermissionService;
import cn.windy.module.core.service.impl.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DataPermissionService extends BaseService<DataPermission> implements IDataPermissionService {

    @Autowired
    IDataPermissionDao dataPermissionDao;

    @Override
    public void init() {
        setDao(dataPermissionDao);
    }
}
