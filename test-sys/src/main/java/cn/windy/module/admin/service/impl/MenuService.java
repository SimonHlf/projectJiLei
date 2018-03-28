package cn.windy.module.admin.service.impl;

import cn.windy.module.admin.dao.IMenuDao;
import cn.windy.module.admin.dao.IRolesMenusDao;
import cn.windy.module.admin.hibernate.model.Menu;
import cn.windy.module.admin.hibernate.model.RolesMenus;
import cn.windy.module.admin.service.IMenuService;
import cn.windy.module.core.service.impl.BaseService;
import cn.windy.util.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MenuService extends BaseService<Menu> implements IMenuService {

    @Autowired
    IMenuDao menuDao;
    @Autowired
    IRolesMenusDao rolesMenusDao;

    @Override
    public void init() {
        setDao(menuDao);
    }

    @Transactional(readOnly = true)
    public List<Menu> findByPId(Long pid) {
        String hql="from Menu where pid =:pid";
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("pid",pid);
        return (List<Menu>) menuDao.findByHql(hql, params,new Pagination());
    }

    @Transactional(readOnly = true)
    public List<Menu> findByUserIdAndPid(Long uid, Long pid) {
        String hql = "SELECT distinct m FROM Menu m, RolesMenus rm, UsersRoles ur " +
                " WHERE m.id = rm.mid  AND rm.rid = ur.rid  " +
                " AND ur.uid = :uid  AND m.flag = 1 and m.pid=:pid ORDER BY id DESC";
        Map<String,Object> map = new HashMap<>();
        map.put("uid",uid);
        map.put("pid",pid);
        return (List<Menu>) menuDao.findByHql(hql,map,null);
    }

    @Transactional(readOnly = true)
    public List<Map<String, Object>> findMenusByRoleId(Serializable rid) {
        String sql = "select wm.id,wm.pid,wm.name,wrm.rid from windy_menu wm left join windy_roles_menus wrm " +
                "on wm.id = wrm.mid and wrm.rid=:rid";
        Map<String,Object> param = new HashMap<>();
        param.put("rid",rid);
        List<Map<String,Object>> list = menuDao.findBySql(sql,param,null);
        return list;
    }

    public void saveRolsMenus(Long rid,String menuids){
        String []mids = menuids.split(",");
        rolesMenusDao.delete(" rid = "+rid);
        for (String mid : mids) {
            Long mid_ = Long.parseLong(mid);
            if(mid_!=0){
                RolesMenus rm = new RolesMenus();
                rm.setRid(rid);
                rm.setMid(mid_);
                rolesMenusDao.save(rm);
            }
        }
    }
}
