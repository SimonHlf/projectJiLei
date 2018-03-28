package cn.windy.module.admin.dao.impl;

import org.springframework.stereotype.Repository;

import cn.windy.module.admin.dao.IPhoneIdentyDao;
import cn.windy.module.admin.hibernate.model.PhoneIdenty;
import cn.windy.module.core.dao.impl.BaseDao;

@Repository
public class PhoneIdentyDao extends BaseDao<PhoneIdenty> implements IPhoneIdentyDao{

}
