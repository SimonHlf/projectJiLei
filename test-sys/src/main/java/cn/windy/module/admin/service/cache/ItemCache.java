package cn.windy.module.admin.service.cache;

import cn.windy.annotation.Cache;
import cn.windy.module.admin.hibernate.model.Item;
import cn.windy.module.admin.service.IItemService;
import cn.windy.util.spring.SpringUtil;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Cache
public class ItemCache {

    static IItemService itemService = SpringUtil.getBean("itemService");
    private static Map<String,List<Item>> map = new HashMap<>();

    public static void put(String key, List<Item> itemList) {
        map.put(key,itemList);
    }

    public static List<Item> get(String key) {
        List<Item> list = map.get(key);
        if(list==null || list.size()==0){
            list = itemService.findByType(key);
            map.put(key,list);
        }
        return list;
    }

    public static void remove(String key) {
        map.remove(key);
    }

    public static void clear(){
        map.clear();
    }

}
