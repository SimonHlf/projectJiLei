package cn.windy.module.examination.service;

import java.util.List;
import java.util.Map;

import cn.windy.module.admin.dto.AnalysisDto;
import cn.windy.module.examination.mybatis.model.FrontUser;
import cn.windy.module.examination.mybatis.model.PaperRecord;
import cn.windy.module.examination.mybatis.model.WindyOrg;
import cn.windy.util.Pagination;

public interface PaperRecordService {

	List<WindyOrg> getWindyOrg();

	List<WindyOrg> getWindyOrgs(Long insId);

	List<FrontUser> getFrontUser(Long insId);

	

	Long getCount(Long userrId, String userName);

	List<Map<String, Object>> userRecordList(Long userrId, String userName, Pagination page);

	Map toDetail(Long recordId);

	List<AnalysisDto> getAll(Pagination page,List<Long> list);

	List<FrontUser> getUser(Long insId);

	List<FrontUser> getUserTwo(Long insId);

	PaperRecord getById(Long userRecordId);

	

	Map getshiti(Long paperCreatId, PaperRecord paperRecord);

	String getName(Long orgId);

	List<Map<String, Object>> getUserRecord(Long orgId, Long userId, Pagination page);
	
}
