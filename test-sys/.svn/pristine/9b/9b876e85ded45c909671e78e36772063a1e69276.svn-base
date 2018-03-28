package cn.windy.module.admin.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.windy.module.admin.dao.IPhoneIdentyDao;
import cn.windy.module.admin.hibernate.model.PhoneIdenty;
import cn.windy.module.admin.service.IPhoneIdentyService;
import cn.windy.module.core.service.impl.BaseService;

@Service("phoneIdentyService")
@Transactional(readOnly = true)
public class PhoneIdentyService extends BaseService<PhoneIdenty> implements IPhoneIdentyService {

	@Autowired
	IPhoneIdentyDao phoneIdentyDao;

	@Override
	@Transactional(readOnly = false)
	public void insertPhone(PhoneIdenty phoneIdenty) {
		Map<String, Object> map=new HashMap<>();
		String mobile=phoneIdenty.getMobile();
		String hql="from PhoneIdenty where mobile =:mobile";
		map.put("mobile", mobile);
		List<PhoneIdenty> list = (List<PhoneIdenty>)phoneIdentyDao.findByHql(hql, map, null);
		if(list != null && list.size() == 1){
			phoneIdentyDao.delete(" mobile in (" + phoneIdenty.getMobile() + ")");
		}
		phoneIdentyDao.save(phoneIdenty);
	}

	@Override
	public PhoneIdenty selectByPhone(String mobile) {
        String hql="from PhoneIdenty where mobile =:mobile";
        Map<String, Object> map=new HashMap<>();
        map.put("mobile", mobile);
		List<PhoneIdenty> list = (List<PhoneIdenty>)phoneIdentyDao.findByHql(hql, map, null);
		if(list != null && list.size() == 1){
			/*PhoneIdenty phoneIdenty=list.get(0);
			 phoneIdentyDao.delete(phoneIdenty);*/
			return list.get(0);
		}
	return null;
	
	}

	@Override
	public PhoneIdenty selectByPhoneCode(String mobile, String code) {
        String hql="from PhoneIdenty where mobile =:mobile and code =:code";
		Map<String, Object> map=new HashMap<>();
		map.put("mobile", mobile);
		map.put("code", code);
		List<PhoneIdenty> list=(List<PhoneIdenty>) phoneIdentyDao.findByHql(hql, map, null);
		if(list != null && list.size() == 1){
			return list.get(0);
		}
		return null ;
	}

	@Override
	public void init() {
	setDao(phoneIdentyDao);
		
	}


}
