package cn.windy.module.admin.dao.impl;

import cn.windy.module.admin.dao.IItemDao;
import cn.windy.module.admin.hibernate.model.Item;
import cn.windy.module.core.dao.impl.BaseDao;
import org.springframework.stereotype.Repository;

@Repository
public class ItemDao extends BaseDao<Item> implements IItemDao {
}
