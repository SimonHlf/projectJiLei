package cn.windy.module.admin.service.impl;

import cn.windy.module.admin.dao.ISettingDao;
import cn.windy.module.admin.hibernate.model.Setting;
import cn.windy.module.admin.service.ISettingService;
import cn.windy.module.core.service.impl.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SettingService extends BaseService<Setting> implements ISettingService {

    @Autowired
    ISettingDao settingDao;

    @Override
    public void init() {
        setDao(settingDao);
    }
}
