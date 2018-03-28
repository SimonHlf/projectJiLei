package cn.windy.module.core.dao.impl;

import cn.windy.module.core.dao.IBaseDao;
import cn.windy.module.core.dao.bean.Where;
import cn.windy.module.core.hibernate.model.BaseModel;
import cn.windy.util.Pagination;
import cn.windy.util.StringUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;

import java.io.Serializable;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BaseDao<T> implements IBaseDao<T> {

    @Autowired
    HibernateTemplate hibernateTemplate;

    @Autowired
    public JdbcTemplate jdbcTemplate;

    Class<?> entityClass;

    {
        Type genType = getClass().getGenericSuperclass();
        Type[] params = ((ParameterizedType)genType).getActualTypeArguments();
        entityClass = (Class)params[0];
    }

    public T save(T t){
        hibernateTemplate.saveOrUpdate(t);
        return t;
    }

    @Override
    public T delete(T t) {
        hibernateTemplate.delete(t);
        return t;
    }

    @Override
    public T update(T t) {
        t = hibernateTemplate.merge(t);
        return t;
    }

    public T findById(Serializable id) {
        return (T) hibernateTemplate.get(entityClass,id);
    }

    @SuppressWarnings("unchecked")
    @Override
    public void delete(String ids) {
        final String hql = String.format("delete from %s where %s " ,entityClass.getSimpleName(), ids);
        hibernateTemplate.execute(new HibernateCallback() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException {
                Query<T> query = session.createQuery(hql);
                query.executeUpdate();
                return null;
            }
        });
    }

    @Override
    public void executeUpdate(final String hql, final int type) {
        hibernateTemplate.execute(new HibernateCallback() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException {
                Query query ;
                if(type == 1){
                    query = session.createQuery(hql);
                }else{
                    query = session.createNativeQuery(hql);
                }
                query.executeUpdate();
                return null;
            }
        });
    }


    public List<T> findAll(final Pagination page) {
        return hibernateTemplate.execute(new HibernateCallback<List<T>>() {
            @Override
            public List<T> doInHibernate(Session session) throws HibernateException {
                String hql = "from "+entityClass.getSimpleName();
                if(entityClass.getSuperclass().getSimpleName().equalsIgnoreCase("BaseModel")){
                    hql = hql + " order by id desc";
                }
                Query query = session.createQuery(hql);
                if(page != null ){
                    query.setMaxResults(page.getPageSize());
                    query.setFirstResult((page.getPage()-1)*page.getPageSize());
                }
                return query.list();
            }
        });
    }

    @Override
    public Long countAll() {
        final String hql = "select count(ent) from "+entityClass.getSimpleName() + " ent";
        return hibernateTemplate.execute(new HibernateCallback<Long>() {
            @Override
            public Long doInHibernate(Session session) throws HibernateException {
                Query query = session.createQuery(hql);
                return ((Long) query.uniqueResult());
            }
        });
    }

    @Override
    public List<?> findByHql(final String hql, final Pagination page, final Object... values) {
        return hibernateTemplate.execute(new HibernateCallback<List<?>>() {
            @Override
            public List<?> doInHibernate(Session session) throws HibernateException {
                Query query = session.createQuery(hql);
                for(int i=0;i<values.length;i++){
                    query.setParameter(i,values[i]);
                }
                if(page!=null) {
                    query.setMaxResults(page.getPageSize());
                    query.setFirstResult((page.getPage()-1)*page.getPageSize());
                }
                return query.list();
            }
        });
    }


    public List<?> findByHql(final String hql, final Map<String,Object> param,final Pagination page) {
        return hibernateTemplate.execute(new HibernateCallback<List<?>>() {
            @Override
            public List<?> doInHibernate(Session session) throws HibernateException {
                Query query = session.createQuery(hql);
                if(param!=null) query.setProperties(param);
                if(page!=null) {
                    query.setMaxResults(page.getPageSize());
                    query.setFirstResult((page.getPage()-1)*page.getPageSize());
                }
                return query.list();
            }
        });
    }

    @Override
    public Long countByHql(final String hql, final Map<String, Object> param) {
        return hibernateTemplate.execute(new HibernateCallback<Long>() {
            @Override
            public Long doInHibernate(Session session) throws HibernateException {
                Query query = session.createQuery(hql);
                if(param!=null) query.setProperties(param);
                return (Long) query.uniqueResult();
            }
        });
    }

    /**
     *
     * @param sql
     * @param param
     * @param page
     * @return 返回的每行数据都是一个数组
     */
    public List<Map<String,Object>> findBySql(final String sql, final Map<String, Object> param, final Pagination page) {

        return hibernateTemplate.execute(new HibernateCallback<List<Map<String,Object>>>() {
            @Override
            public List<Map<String,Object>> doInHibernate(Session session) throws HibernateException {
                Query query = session.createNativeQuery(sql);
                if(param!=null) query.setProperties(param);
                if(page!=null) {
                    query.setMaxResults(page.getPageSize());
                    query.setFirstResult((page.getPage()-1)*page.getPageSize());
                }
                query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
                return query.list();
            }
        });
    }

    @Override
    public Long countBySql(final String sql,final  Map<String, Object> param) {
        return hibernateTemplate.execute(new HibernateCallback<Long>() {

            public Long doInHibernate(Session session) throws HibernateException {
                Query query = session.createNativeQuery(sql);
                if(param!=null) query.setProperties(param);
                return (Long) query.uniqueResult();
            }
        });
    }

    public List<T> find(T t, Pagination page) {
        Where where = getWhere(t);
        String hql = "from " + t.getClass().getName() +" where 1=1 ";
        hql = hql + where.getWhere();
        if(t instanceof BaseModel){
            BaseModel model = (BaseModel)t;
            if(StringUtil.isBlank(model.getOrder()))
                hql = hql + " order by id desc";
            else
                hql = hql + model.getOrder();
        }
        return (List<T>) findByHql(hql,where.getParam(),page);
    }

    public Long count(T t){
        Where where = getWhere(t);
        String hql = "select count(t) from " + t.getClass().getName() +" t where 1=1 ";
        hql = hql + where.getWhere();

        return countByHql(hql,where.getParam());
    }


    private Where getWhere(T t){
        StringBuffer where = new StringBuffer();
        Map<String,Object> param = new HashMap<>();
        if(t instanceof BaseModel){
            Class<?> clazz = t.getClass();
            BaseModel model = (BaseModel)t;
            String condition = model.getCondition().replace("%s","");
            JSONArray jsonArray = JSON.parseArray(condition);
            if(jsonArray == null) return new Where(where.toString(),param);
            for (Object ja : jsonArray) {
                JSONObject object = (JSONObject) ja;
                String property = object.getString("property");
                String getMethod = StringUtil.getGetMethod(property);
                try {
                    Method method = clazz.getMethod(getMethod);
                    Object obj = method.invoke(t);
                    if(obj!=null){
                        where.append(" "+object.getString("relation")+" ");
                        where.append(" " + property);
                        if(object.getBoolean("isLike")){
                            where.append(" like :"+property);
                            param.put(property,"%"+obj.toString().trim()+"%");
                        }else{
                            where.append(" = :"+property);
                            param.put(property,obj);
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return new Where(where.toString(),param);
    }

}
