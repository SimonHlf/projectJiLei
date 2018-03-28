package cn.windy.module.core.dao;

import cn.windy.util.Pagination;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface IBaseDao<T> {

    T save(T t);
    T delete(T t);
    T update(T t);

    T findById(Serializable id);

    void delete(String where);

    //type = 1 是hql，type=0 是sql
    void executeUpdate(String hql,int type);

    List<T> findAll(Pagination page);
    Long countAll();

    List<?> findByHql(String hql, Pagination page,Object... values);

    List<?> findByHql(String hql, Map<String, Object> param, Pagination page);
    Long countByHql(String hql, Map<String, Object> param);

    List<Map<String,Object>> findBySql(String sql, Map<String, Object> param, Pagination page);
    Long countBySql(String hql, Map<String, Object> param);

    List<T> find(T t, Pagination page);
    Long count(T t);
}
