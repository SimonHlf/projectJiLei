package cn.windy.module.admin.service.impl;

import cn.windy.module.admin.dao.IUserDao;
import cn.windy.module.admin.hibernate.model.User;
import cn.windy.module.admin.service.IUserService;
import cn.windy.module.core.service.impl.BaseService;
import cn.windy.util.DateUtil;
import cn.windy.util.Pagination;
import cn.windy.util.StringUtil;
import cn.windy.util.encrypt.MD5;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;


@Service
public class UserService extends BaseService<User> implements IUserService {

    @Autowired
    IUserDao userDao;

    @Override
    public void init() {
        setDao(userDao);
    }


    /**
     * 后台用户列表
     * @param page
     * @param orgId
     * @param userName
     * @return
     */
    @Transactional(readOnly = true)
    public List<Map<String, Object>> findAll(Pagination page, Long orgId, String userName,int cmd) {
        Map<String,Object> param = new HashMap<>();
        String sql = "select ";
        if(cmd == 1){
            sql += " count(*) TOTAL ";
        } else {
            sql += " wu.*,wo.name orgName,IFNULL(wr.name,'') roleName ";
        }
        sql += "from windy_user wu left join windy_org wo " +
                " on wu.update_user = wo.id LEFT JOIN windy_users_roles wur ON " +
                "  wu.id = wur.uid LEFT JOIN windy_role wr ON wur.rid = wr.id ";

        if(orgId != null && orgId != 0){
            sql += " where wu.update_user = :orgId ";
            param.put("orgId",orgId);
        }

        if(!StringUtil.isBlank(userName)){
            if(userName.indexOf("where") != -1){
                sql += " and wu.name like :userName ";
            } else {
                sql += " where wu.name like :userName ";
            }
            param.put("userName",'%'+userName+'%');
        }
        return userDao.findBySql(sql,param,page);
    }

    @Transactional(readOnly = true)
    public User login(String account, String password) {
        User user;
        String hql = " from User where 1=1 ";
        if(account.indexOf("@")!=-1){//使用邮箱登录
            hql = hql + " and email = :account";
        }else if(StringUtil.isNumber(account)){ //以手机号
            hql = hql + " and mobile = :account";
        }else{ //以账号登录
            hql = hql + " and account = :account";
        }
        Map<String,Object> param = new HashMap<>();
        param.put("account",account);
        List<User> list = (List<User>) userDao.findByHql(hql,param,null);
        if(list!=null && list.size()>0){//才有可能登录成功
            user = list.get(0);//因为账号、邮箱、手机号都必须唯一
            if(user.getIsEncrypt().equals("1")){//密码加密
                if(user.getPassword().equals(MD5.encode(password))){
                    user.setResultState(true);
                    user.setResultInfo("登录成功");
                }else{
                    user.setResultState(false);
                    user.setResultInfo("密码错误！");
                }
            }else{
                if(user.getPassword().equals(password)){
                    user.setResultState(true);
                    user.setResultInfo("登录成功");
                }else{
                    user.setResultState(false);
                    user.setResultInfo("密码错误！");
                }
            }
        }else{ //账号错误
            user = new User();
            user.setResultState(false);
            user.setResultInfo("账号错误！");
        }
        return user;
    }


    @Transactional(readOnly = true)
	public List<Map<String, Object>> findUserByRoleId(Long rid) {
         String sql=" SELECT wu.id,wu.name,wur.rid FROM windy_user wu LEFT JOIN windy_users_roles wur ON wu.id =wur.uid AND wur.rid =:rid";
         Map<String, Object> map=new HashMap<>();
         map.put("rid", rid);
		return userDao.findBySql(sql, map, null);
	}


    @Transactional(readOnly = true)
	public List<User> findByCid(Long cid) {
		String hql="from User where addUser =:cid";
        Map<String, Object> map=new HashMap<>();
        map.put("cid", cid);
		return (List<User>) userDao.findByHql(hql, map, null);
	}


	@Override
	public List<User> findByCode() {
        String hql="from User where code =:code";
        Map<String, Object> map=new HashMap<>();
        map.put("code", "user");
		return (List<User>) userDao.findByHql(hql, map, null);
	}


