package cn.windy.module.examination.service;

import cn.windy.module.examination.mybatis.model.DisRelationship;
import cn.windy.util.Pagination;

import java.util.List;
import java.util.Map;

public interface IDisRelationshipService {

    List<Map<String,Object>> findAll(Pagination page);

    int countAll();

    void add(DisRelationship disRelationship);

    void delete(String ids);

    DisRelationship findById(long id);

    void update(DisRelationship disRelationship);

    /**
     * 分销 上级
     * @param id
     * @param page
     * @return
     */
    List<Map<String,Object>> findSuperior(long id,Pagination page);

    /**
     * 分销下级
     * @param id
     * @param page
     * @return
     */
    List<Map<String,Object>> findSubordinate(long id,Pagination page);

}
