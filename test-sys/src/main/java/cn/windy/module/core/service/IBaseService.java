package cn.windy.module.core.service;

import cn.windy.module.core.hibernate.model.BaseModel;
import cn.windy.util.Pagination;

import java.io.Serializable;
import java.util.List;

public interface IBaseService<T> {

    BaseModel add(BaseModel baseModel);
    void remove(BaseModel baseModel);

    T findById(Serializable id);
    void delete(String ids);

    List<T> findAll(Pagination page);
    Long countAll();

    List<T> find(T t,Pagination page);
    Long count(T t);
}
