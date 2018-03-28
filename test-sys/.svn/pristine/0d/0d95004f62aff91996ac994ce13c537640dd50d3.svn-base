package cn.windy.module.examination.service.impl;

import cn.windy.module.examination.dao.DisRateMapper;
import cn.windy.module.examination.mybatis.model.DisRate;
import cn.windy.module.examination.mybatis.model.DisRateQuery;
import cn.windy.module.examination.service.IDisRateService;
import cn.windy.util.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class DisRateService implements IDisRateService {

    @Autowired
    DisRateMapper disRateMapper;

    @Override
    public int add(DisRate disRate) {
        return disRateMapper.insert(disRate);
    }

    @Override
    public List<DisRate> findAll(Pagination page) {
        return disRateMapper.findAll((page.getPage() - 1) * page.getPageSize(), page.getPageSize());
    }

    @Override
    public long countAll() {
        int count = disRateMapper.countByExample(null);
        return (long)count;
    }


    @Override
    public void delete(String ids) {
        String[] strs = ids.split(",");
        List<Long> list = new ArrayList<>();
        for (String str : strs){
            list.add(Long.valueOf(str));
        }
        DisRateQuery disRateQuery = new DisRateQuery();
        DisRateQuery.Criteria criteria = disRateQuery.createCriteria();
        criteria.andIdIn(list);
        disRateMapper.deleteByExample(disRateQuery);
    }

    @Override
    public DisRate findById(Long id) {
        return disRateMapper.selectByPrimaryKey(id);
    }

    @Override
    public void update(DisRate disRate) {
        disRateMapper.updateByPrimaryKeySelective(disRate);
    }

    @Override
    public List<DisRate> searchDisRateName(String name) {
        return null;
    }
}