	@Override
	public List<Map<String, Object>> findByOid(Long oid, Pagination page) {
        /* String sql="SELECT * FROM windy_user wu LEFT JOIN windy_orgs_users wou ON wu.id = wou.uid WHERE oid =:oid";*/
		String sql="SELECT * FROM windy_user WHERE update_user =:oid";
         Map<String, Object> map=new HashMap<>();
         map.put("oid", oid);
		return userDao.findBySql(sql, map, page);
	}


	@Override
	public int findNumByOid(Long oid) {
      /* String sql="SELECT * FROM windy_user wu LEFT JOIN windy_orgs_users wou ON wu.id = wou.uid WHERE oid =:oid";*/
		String sql="SELECT * FROM windy_user WHERE update_user =:oid";
		Map<String, Object> map=new HashMap<>();
		map.put("oid", oid);
       return userDao.findBySql(sql, map, null).size();
	}


    @Transactional(readOnly = true)
    public List<Map<String,Object>> findRelationUser(Long orgId,Long rid) {
        String sql = " SELECT wu.*,wo.name orgName,IFNULL(rid,0) rid FROM windy_user wu LEFT JOIN " +
                " windy_org wo ON wu.update_user = wo.id " +
                " LEFT JOIN windy_users_roles wur ON wu.id = wur.uid AND wur.rid = :rid" +
                " WHERE wu.update_user = :orgId ";
        Map<String,Object> param = new HashMap<>();
        param.put("orgId",orgId);
        param.put("rid",rid);
        return userDao.findBySql(sql,param,null);
    }

    @Transactional(readOnly = true)
    public List<Map<String, Object>> findZtreeUserByOrgId(Pagination page, Long orgId, int bs) {
        String sql = "select ";
        if(bs == 1){
            sql += "count(*) TOTAL ";
        } else {
            sql += " wu.*,IFNULL(wr.name,'') roleName,wo.name orgName ";
        }
        sql += "FROM\n" +
                "  windy_user wu\n" +
                "  LEFT JOIN windy_users_roles wur\n" +
                "  ON wu.id = wur.uid\n" +
                "  LEFT JOIN windy_role wr\n" +
                "    ON wur.rid = wr.id\n" +
                "  LEFT JOIN windy_org wo\n" +
                "    ON wu.update_user = wo.id\n" +
                "  WHERE wu.update_user = :orgId";
        Map<String,Object> param = new HashMap<>();
        param.put("orgId",orgId);
        return userDao.findBySql(sql,param,page);
    }

    @Override
    public Map<String, Object> updateThisPassword(String password, String newPassword, Long id) {
        Map<String,Object> map = new HashMap<>();
        User user = findById(id);
        if(user.getPassword().equals(password)){
            user.setPassword(newPassword);
            add(user);
            map.put("result","true");
        } else {
            map.put("result","false");
        }
        return map;
    }


    /**
     * 后台柱状图
     * @return
     */
    @Override
    @Transactional(readOnly = true)
    public List<Map<String,Object>> findDocBar(Long orgId) {
        String sql = "SELECT IFNULL(ept.totalPeople,0) totalPeople,IFNULL(prp.passPeople,0)passPeople,ex.* " +
                "FROM exam_personnel ep " +
                "LEFT JOIN (SELECT COUNT(*) totalPeople,ep.exam_id FROM exam_personnel ep GROUP BY exam_id) ept " +
                "ON ep.exam_id = ept.exam_id " +
                "LEFT JOIN (SELECT COUNT(prn.userId) passPeople,prn.attr10 FROM(SELECT DISTINCT pr.userId,pr.attr10 FROM paper_record pr WHERE pr.attr6 = 1) prn GROUP BY prn.attr10) prp " +
                "ON ep.exam_id = prp.attr10 " +
                "LEFT JOIN examination ex ON ex.id = ep.exam_id ";
        if(orgId != 0){
            sql += "WHERE ex.org_id = "+orgId;
        }
            sql += " GROUP BY ep.exam_id ORDER BY ex.id DESC ";
        Pagination page = new Pagination();
        page.setPageSize(7);
        return this.userDao.findBySql(sql,null,page);
    }

