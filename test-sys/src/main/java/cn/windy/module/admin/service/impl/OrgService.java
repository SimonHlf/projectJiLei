package cn.windy.module.admin.service.impl;

import cn.windy.module.admin.dao.IOrgDao;
import cn.windy.module.admin.hibernate.model.Org;
import cn.windy.module.admin.service.IOrgService;
import cn.windy.module.core.service.impl.BaseService;

import cn.windy.util.Pagination;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class OrgService extends BaseService<Org> implements IOrgService {

    @Autowired
    IOrgDao orgDao;

    @Override
    public void init() {
        setDao(orgDao);
    }

    /**
     * 获取当前登陆角色的组织
     * @param orgId
     * @return
     */
    @Override
    @Transactional(readOnly = true)
    public List<Org> findThisOrgRole(Long orgId) {
        String hql = "from Org where id = :orgId";
        Map<String,Object> param = new HashMap<>();
        param.put("orgId",orgId);
        return (List<Org>) orgDao.findByHql(hql,param,null);
    }

	@Override
	public List<Org> findByChild(Long id) {
		String hql = "from Org where pid=?";
		return (List<Org>) orgDao.findByHql(hql, null, id);
	}



}
