package cn.windy.module.examination.service;

import java.util.Map;

import cn.windy.module.examination.mybatis.model.PaperSet;

public interface PaperSetService {

	Map paperSetList(Long paperId);
	
	void add(PaperSet paperSet,String paperids,String oneslects,String towslects,String judges,String res,Long paperCreatId);
	
	void delet(String ids);
	
	PaperSet getByPaperCreatId(Long id);
	
	void update(PaperSet paperSet,String paperids,String oneslects,String towslects,String judges,Long paperCreatId);

	void addNotSet(PaperSet paperSet, String res, Long paperCreatId);
	
	
}
