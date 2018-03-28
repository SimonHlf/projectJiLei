package cn.windy.module.examination.service;

import java.util.List;
import java.util.Map;

import cn.windy.util.Pagination;

public interface RecordService {

	List<Map<String, Object>> getRecord(String attr19,Long userId, String paperCreatName, Pagination page);

	Long getRecordCount(String attr19,Long userId, String paperCreatName);

	Map toDetail(Long recordId);
	
	
	
	
	
}
