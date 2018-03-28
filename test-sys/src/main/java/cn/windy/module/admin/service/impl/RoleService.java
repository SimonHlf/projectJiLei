package cn.windy.module.admin.service.impl;

import cn.windy.module.admin.dao.IRoleDao;
import cn.windy.module.admin.dao.IUserDao;
import cn.windy.module.admin.dao.IUsersRolesDao;
import cn.windy.module.admin.hibernate.model.Role;
import cn.windy.module.admin.hibernate.model.RolesMenus;
import cn.windy.module.admin.hibernate.model.User;
import cn.windy.module.admin.hibernate.model.UsersRoles;
import cn.windy.module.admin.service.IRoleService;
import cn.windy.module.core.service.impl.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RoleService extends BaseService<Role> implements IRoleService {

    @Autowired
    IRoleDao roleDao;
    @Autowired
    IUsersRolesDao usersRolesDao;

    @Autowired
    IUserDao userDao;

    @Override
    public void init() {
        setDao(roleDao);
    }

    @Transactional(readOnly = true)
    public List<Role> findByUserId(Long uid) {
        String hql = "select r from Role r,UsersRoles ur where r.id = ur.rid and ur.uid = :uid";
        Map<String,Object> map = new HashMap<>();
        map.put("uid",uid);
        return (List<Role>) roleDao.findByHql(hql,map,null);
    }

	@Override
	public void saveUsersRols(Long rid, String userids,String zeroIds) {
		  String []uids = userids.split(",");
		  usersRolesDao.delete(" rid = "+rid+" and uid in ("+zeroIds+")");
	        for (String uid : uids) {
	            Long uid_ = Long.parseLong(uid);
	            if(uid_!=0){
	            	UsersRoles ur=new UsersRoles();
	                ur.setRid(rid);
	                ur.setUid(uid_);
	                usersRolesDao.save(ur);
	            }
	        }
		
	}


}
