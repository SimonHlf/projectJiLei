package cn.windy.module.admin.service;

import cn.windy.module.admin.hibernate.model.Item;
import cn.windy.module.core.service.IBaseService;

import java.util.List;

public interface IItemService extends IBaseService<Item> {

	List<Item> findByType(String type);

	Long findNumByType(String type);

	Item findByTypeAndCode(String type, String code);
	List<Item> findByTv(String value);
}
