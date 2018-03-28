package cn.windy.module.core.service.impl;

import cn.windy.module.core.dao.IBaseDao;
import cn.windy.module.core.hibernate.model.BaseModel;
import cn.windy.module.core.service.IBaseService;
import cn.windy.module.core.service.exception.ServiceException;
import cn.windy.util.Pagination;
import jodd.bean.BeanCopy;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;

/**
 * 请在所有查询方法上添加@Transactional(readOnly = true)。<br>
 * 注意：一定要实现init方法，并调用 setDao方法，否则将无法使用BaseService中的相关方法。<br>
 * find,count 两个方法只可以查询单表时使用，如果多表查询请使用hql,sql<br>
 * @author zhangzunwei:1760708176@qq.com
 * @param <T> 一般情况下为所有实现BaseModel类的实例
 */
public abstract class BaseService<T> implements IBaseService<T> {

    private IBaseDao baseDao;

    public void setDao(IBaseDao baseDao){
        this.baseDao = baseDao;
    }

    public abstract void init();

    public BaseModel add(BaseModel baseModel){
        checkDao();
        if(baseModel.getId() != null && baseModel.getId()>0){
            BaseModel baseModel1 = (BaseModel) baseDao.findById(baseModel.getId());
            BeanCopy.beans(baseModel,baseModel1).ignoreNulls(true).copy();
            baseDao.save(baseModel1);
            return baseModel1;
        }else{
            baseDao.save(baseModel);
        }
        return baseModel;
    }

    public void remove(BaseModel baseModel){
        checkDao();
        baseDao.delete(baseModel);
    }

    @Transactional(readOnly = true)
    public T findById(Serializable id){
        checkDao();
        return (T) baseDao.findById(id);
    }

    public void delete(String ids){
        checkDao();
        baseDao.delete(" id in ("+ids+") ");
    }

    @Transactional(readOnly = true)
    public List<T> findAll(Pagination page){
        checkDao();
        return baseDao.findAll(page);
    }

    @Transactional(readOnly = true)
    public Long countAll(){
        checkDao();
        return baseDao.countAll();
    }

    @Transactional(readOnly = true)
    public List<T> find(T t,Pagination page){
        checkDao();
        return baseDao.find(t,page);
    }

    @Transactional(readOnly = true)
    public Long count(T t){
        checkDao();
        return baseDao.count(t);
    }

    private void checkDao(){
        if(baseDao == null) {
            init();
            if(baseDao == null)
                throw new ServiceException();
        }
    }

}
