package cn.windy.module.admin.service.impl;

import cn.windy.module.admin.dao.IItemDao;
import cn.windy.module.admin.hibernate.model.Item;
import cn.windy.module.admin.service.IItemService;
import cn.windy.module.core.service.impl.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ItemService extends BaseService<Item> implements IItemService {

    @Autowired
    IItemDao itemDao;

    @Override
    public void init() {
        setDao(itemDao);
    }

    @Transactional(readOnly = true)
    public List<Item> findByType(String type) {
        String hql = "from Item where type = ? ";
        return (List<Item>) itemDao.findByHql(hql,null,type);
    }

    @Transactional(readOnly = true)
    public Item findByTypeAndCode(String type, String code) {
        String hql = "from Item where type = ? and code = ? ";
        List<Item> list = (List<Item>) itemDao.findByHql(hql,null,type,code);
        return list.get(0);
    }

    @Transactional(readOnly = true)
	public Long findNumByType(String type) {
         String hql="select count(*) from Item where type =:type";
         Map<String, Object> map=new HashMap<>();
         map.put("type", type);
		return itemDao.countByHql(hql, map);
	}

	@Override
	public List<Item> findByTv(String value) {
       String hql="from Item where type =:type and value =:value";
       Map<String, Object> map=new HashMap<>();
       map.put("type", "expenseType");
       map.put("value", value);
		return (List<Item>) itemDao.findByHql(hql, map, null);
	}
}
