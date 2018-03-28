package cn.windy.module.examination.service.impl;

import cn.windy.module.examination.dao.DisRelationshipMapper;
import cn.windy.module.examination.mybatis.model.DisRelationship;
import cn.windy.module.examination.mybatis.model.DisRelationshipQuery;
import cn.windy.module.examination.service.IDisRelationshipService;
import cn.windy.util.Pagination;
import com.sun.corba.se.spi.ior.ObjectKey;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

@Service
public class DisRelationshipService implements IDisRelationshipService {

    @Autowired
    DisRelationshipMapper disRelationshipMapper;


    @Override
    public List<Map<String,Object>> findAll(Pagination page) {
        return disRelationshipMapper.findAll((page.getPage() - 1) * page.getPageSize(), page.getPageSize());
    }

    @Override
    public int countAll() {
        return disRelationshipMapper.countByExample(null);
    }

    @Override
    public void add(DisRelationship disRelationship) {
        disRelationshipMapper.insert(disRelationship);
    }

    @Override
    public void delete(String ids) {
        String[] strs = ids.split(",");
        List<Long> list = new ArrayList<>();
        for (String str : strs) {
            list.add(Long.valueOf(str));
        }

        DisRelationshipQuery disRelationshipQuery = new DisRelationshipQuery();
        DisRelationshipQuery.Criteria criteria = disRelationshipQuery.createCriteria();
        criteria.andIdIn(list);
        disRelationshipMapper.deleteByExample(disRelationshipQuery);
    }

    @Override
    public DisRelationship findById(long id) {
        return disRelationshipMapper.selectByPrimaryKey(id);
    }

    @Override
    public void update(DisRelationship disRelationship) {
        disRelationshipMapper.updateByPrimaryKeySelective(disRelationship);
    }

    /**
     * 分销 上级
     *
     * @param id
     * @param page
     * @return
     */
    @Override
    public List<Map<String, Object>> findSuperior(long id, Pagination page) {
        List<Map<String, Object>> list = disRelationshipMapper.findCurrentUser(id);
        List<Map<String, Object>> resultList = list;
        resultList.get(0).put("jibie", 0);
        SuperiorDiGui(list, 0, resultList);
        return resultList;
    }



    /**
     * 上级 循环
     *
     * @return
     */
    public String SuperiorDiGui(List<Map<String, Object>> list, Integer i, List<Map<String, Object>> resultList) {
        if (i != 4) {
            Integer p_mark = (Integer) list.get(0).get("p_mark");
            list.get(0).put("jibie", i);
            if (p_mark == 0) {
                if(resultList.size() != 1){
                    resultList.add(list.get(0));
                }
                return null;
            } else {
                if (i != 0) {
                    resultList.add(list.get(0));
                }
                List<Map<String, Object>> xunHuanList = disRelationshipMapper.findCurrentUser(p_mark);
                SuperiorDiGui(xunHuanList, i + 1, resultList);
            }
        }
        return null;
    }

    /**
     *分销下级
     * @param id
     * @param page
     * @return
     */
    @Override
    public List<Map<String, Object>> findSubordinate(long id, Pagination page) {
        return disRelationshipMapper.findSubordinate(id,(page.getPage() - 1) * page.getPageSize(), page.getPageSize());
    }


}
