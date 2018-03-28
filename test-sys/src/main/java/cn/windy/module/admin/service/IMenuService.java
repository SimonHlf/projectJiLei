package cn.windy.module.admin.service;

import cn.windy.module.admin.hibernate.model.Menu;
import cn.windy.module.core.service.IBaseService;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface IMenuService extends IBaseService<Menu> {

    List<Menu> findByPId(Long pid);

    List<Menu> findByUserIdAndPid(Long uid, Long pid);

    /**
     * 根据角色id来左链接查询菜单
     * @param rid
     * @return
     */
    List<Map<String,Object>> findMenusByRoleId(Serializable rid);

    void saveRolsMenus(Long rid,String mids);

}