    /**
     * 后台饼状图 1及格 0不及格
     * @return
     */
    @Override
    @Transactional(readOnly = true)
    public List<Integer> findDocPie(Long orgId) {
    	List<Integer> list = new ArrayList<>();
    	Integer attr10 = null;
    	for (int i = 0; i <= 1; i++) {
    		String msg = i == 1 ? "pass" : "fail";
	        String sql = "SELECT COUNT(p.id) "+msg+" FROM paper_record p WHERE TYPE=1 and attr6 = "+i;
	        if(orgId != null && orgId != 0){
	            sql += " AND org_id = "+orgId;
	        }   
	        if(attr10==null){
	        	attr10 = findByExamination(orgId);
	        }
	        sql += " AND attr10="+attr10;
	        try {
	            List<Map<String,Object>> mapList = this.userDao.findBySql(sql,null,null);
	        	BigInteger bi = (BigInteger) mapList.get(0).get(msg);
	        	list.add(bi.intValue());
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		}
        return list;
    }

    /**
     * 后台折线图
     * @return
     */
    @Override
    public List<Map<String, Object>> findDocLine(Long orgId) {
        String sql = "SELECT IFNULL(prp.excellentPeople,0)excellentPeople,ex.* " +
                "FROM exam_personnel ep " +
                "LEFT JOIN (SELECT COUNT(*) excellentPeople, prn.attr10 FROM(SELECT pr.attr5 * 0.8 Score,pr.* FROM paper_record pr) prn WHERE prn.fen >= prn.Score GROUP BY prn.attr10) prp " +
                "ON ep.exam_id = prp.attr10 " +
                "LEFT JOIN examination ex ON ep.exam_id = ex.id ";
        if(orgId != 0){
            sql += " WHERE ex.org_id = "+orgId;
        }
            sql += " GROUP BY ep.exam_id " +
                " ORDER BY ex.id DESC ";
        Pagination page = new Pagination();
        page.setPageSize(7);
        return userDao.findBySql(sql,null,page);
    }

    /**
     * 后台即将开始的考试
     * @param orgId
     * @return
     */
    @Override
    @Transactional(readOnly = true)
    public List<Map<String, Object>> findSoomStartExam(Long orgId) {
        String sql = "SELECT ex.*,IFNULL(epAnswer.AnswerTOTAL,0)AnswerTOTAL,wo.name orgName,pc.name creatName " +
                "FROM examination ex LEFT JOIN " +
                "(SELECT COUNT(*) AnswerTOTAL,ep.exam_id " +
                "FROM exam_personnel ep GROUP BY ep.exam_id) epAnswer " +
                "ON ex.id = epAnswer.exam_id LEFT JOIN windy_org wo " +
                "ON ex.org_id = wo.id LEFT JOIN paper_creat pc ON ex.creat_id = pc.id " +
                "WHERE TO_DAYS(NOW()) - TO_DAYS(ex.start_time) >= 0 " +
                "AND TO_DAYS(ex.end_time) - TO_DAYS(NOW())  >=  0 ";
        if(orgId != 0){
            sql += " AND ex.org_id = "+orgId;
        }
        sql+=" order by ex.id desc";
        return userDao.findBySql(sql,null,null);
    }

    /**
     * 获取本机构所有的考试记录并随机获取一条
     * @param orgId
     * @return
     */
    public Integer findByExamination(Long orgId){
    	List<String> ids = new ArrayList<String>();
    	String sql = "select attr10 from paper_record p where 1=1 ";
    	if(orgId!=null && !"".equals(orgId) && orgId!=0L){
    		 sql += " AND org_id="+orgId;
    	}
    	sql += " group by attr10";
    	List<Map<String,Object>> mapList = this.userDao.findBySql(sql,null,null);
    	if(mapList!=null && mapList.size()>0){
        	for (int i = 0; i < mapList.size(); i++) {
    			if(mapList.get(i).get("attr10")!=null){
    				ids.add(mapList.get(i).get("attr10").toString());
    			}
    		}
        	int index=(int)(Math.random()*ids.size());
        	return Integer.parseInt(ids.get(index));
    	}else{
    		return 0;
    	}
    	
    }
    
}
