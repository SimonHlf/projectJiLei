package cn.windy.module.examination.mybatis.model;

import java.util.ArrayList;
import java.util.List;

public class ExamineeInformationQuery {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    protected Integer pageNo = 1;

    protected Integer startRow;

    protected Integer pageSize = 10;

    protected String fields;

    public ExamineeInformationQuery() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    public void setPageNo(Integer pageNo) {
        this.pageNo=pageNo;
        this.startRow = (pageNo-1)*this.pageSize;
    }

    public Integer getPageNo() {
        return pageNo;
    }

    public void setStartRow(Integer startRow) {
        this.startRow=startRow;
    }

    public Integer getStartRow() {
        return startRow;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize=pageSize;
        this.startRow = (pageNo-1)*this.pageSize;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setFields(String fields) {
        this.fields=fields;
    }

    public String getFields() {
        return fields;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Long value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Long value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Long value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Long value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Long value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Long value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Long> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Long> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Long value1, Long value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Long value1, Long value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andExNameIsNull() {
            addCriterion("ex_name is null");
            return (Criteria) this;
        }

        public Criteria andExNameIsNotNull() {
            addCriterion("ex_name is not null");
            return (Criteria) this;
        }

        public Criteria andExNameEqualTo(String value) {
            addCriterion("ex_name =", value, "exName");
            return (Criteria) this;
        }

        public Criteria andExNameNotEqualTo(String value) {
            addCriterion("ex_name <>", value, "exName");
            return (Criteria) this;
        }

        public Criteria andExNameGreaterThan(String value) {
            addCriterion("ex_name >", value, "exName");
            return (Criteria) this;
        }

        public Criteria andExNameGreaterThanOrEqualTo(String value) {
            addCriterion("ex_name >=", value, "exName");
            return (Criteria) this;
        }

        public Criteria andExNameLessThan(String value) {
            addCriterion("ex_name <", value, "exName");
            return (Criteria) this;
        }

        public Criteria andExNameLessThanOrEqualTo(String value) {
            addCriterion("ex_name <=", value, "exName");
            return (Criteria) this;
        }

        public Criteria andExNameLike(String value) {
            addCriterion("ex_name like", value, "exName");
            return (Criteria) this;
        }

        public Criteria andExNameNotLike(String value) {
            addCriterion("ex_name not like", value, "exName");
            return (Criteria) this;
        }

        public Criteria andExNameIn(List<String> values) {
            addCriterion("ex_name in", values, "exName");
            return (Criteria) this;
        }

        public Criteria andExNameNotIn(List<String> values) {
            addCriterion("ex_name not in", values, "exName");
            return (Criteria) this;
        }

        public Criteria andExNameBetween(String value1, String value2) {
            addCriterion("ex_name between", value1, value2, "exName");
            return (Criteria) this;
        }

        public Criteria andExNameNotBetween(String value1, String value2) {
            addCriterion("ex_name not between", value1, value2, "exName");
            return (Criteria) this;
        }

        public Criteria andExGenderIsNull() {
            addCriterion("ex_gender is null");
            return (Criteria) this;
        }

        public Criteria andExGenderIsNotNull() {
            addCriterion("ex_gender is not null");
            return (Criteria) this;
        }

        public Criteria andExGenderEqualTo(String value) {
            addCriterion("ex_gender =", value, "exGender");
            return (Criteria) this;
        }

        public Criteria andExGenderNotEqualTo(String value) {
            addCriterion("ex_gender <>", value, "exGender");
            return (Criteria) this;
        }

        public Criteria andExGenderGreaterThan(String value) {
            addCriterion("ex_gender >", value, "exGender");
            return (Criteria) this;
        }

        public Criteria andExGenderGreaterThanOrEqualTo(String value) {
            addCriterion("ex_gender >=", value, "exGender");
            return (Criteria) this;
        }

        public Criteria andExGenderLessThan(String value) {
            addCriterion("ex_gender <", value, "exGender");
            return (Criteria) this;
        }

        public Criteria andExGenderLessThanOrEqualTo(String value) {
            addCriterion("ex_gender <=", value, "exGender");
            return (Criteria) this;
        }

        public Criteria andExGenderLike(String value) {
            addCriterion("ex_gender like", value, "exGender");
            return (Criteria) this;
        }

        public Criteria andExGenderNotLike(String value) {
            addCriterion("ex_gender not like", value, "exGender");
            return (Criteria) this;
        }

        public Criteria andExGenderIn(List<String> values) {
            addCriterion("ex_gender in", values, "exGender");
            return (Criteria) this;
        }

        public Criteria andExGenderNotIn(List<String> values) {
            addCriterion("ex_gender not in", values, "exGender");
            return (Criteria) this;
        }

        public Criteria andExGenderBetween(String value1, String value2) {
            addCriterion("ex_gender between", value1, value2, "exGender");
            return (Criteria) this;
        }

        public Criteria andExGenderNotBetween(String value1, String value2) {
            addCriterion("ex_gender not between", value1, value2, "exGender");
            return (Criteria) this;
        }

        public Criteria andExAgeIsNull() {
            addCriterion("ex_age is null");
            return (Criteria) this;
        }

        public Criteria andExAgeIsNotNull() {
            addCriterion("ex_age is not null");
            return (Criteria) this;
        }

        public Criteria andExAgeEqualTo(Integer value) {
            addCriterion("ex_age =", value, "exAge");
            return (Criteria) this;
        }

        public Criteria andExAgeNotEqualTo(Integer value) {
            addCriterion("ex_age <>", value, "exAge");
            return (Criteria) this;
        }

        public Criteria andExAgeGreaterThan(Integer value) {
            addCriterion("ex_age >", value, "exAge");
            return (Criteria) this;
        }

        public Criteria andExAgeGreaterThanOrEqualTo(Integer value) {
            addCriterion("ex_age >=", value, "exAge");
            return (Criteria) this;
        }

        public Criteria andExAgeLessThan(Integer value) {
            addCriterion("ex_age <", value, "exAge");
            return (Criteria) this;
        }

        public Criteria andExAgeLessThanOrEqualTo(Integer value) {
            addCriterion("ex_age <=", value, "exAge");
            return (Criteria) this;
        }

        public Criteria andExAgeIn(List<Integer> values) {
            addCriterion("ex_age in", values, "exAge");
            return (Criteria) this;
        }

        public Criteria andExAgeNotIn(List<Integer> values) {
            addCriterion("ex_age not in", values, "exAge");
            return (Criteria) this;
        }

        public Criteria andExAgeBetween(Integer value1, Integer value2) {
            addCriterion("ex_age between", value1, value2, "exAge");
            return (Criteria) this;
        }

        public Criteria andExAgeNotBetween(Integer value1, Integer value2) {
            addCriterion("ex_age not between", value1, value2, "exAge");
            return (Criteria) this;
        }

        public Criteria andExNumIsNull() {
            addCriterion("ex_num is null");
            return (Criteria) this;
        }

        public Criteria andExNumIsNotNull() {
            addCriterion("ex_num is not null");
            return (Criteria) this;
        }

        public Criteria andExNumEqualTo(Long value) {
            addCriterion("ex_num =", value, "exNum");
            return (Criteria) this;
        }

        public Criteria andExNumNotEqualTo(Long value) {
            addCriterion("ex_num <>", value, "exNum");
            return (Criteria) this;
        }

        public Criteria andExNumGreaterThan(Long value) {
            addCriterion("ex_num >", value, "exNum");
            return (Criteria) this;
        }

        public Criteria andExNumGreaterThanOrEqualTo(Long value) {
            addCriterion("ex_num >=", value, "exNum");
            return (Criteria) this;
        }

        public Criteria andExNumLessThan(Long value) {
            addCriterion("ex_num <", value, "exNum");
            return (Criteria) this;
        }

        public Criteria andExNumLessThanOrEqualTo(Long value) {
            addCriterion("ex_num <=", value, "exNum");
            return (Criteria) this;
        }

        public Criteria andExNumIn(List<Long> values) {
            addCriterion("ex_num in", values, "exNum");
            return (Criteria) this;
        }

        public Criteria andExNumNotIn(List<Long> values) {
            addCriterion("ex_num not in", values, "exNum");
            return (Criteria) this;
        }

        public Criteria andExNumBetween(Long value1, Long value2) {
            addCriterion("ex_num between", value1, value2, "exNum");
            return (Criteria) this;
        }

        public Criteria andExNumNotBetween(Long value1, Long value2) {
            addCriterion("ex_num not between", value1, value2, "exNum");
            return (Criteria) this;
        }

        public Criteria andExInformationIsNull() {
            addCriterion("ex_information is null");
            return (Criteria) this;
        }

        public Criteria andExInformationIsNotNull() {
            addCriterion("ex_information is not null");
            return (Criteria) this;
        }

        public Criteria andExInformationEqualTo(String value) {
            addCriterion("ex_information =", value, "exInformation");
            return (Criteria) this;
        }

        public Criteria andExInformationNotEqualTo(String value) {
            addCriterion("ex_information <>", value, "exInformation");
            return (Criteria) this;
        }

        public Criteria andExInformationGreaterThan(String value) {
            addCriterion("ex_information >", value, "exInformation");
            return (Criteria) this;
        }

        public Criteria andExInformationGreaterThanOrEqualTo(String value) {
            addCriterion("ex_information >=", value, "exInformation");
            return (Criteria) this;
        }

        public Criteria andExInformationLessThan(String value) {
            addCriterion("ex_information <", value, "exInformation");
            return (Criteria) this;
        }

        public Criteria andExInformationLessThanOrEqualTo(String value) {
            addCriterion("ex_information <=", value, "exInformation");
            return (Criteria) this;
        }

        public Criteria andExInformationLike(String value) {
            addCriterion("ex_information like", value, "exInformation");
            return (Criteria) this;
        }

        public Criteria andExInformationNotLike(String value) {
            addCriterion("ex_information not like", value, "exInformation");
            return (Criteria) this;
        }

        public Criteria andExInformationIn(List<String> values) {
            addCriterion("ex_information in", values, "exInformation");
            return (Criteria) this;
        }

        public Criteria andExInformationNotIn(List<String> values) {
            addCriterion("ex_information not in", values, "exInformation");
            return (Criteria) this;
        }

        public Criteria andExInformationBetween(String value1, String value2) {
            addCriterion("ex_information between", value1, value2, "exInformation");
            return (Criteria) this;
        }

        public Criteria andExInformationNotBetween(String value1, String value2) {
            addCriterion("ex_information not between", value1, value2, "exInformation");
            return (Criteria) this;
        }

        public Criteria andExPictureIsNull() {
            addCriterion("ex_picture is null");
            return (Criteria) this;
        }

        public Criteria andExPictureIsNotNull() {
            addCriterion("ex_picture is not null");
            return (Criteria) this;
        }

        public Criteria andExPictureEqualTo(String value) {
            addCriterion("ex_picture =", value, "exPicture");
            return (Criteria) this;
        }

        public Criteria andExPictureNotEqualTo(String value) {
            addCriterion("ex_picture <>", value, "exPicture");
            return (Criteria) this;
        }

        public Criteria andExPictureGreaterThan(String value) {
            addCriterion("ex_picture >", value, "exPicture");
            return (Criteria) this;
        }

        public Criteria andExPictureGreaterThanOrEqualTo(String value) {
            addCriterion("ex_picture >=", value, "exPicture");
            return (Criteria) this;
        }

        public Criteria andExPictureLessThan(String value) {
            addCriterion("ex_picture <", value, "exPicture");
            return (Criteria) this;
        }

        public Criteria andExPictureLessThanOrEqualTo(String value) {
            addCriterion("ex_picture <=", value, "exPicture");
            return (Criteria) this;
        }

        public Criteria andExPictureLike(String value) {
            addCriterion("ex_picture like", value, "exPicture");
            return (Criteria) this;
        }

        public Criteria andExPictureNotLike(String value) {
            addCriterion("ex_picture not like", value, "exPicture");
            return (Criteria) this;
        }

        public Criteria andExPictureIn(List<String> values) {
            addCriterion("ex_picture in", values, "exPicture");
            return (Criteria) this;
        }

        public Criteria andExPictureNotIn(List<String> values) {
            addCriterion("ex_picture not in", values, "exPicture");
            return (Criteria) this;
        }

        public Criteria andExPictureBetween(String value1, String value2) {
            addCriterion("ex_picture between", value1, value2, "exPicture");
            return (Criteria) this;
        }

        public Criteria andExPictureNotBetween(String value1, String value2) {
            addCriterion("ex_picture not between", value1, value2, "exPicture");
            return (Criteria) this;
        }

        public Criteria andExTypeIsNull() {
            addCriterion("ex_type is null");
            return (Criteria) this;
        }

        public Criteria andExTypeIsNotNull() {
            addCriterion("ex_type is not null");
            return (Criteria) this;
        }

        public Criteria andExTypeEqualTo(Integer value) {
            addCriterion("ex_type =", value, "exType");
            return (Criteria) this;
        }

        public Criteria andExTypeNotEqualTo(Integer value) {
            addCriterion("ex_type <>", value, "exType");
            return (Criteria) this;
        }

        public Criteria andExTypeGreaterThan(Integer value) {
            addCriterion("ex_type >", value, "exType");
            return (Criteria) this;
        }

        public Criteria andExTypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("ex_type >=", value, "exType");
            return (Criteria) this;
        }

        public Criteria andExTypeLessThan(Integer value) {
            addCriterion("ex_type <", value, "exType");
            return (Criteria) this;
        }

        public Criteria andExTypeLessThanOrEqualTo(Integer value) {
            addCriterion("ex_type <=", value, "exType");
            return (Criteria) this;
        }

        public Criteria andExTypeIn(List<Integer> values) {
            addCriterion("ex_type in", values, "exType");
            return (Criteria) this;
        }

        public Criteria andExTypeNotIn(List<Integer> values) {
            addCriterion("ex_type not in", values, "exType");
            return (Criteria) this;
        }

        public Criteria andExTypeBetween(Integer value1, Integer value2) {
            addCriterion("ex_type between", value1, value2, "exType");
            return (Criteria) this;
        }

        public Criteria andExTypeNotBetween(Integer value1, Integer value2) {
            addCriterion("ex_type not between", value1, value2, "exType");
            return (Criteria) this;
        }

        public Criteria andExStateIsNull() {
            addCriterion("ex_state is null");
            return (Criteria) this;
        }

        public Criteria andExStateIsNotNull() {
            addCriterion("ex_state is not null");
            return (Criteria) this;
        }

        public Criteria andExStateEqualTo(Integer value) {
            addCriterion("ex_state =", value, "exState");
            return (Criteria) this;
        }

        public Criteria andExStateNotEqualTo(Integer value) {
            addCriterion("ex_state <>", value, "exState");
            return (Criteria) this;
        }

        public Criteria andExStateGreaterThan(Integer value) {
            addCriterion("ex_state >", value, "exState");
            return (Criteria) this;
        }

        public Criteria andExStateGreaterThanOrEqualTo(Integer value) {
            addCriterion("ex_state >=", value, "exState");
            return (Criteria) this;
        }

        public Criteria andExStateLessThan(Integer value) {
            addCriterion("ex_state <", value, "exState");
            return (Criteria) this;
        }

        public Criteria andExStateLessThanOrEqualTo(Integer value) {
            addCriterion("ex_state <=", value, "exState");
            return (Criteria) this;
        }

        public Criteria andExStateIn(List<Integer> values) {
            addCriterion("ex_state in", values, "exState");
            return (Criteria) this;
        }

        public Criteria andExStateNotIn(List<Integer> values) {
            addCriterion("ex_state not in", values, "exState");
            return (Criteria) this;
        }

        public Criteria andExStateBetween(Integer value1, Integer value2) {
            addCriterion("ex_state between", value1, value2, "exState");
            return (Criteria) this;
        }

        public Criteria andExStateNotBetween(Integer value1, Integer value2) {
            addCriterion("ex_state not between", value1, value2, "exState");
            return (Criteria) this;
        }

        public Criteria andExOrgIdIsNull() {
            addCriterion("ex_org_id is null");
            return (Criteria) this;
        }

        public Criteria andExOrgIdIsNotNull() {
            addCriterion("ex_org_id is not null");
            return (Criteria) this;
        }

        public Criteria andExOrgIdEqualTo(Long value) {
            addCriterion("ex_org_id =", value, "exOrgId");
            return (Criteria) this;
        }

        public Criteria andExOrgIdNotEqualTo(Long value) {
            addCriterion("ex_org_id <>", value, "exOrgId");
            return (Criteria) this;
        }

        public Criteria andExOrgIdGreaterThan(Long value) {
            addCriterion("ex_org_id >", value, "exOrgId");
            return (Criteria) this;
        }

        public Criteria andExOrgIdGreaterThanOrEqualTo(Long value) {
            addCriterion("ex_org_id >=", value, "exOrgId");
            return (Criteria) this;
        }

        public Criteria andExOrgIdLessThan(Long value) {
            addCriterion("ex_org_id <", value, "exOrgId");
            return (Criteria) this;
        }

        public Criteria andExOrgIdLessThanOrEqualTo(Long value) {
            addCriterion("ex_org_id <=", value, "exOrgId");
            return (Criteria) this;
        }

        public Criteria andExOrgIdIn(List<Long> values) {
            addCriterion("ex_org_id in", values, "exOrgId");
            return (Criteria) this;
        }

        public Criteria andExOrgIdNotIn(List<Long> values) {
            addCriterion("ex_org_id not in", values, "exOrgId");
            return (Criteria) this;
        }

        public Criteria andExOrgIdBetween(Long value1, Long value2) {
            addCriterion("ex_org_id between", value1, value2, "exOrgId");
            return (Criteria) this;
        }

        public Criteria andExOrgIdNotBetween(Long value1, Long value2) {
            addCriterion("ex_org_id not between", value1, value2, "exOrgId");
            return (Criteria) this;
        }

        public Criteria andCreatTimeIsNull() {
            addCriterion("creat_time is null");
            return (Criteria) this;
        }

        public Criteria andCreatTimeIsNotNull() {
            addCriterion("creat_time is not null");
            return (Criteria) this;
        }

        public Criteria andCreatTimeEqualTo(String value) {
            addCriterion("creat_time =", value, "creatTime");
            return (Criteria) this;
        }

        public Criteria andCreatTimeNotEqualTo(String value) {
            addCriterion("creat_time <>", value, "creatTime");
            return (Criteria) this;
        }

        public Criteria andCreatTimeGreaterThan(String value) {
            addCriterion("creat_time >", value, "creatTime");
            return (Criteria) this;
        }

        public Criteria andCreatTimeGreaterThanOrEqualTo(String value) {
            addCriterion("creat_time >=", value, "creatTime");
            return (Criteria) this;
        }

        public Criteria andCreatTimeLessThan(String value) {
            addCriterion("creat_time <", value, "creatTime");
            return (Criteria) this;
        }

        public Criteria andCreatTimeLessThanOrEqualTo(String value) {
            addCriterion("creat_time <=", value, "creatTime");
            return (Criteria) this;
        }

        public Criteria andCreatTimeLike(String value) {
            addCriterion("creat_time like", value, "creatTime");
            return (Criteria) this;
        }

        public Criteria andCreatTimeNotLike(String value) {
            addCriterion("creat_time not like", value, "creatTime");
            return (Criteria) this;
        }

        public Criteria andCreatTimeIn(List<String> values) {
            addCriterion("creat_time in", values, "creatTime");
            return (Criteria) this;
        }

        public Criteria andCreatTimeNotIn(List<String> values) {
            addCriterion("creat_time not in", values, "creatTime");
            return (Criteria) this;
        }

        public Criteria andCreatTimeBetween(String value1, String value2) {
            addCriterion("creat_time between", value1, value2, "creatTime");
            return (Criteria) this;
        }

        public Criteria andCreatTimeNotBetween(String value1, String value2) {
            addCriterion("creat_time not between", value1, value2, "creatTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeIsNull() {
            addCriterion("update_time is null");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeIsNotNull() {
            addCriterion("update_time is not null");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeEqualTo(String value) {
            addCriterion("update_time =", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeNotEqualTo(String value) {
            addCriterion("update_time <>", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeGreaterThan(String value) {
            addCriterion("update_time >", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeGreaterThanOrEqualTo(String value) {
            addCriterion("update_time >=", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeLessThan(String value) {
            addCriterion("update_time <", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeLessThanOrEqualTo(String value) {
            addCriterion("update_time <=", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeLike(String value) {
            addCriterion("update_time like", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeNotLike(String value) {
            addCriterion("update_time not like", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeIn(List<String> values) {
            addCriterion("update_time in", values, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeNotIn(List<String> values) {
            addCriterion("update_time not in", values, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeBetween(String value1, String value2) {
            addCriterion("update_time between", value1, value2, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeNotBetween(String value1, String value2) {
            addCriterion("update_time not between", value1, value2, "updateTime");
            return (Criteria) this;
        }

        public Criteria andAttr0IsNull() {
            addCriterion("attr0 is null");
            return (Criteria) this;
        }

        public Criteria andAttr0IsNotNull() {
            addCriterion("attr0 is not null");
            return (Criteria) this;
        }

        public Criteria andAttr0EqualTo(String value) {
            addCriterion("attr0 =", value, "attr0");
            return (Criteria) this;
        }

        public Criteria andAttr0NotEqualTo(String value) {
            addCriterion("attr0 <>", value, "attr0");
            return (Criteria) this;
        }

        public Criteria andAttr0GreaterThan(String value) {
            addCriterion("attr0 >", value, "attr0");
            return (Criteria) this;
        }

        public Criteria andAttr0GreaterThanOrEqualTo(String value) {
            addCriterion("attr0 >=", value, "attr0");
            return (Criteria) this;
        }

        public Criteria andAttr0LessThan(String value) {
            addCriterion("attr0 <", value, "attr0");
            return (Criteria) this;
        }

        public Criteria andAttr0LessThanOrEqualTo(String value) {
            addCriterion("attr0 <=", value, "attr0");
            return (Criteria) this;
        }

        public Criteria andAttr0Like(String value) {
            addCriterion("attr0 like", value, "attr0");
            return (Criteria) this;
        }

        public Criteria andAttr0NotLike(String value) {
            addCriterion("attr0 not like", value, "attr0");
            return (Criteria) this;
        }

        public Criteria andAttr0In(List<String> values) {
            addCriterion("attr0 in", values, "attr0");
            return (Criteria) this;
        }

        public Criteria andAttr0NotIn(List<String> values) {
            addCriterion("attr0 not in", values, "attr0");
            return (Criteria) this;
        }

        public Criteria andAttr0Between(String value1, String value2) {
            addCriterion("attr0 between", value1, value2, "attr0");
            return (Criteria) this;
        }

        public Criteria andAttr0NotBetween(String value1, String value2) {
            addCriterion("attr0 not between", value1, value2, "attr0");
            return (Criteria) this;
        }

        public Criteria andAttr1IsNull() {
            addCriterion("attr1 is null");
            return (Criteria) this;
        }

        public Criteria andAttr1IsNotNull() {
            addCriterion("attr1 is not null");
            return (Criteria) this;
        }

        public Criteria andAttr1EqualTo(String value) {
            addCriterion("attr1 =", value, "attr1");
            return (Criteria) this;
        }

        public Criteria andAttr1NotEqualTo(String value) {
            addCriterion("attr1 <>", value, "attr1");
            return (Criteria) this;
        }

        public Criteria andAttr1GreaterThan(String value) {
            addCriterion("attr1 >", value, "attr1");
            return (Criteria) this;
        }

        public Criteria andAttr1GreaterThanOrEqualTo(String value) {
            addCriterion("attr1 >=", value, "attr1");
            return (Criteria) this;
        }

        public Criteria andAttr1LessThan(String value) {
            addCriterion("attr1 <", value, "attr1");
            return (Criteria) this;
        }

        public Criteria andAttr1LessThanOrEqualTo(String value) {
            addCriterion("attr1 <=", value, "attr1");
            return (Criteria) this;
        }

        public Criteria andAttr1Like(String value) {
            addCriterion("attr1 like", value, "attr1");
            return (Criteria) this;
        }

        public Criteria andAttr1NotLike(String value) {
            addCriterion("attr1 not like", value, "attr1");
            return (Criteria) this;
        }

        public Criteria andAttr1In(List<String> values) {
            addCriterion("attr1 in", values, "attr1");
            return (Criteria) this;
        }

        public Criteria andAttr1NotIn(List<String> values) {
            addCriterion("attr1 not in", values, "attr1");
            return (Criteria) this;
        }

        public Criteria andAttr1Between(String value1, String value2) {
            addCriterion("attr1 between", value1, value2, "attr1");
            return (Criteria) this;
        }

        public Criteria andAttr1NotBetween(String value1, String value2) {
            addCriterion("attr1 not between", value1, value2, "attr1");
            return (Criteria) this;
        }

        public Criteria andAttr2IsNull() {
            addCriterion("attr2 is null");
            return (Criteria) this;
        }

        public Criteria andAttr2IsNotNull() {
            addCriterion("attr2 is not null");
            return (Criteria) this;
        }

        public Criteria andAttr2EqualTo(String value) {
            addCriterion("attr2 =", value, "attr2");
            return (Criteria) this;
        }

        public Criteria andAttr2NotEqualTo(String value) {
            addCriterion("attr2 <>", value, "attr2");
            return (Criteria) this;
        }

        public Criteria andAttr2GreaterThan(String value) {
            addCriterion("attr2 >", value, "attr2");
            return (Criteria) this;
        }

        public Criteria andAttr2GreaterThanOrEqualTo(String value) {
            addCriterion("attr2 >=", value, "attr2");
            return (Criteria) this;
        }

        public Criteria andAttr2LessThan(String value) {
            addCriterion("attr2 <", value, "attr2");
            return (Criteria) this;
        }

        public Criteria andAttr2LessThanOrEqualTo(String value) {
            addCriterion("attr2 <=", value, "attr2");
            return (Criteria) this;
        }

        public Criteria andAttr2Like(String value) {
            addCriterion("attr2 like", value, "attr2");
            return (Criteria) this;
        }

        public Criteria andAttr2NotLike(String value) {
            addCriterion("attr2 not like", value, "attr2");
            return (Criteria) this;
        }

        public Criteria andAttr2In(List<String> values) {
            addCriterion("attr2 in", values, "attr2");
            return (Criteria) this;
        }

        public Criteria andAttr2NotIn(List<String> values) {
            addCriterion("attr2 not in", values, "attr2");
            return (Criteria) this;
        }

        public Criteria andAttr2Between(String value1, String value2) {
            addCriterion("attr2 between", value1, value2, "attr2");
            return (Criteria) this;
        }

        public Criteria andAttr2NotBetween(String value1, String value2) {
            addCriterion("attr2 not between", value1, value2, "attr2");
            return (Criteria) this;
        }

        public Criteria andAttr3IsNull() {
            addCriterion("attr3 is null");
            return (Criteria) this;
        }

        public Criteria andAttr3IsNotNull() {
            addCriterion("attr3 is not null");
            return (Criteria) this;
        }

        public Criteria andAttr3EqualTo(String value) {
            addCriterion("attr3 =", value, "attr3");
            return (Criteria) this;
        }

        public Criteria andAttr3NotEqualTo(String value) {
            addCriterion("attr3 <>", value, "attr3");
            return (Criteria) this;
        }

        public Criteria andAttr3GreaterThan(String value) {
            addCriterion("attr3 >", value, "attr3");
            return (Criteria) this;
        }

        public Criteria andAttr3GreaterThanOrEqualTo(String value) {
            addCriterion("attr3 >=", value, "attr3");
            return (Criteria) this;
        }

        public Criteria andAttr3LessThan(String value) {
            addCriterion("attr3 <", value, "attr3");
            return (Criteria) this;
        }

        public Criteria andAttr3LessThanOrEqualTo(String value) {
            addCriterion("attr3 <=", value, "attr3");
            return (Criteria) this;
        }

        public Criteria andAttr3Like(String value) {
            addCriterion("attr3 like", value, "attr3");
            return (Criteria) this;
        }

        public Criteria andAttr3NotLike(String value) {
            addCriterion("attr3 not like", value, "attr3");
            return (Criteria) this;
        }

        public Criteria andAttr3In(List<String> values) {
            addCriterion("attr3 in", values, "attr3");
            return (Criteria) this;
        }

        public Criteria andAttr3NotIn(List<String> values) {
            addCriterion("attr3 not in", values, "attr3");
            return (Criteria) this;
        }

        public Criteria andAttr3Between(String value1, String value2) {
            addCriterion("attr3 between", value1, value2, "attr3");
            return (Criteria) this;
        }

        public Criteria andAttr3NotBetween(String value1, String value2) {
            addCriterion("attr3 not between", value1, value2, "attr3");
            return (Criteria) this;
        }

        public Criteria andAttr4IsNull() {
            addCriterion("attr4 is null");
            return (Criteria) this;
        }

        public Criteria andAttr4IsNotNull() {
            addCriterion("attr4 is not null");
            return (Criteria) this;
        }

        public Criteria andAttr4EqualTo(String value) {
            addCriterion("attr4 =", value, "attr4");
            return (Criteria) this;
        }

        public Criteria andAttr4NotEqualTo(String value) {
            addCriterion("attr4 <>", value, "attr4");
            return (Criteria) this;
        }

        public Criteria andAttr4GreaterThan(String value) {
            addCriterion("attr4 >", value, "attr4");
            return (Criteria) this;
        }

        public Criteria andAttr4GreaterThanOrEqualTo(String value) {
            addCriterion("attr4 >=", value, "attr4");
            return (Criteria) this;
        }

        public Criteria andAttr4LessThan(String value) {
            addCriterion("attr4 <", value, "attr4");
            return (Criteria) this;
        }

        public Criteria andAttr4LessThanOrEqualTo(String value) {
            addCriterion("attr4 <=", value, "attr4");
            return (Criteria) this;
        }

        public Criteria andAttr4Like(String value) {
            addCriterion("attr4 like", value, "attr4");
            return (Criteria) this;
        }

        public Criteria andAttr4NotLike(String value) {
            addCriterion("attr4 not like", value, "attr4");
            return (Criteria) this;
        }

        public Criteria andAttr4In(List<String> values) {
            addCriterion("attr4 in", values, "attr4");
            return (Criteria) this;
        }

        public Criteria andAttr4NotIn(List<String> values) {
            addCriterion("attr4 not in", values, "attr4");
            return (Criteria) this;
        }

        public Criteria andAttr4Between(String value1, String value2) {
            addCriterion("attr4 between", value1, value2, "attr4");
            return (Criteria) this;
        }

        public Criteria andAttr4NotBetween(String value1, String value2) {
            addCriterion("attr4 not between", value1, value2, "attr4");
            return (Criteria) this;
        }

        public Criteria andAttr5IsNull() {
            addCriterion("attr5 is null");
            return (Criteria) this;
        }

        public Criteria andAttr5IsNotNull() {
            addCriterion("attr5 is not null");
            return (Criteria) this;
        }

        public Criteria andAttr5EqualTo(Integer value) {
            addCriterion("attr5 =", value, "attr5");
            return (Criteria) this;
        }

        public Criteria andAttr5NotEqualTo(Integer value) {
            addCriterion("attr5 <>", value, "attr5");
            return (Criteria) this;
        }

        public Criteria andAttr5GreaterThan(Integer value) {
            addCriterion("attr5 >", value, "attr5");
            return (Criteria) this;
        }

        public Criteria andAttr5GreaterThanOrEqualTo(Integer value) {
            addCriterion("attr5 >=", value, "attr5");
            return (Criteria) this;
        }

        public Criteria andAttr5LessThan(Integer value) {
            addCriterion("attr5 <", value, "attr5");
            return (Criteria) this;
        }

        public Criteria andAttr5LessThanOrEqualTo(Integer value) {
            addCriterion("attr5 <=", value, "attr5");
            return (Criteria) this;
        }

        public Criteria andAttr5In(List<Integer> values) {
            addCriterion("attr5 in", values, "attr5");
            return (Criteria) this;
        }

        public Criteria andAttr5NotIn(List<Integer> values) {
            addCriterion("attr5 not in", values, "attr5");
            return (Criteria) this;
        }

        public Criteria andAttr5Between(Integer value1, Integer value2) {
            addCriterion("attr5 between", value1, value2, "attr5");
            return (Criteria) this;
        }

        public Criteria andAttr5NotBetween(Integer value1, Integer value2) {
            addCriterion("attr5 not between", value1, value2, "attr5");
            return (Criteria) this;
        }

        public Criteria andAttr6IsNull() {
            addCriterion("attr6 is null");
            return (Criteria) this;
        }

        public Criteria andAttr6IsNotNull() {
            addCriterion("attr6 is not null");
            return (Criteria) this;
        }

        public Criteria andAttr6EqualTo(Integer value) {
            addCriterion("attr6 =", value, "attr6");
            return (Criteria) this;
        }

        public Criteria andAttr6NotEqualTo(Integer value) {
            addCriterion("attr6 <>", value, "attr6");
            return (Criteria) this;
        }

        public Criteria andAttr6GreaterThan(Integer value) {
            addCriterion("attr6 >", value, "attr6");
            return (Criteria) this;
        }

        public Criteria andAttr6GreaterThanOrEqualTo(Integer value) {
            addCriterion("attr6 >=", value, "attr6");
            return (Criteria) this;
        }

        public Criteria andAttr6LessThan(Integer value) {
            addCriterion("attr6 <", value, "attr6");
            return (Criteria) this;
        }

        public Criteria andAttr6LessThanOrEqualTo(Integer value) {
            addCriterion("attr6 <=", value, "attr6");
            return (Criteria) this;
        }

        public Criteria andAttr6In(List<Integer> values) {
            addCriterion("attr6 in", values, "attr6");
            return (Criteria) this;
        }

        public Criteria andAttr6NotIn(List<Integer> values) {
            addCriterion("attr6 not in", values, "attr6");
            return (Criteria) this;
        }

        public Criteria andAttr6Between(Integer value1, Integer value2) {
            addCriterion("attr6 between", value1, value2, "attr6");
            return (Criteria) this;
        }

        public Criteria andAttr6NotBetween(Integer value1, Integer value2) {
            addCriterion("attr6 not between", value1, value2, "attr6");
            return (Criteria) this;
        }

        public Criteria andAttr7IsNull() {
            addCriterion("attr7 is null");
            return (Criteria) this;
        }

        public Criteria andAttr7IsNotNull() {
            addCriterion("attr7 is not null");
            return (Criteria) this;
        }

        public Criteria andAttr7EqualTo(Integer value) {
            addCriterion("attr7 =", value, "attr7");
            return (Criteria) this;
        }

        public Criteria andAttr7NotEqualTo(Integer value) {
            addCriterion("attr7 <>", value, "attr7");
            return (Criteria) this;
        }

        public Criteria andAttr7GreaterThan(Integer value) {
            addCriterion("attr7 >", value, "attr7");
            return (Criteria) this;
        }

        public Criteria andAttr7GreaterThanOrEqualTo(Integer value) {
            addCriterion("attr7 >=", value, "attr7");
            return (Criteria) this;
        }

        public Criteria andAttr7LessThan(Integer value) {
            addCriterion("attr7 <", value, "attr7");
            return (Criteria) this;
        }

        public Criteria andAttr7LessThanOrEqualTo(Integer value) {
            addCriterion("attr7 <=", value, "attr7");
            return (Criteria) this;
        }

        public Criteria andAttr7In(List<Integer> values) {
            addCriterion("attr7 in", values, "attr7");
            return (Criteria) this;
        }

        public Criteria andAttr7NotIn(List<Integer> values) {
            addCriterion("attr7 not in", values, "attr7");
            return (Criteria) this;
        }

        public Criteria andAttr7Between(Integer value1, Integer value2) {
            addCriterion("attr7 between", value1, value2, "attr7");
            return (Criteria) this;
        }

        public Criteria andAttr7NotBetween(Integer value1, Integer value2) {
            addCriterion("attr7 not between", value1, value2, "attr7");
            return (Criteria) this;
        }

        public Criteria andAttr8IsNull() {
            addCriterion("attr8 is null");
            return (Criteria) this;
        }

        public Criteria andAttr8IsNotNull() {
            addCriterion("attr8 is not null");
            return (Criteria) this;
        }

        public Criteria andAttr8EqualTo(Integer value) {
            addCriterion("attr8 =", value, "attr8");
            return (Criteria) this;
        }

        public Criteria andAttr8NotEqualTo(Integer value) {
            addCriterion("attr8 <>", value, "attr8");
            return (Criteria) this;
        }

        public Criteria andAttr8GreaterThan(Integer value) {
            addCriterion("attr8 >", value, "attr8");
            return (Criteria) this;
        }

        public Criteria andAttr8GreaterThanOrEqualTo(Integer value) {
            addCriterion("attr8 >=", value, "attr8");
            return (Criteria) this;
        }

        public Criteria andAttr8LessThan(Integer value) {
            addCriterion("attr8 <", value, "attr8");
            return (Criteria) this;
        }

        public Criteria andAttr8LessThanOrEqualTo(Integer value) {
            addCriterion("attr8 <=", value, "attr8");
            return (Criteria) this;
        }

        public Criteria andAttr8In(List<Integer> values) {
            addCriterion("attr8 in", values, "attr8");
            return (Criteria) this;
        }

        public Criteria andAttr8NotIn(List<Integer> values) {
            addCriterion("attr8 not in", values, "attr8");
            return (Criteria) this;
        }

        public Criteria andAttr8Between(Integer value1, Integer value2) {
            addCriterion("attr8 between", value1, value2, "attr8");
            return (Criteria) this;
        }

        public Criteria andAttr8NotBetween(Integer value1, Integer value2) {
            addCriterion("attr8 not between", value1, value2, "attr8");
            return (Criteria) this;
        }

        public Criteria andAttr9IsNull() {
            addCriterion("attr9 is null");
            return (Criteria) this;
        }

        public Criteria andAttr9IsNotNull() {
            addCriterion("attr9 is not null");
            return (Criteria) this;
        }

        public Criteria andAttr9EqualTo(Integer value) {
            addCriterion("attr9 =", value, "attr9");
            return (Criteria) this;
        }

        public Criteria andAttr9NotEqualTo(Integer value) {
            addCriterion("attr9 <>", value, "attr9");
            return (Criteria) this;
        }

        public Criteria andAttr9GreaterThan(Integer value) {
            addCriterion("attr9 >", value, "attr9");
            return (Criteria) this;
        }

        public Criteria andAttr9GreaterThanOrEqualTo(Integer value) {
            addCriterion("attr9 >=", value, "attr9");
            return (Criteria) this;
        }

        public Criteria andAttr9LessThan(Integer value) {
            addCriterion("attr9 <", value, "attr9");
            return (Criteria) this;
        }

        public Criteria andAttr9LessThanOrEqualTo(Integer value) {
            addCriterion("attr9 <=", value, "attr9");
            return (Criteria) this;
        }

        public Criteria andAttr9In(List<Integer> values) {
            addCriterion("attr9 in", values, "attr9");
            return (Criteria) this;
        }

        public Criteria andAttr9NotIn(List<Integer> values) {
            addCriterion("attr9 not in", values, "attr9");
            return (Criteria) this;
        }

        public Criteria andAttr9Between(Integer value1, Integer value2) {
            addCriterion("attr9 between", value1, value2, "attr9");
            return (Criteria) this;
        }

        public Criteria andAttr9NotBetween(Integer value1, Integer value2) {
            addCriterion("attr9 not between", value1, value2, "attr9");
            return (Criteria) this;
        }

        public Criteria andAttr10IsNull() {
            addCriterion("attr10 is null");
            return (Criteria) this;
        }

        public Criteria andAttr10IsNotNull() {
            addCriterion("attr10 is not null");
            return (Criteria) this;
        }

        public Criteria andAttr10EqualTo(Long value) {
            addCriterion("attr10 =", value, "attr10");
            return (Criteria) this;
        }

        public Criteria andAttr10NotEqualTo(Long value) {
            addCriterion("attr10 <>", value, "attr10");
            return (Criteria) this;
        }

        public Criteria andAttr10GreaterThan(Long value) {
            addCriterion("attr10 >", value, "attr10");
            return (Criteria) this;
        }

        public Criteria andAttr10GreaterThanOrEqualTo(Long value) {
            addCriterion("attr10 >=", value, "attr10");
            return (Criteria) this;
        }

        public Criteria andAttr10LessThan(Long value) {
            addCriterion("attr10 <", value, "attr10");
            return (Criteria) this;
        }

        public Criteria andAttr10LessThanOrEqualTo(Long value) {
            addCriterion("attr10 <=", value, "attr10");
            return (Criteria) this;
        }

        public Criteria andAttr10In(List<Long> values) {
            addCriterion("attr10 in", values, "attr10");
            return (Criteria) this;
        }

        public Criteria andAttr10NotIn(List<Long> values) {
            addCriterion("attr10 not in", values, "attr10");
            return (Criteria) this;
        }

        public Criteria andAttr10Between(Long value1, Long value2) {
            addCriterion("attr10 between", value1, value2, "attr10");
            return (Criteria) this;
        }

        public Criteria andAttr10NotBetween(Long value1, Long value2) {
            addCriterion("attr10 not between", value1, value2, "attr10");
            return (Criteria) this;
        }

        public Criteria andAttr11IsNull() {
            addCriterion("attr11 is null");
            return (Criteria) this;
        }

        public Criteria andAttr11IsNotNull() {
            addCriterion("attr11 is not null");
            return (Criteria) this;
        }

        public Criteria andAttr11EqualTo(Long value) {
            addCriterion("attr11 =", value, "attr11");
            return (Criteria) this;
        }

        public Criteria andAttr11NotEqualTo(Long value) {
            addCriterion("attr11 <>", value, "attr11");
            return (Criteria) this;
        }

        public Criteria andAttr11GreaterThan(Long value) {
            addCriterion("attr11 >", value, "attr11");
            return (Criteria) this;
        }

        public Criteria andAttr11GreaterThanOrEqualTo(Long value) {
            addCriterion("attr11 >=", value, "attr11");
            return (Criteria) this;
        }

        public Criteria andAttr11LessThan(Long value) {
            addCriterion("attr11 <", value, "attr11");
            return (Criteria) this;
        }

        public Criteria andAttr11LessThanOrEqualTo(Long value) {
            addCriterion("attr11 <=", value, "attr11");
            return (Criteria) this;
        }

        public Criteria andAttr11In(List<Long> values) {
            addCriterion("attr11 in", values, "attr11");
            return (Criteria) this;
        }

        public Criteria andAttr11NotIn(List<Long> values) {
            addCriterion("attr11 not in", values, "attr11");
            return (Criteria) this;
        }

        public Criteria andAttr11Between(Long value1, Long value2) {
            addCriterion("attr11 between", value1, value2, "attr11");
            return (Criteria) this;
        }

        public Criteria andAttr11NotBetween(Long value1, Long value2) {
            addCriterion("attr11 not between", value1, value2, "attr11");
            return (Criteria) this;
        }

        public Criteria andAttr12IsNull() {
            addCriterion("attr12 is null");
            return (Criteria) this;
        }

        public Criteria andAttr12IsNotNull() {
            addCriterion("attr12 is not null");
            return (Criteria) this;
        }

        public Criteria andAttr12EqualTo(Long value) {
            addCriterion("attr12 =", value, "attr12");
            return (Criteria) this;
        }

        public Criteria andAttr12NotEqualTo(Long value) {
            addCriterion("attr12 <>", value, "attr12");
            return (Criteria) this;
        }

        public Criteria andAttr12GreaterThan(Long value) {
            addCriterion("attr12 >", value, "attr12");
            return (Criteria) this;
        }

        public Criteria andAttr12GreaterThanOrEqualTo(Long value) {
            addCriterion("attr12 >=", value, "attr12");
            return (Criteria) this;
        }

        public Criteria andAttr12LessThan(Long value) {
            addCriterion("attr12 <", value, "attr12");
            return (Criteria) this;
        }

        public Criteria andAttr12LessThanOrEqualTo(Long value) {
            addCriterion("attr12 <=", value, "attr12");
            return (Criteria) this;
        }

        public Criteria andAttr12In(List<Long> values) {
            addCriterion("attr12 in", values, "attr12");
            return (Criteria) this;
        }

        public Criteria andAttr12NotIn(List<Long> values) {
            addCriterion("attr12 not in", values, "attr12");
            return (Criteria) this;
        }

        public Criteria andAttr12Between(Long value1, Long value2) {
            addCriterion("attr12 between", value1, value2, "attr12");
            return (Criteria) this;
        }

        public Criteria andAttr12NotBetween(Long value1, Long value2) {
            addCriterion("attr12 not between", value1, value2, "attr12");
            return (Criteria) this;
        }

        public Criteria andAttr13IsNull() {
            addCriterion("attr13 is null");
            return (Criteria) this;
        }

        public Criteria andAttr13IsNotNull() {
            addCriterion("attr13 is not null");
            return (Criteria) this;
        }

        public Criteria andAttr13EqualTo(Long value) {
            addCriterion("attr13 =", value, "attr13");
            return (Criteria) this;
        }

        public Criteria andAttr13NotEqualTo(Long value) {
            addCriterion("attr13 <>", value, "attr13");
            return (Criteria) this;
        }

        public Criteria andAttr13GreaterThan(Long value) {
            addCriterion("attr13 >", value, "attr13");
            return (Criteria) this;
        }

        public Criteria andAttr13GreaterThanOrEqualTo(Long value) {
            addCriterion("attr13 >=", value, "attr13");
            return (Criteria) this;
        }

        public Criteria andAttr13LessThan(Long value) {
            addCriterion("attr13 <", value, "attr13");
            return (Criteria) this;
        }

        public Criteria andAttr13LessThanOrEqualTo(Long value) {
            addCriterion("attr13 <=", value, "attr13");
            return (Criteria) this;
        }

        public Criteria andAttr13In(List<Long> values) {
            addCriterion("attr13 in", values, "attr13");
            return (Criteria) this;
        }

        public Criteria andAttr13NotIn(List<Long> values) {
            addCriterion("attr13 not in", values, "attr13");
            return (Criteria) this;
        }

        public Criteria andAttr13Between(Long value1, Long value2) {
            addCriterion("attr13 between", value1, value2, "attr13");
            return (Criteria) this;
        }

        public Criteria andAttr13NotBetween(Long value1, Long value2) {
            addCriterion("attr13 not between", value1, value2, "attr13");
            return (Criteria) this;
        }

        public Criteria andAttr14IsNull() {
            addCriterion("attr14 is null");
            return (Criteria) this;
        }

        public Criteria andAttr14IsNotNull() {
            addCriterion("attr14 is not null");
            return (Criteria) this;
        }

        public Criteria andAttr14EqualTo(Double value) {
            addCriterion("attr14 =", value, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14NotEqualTo(Double value) {
            addCriterion("attr14 <>", value, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14GreaterThan(Double value) {
            addCriterion("attr14 >", value, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14GreaterThanOrEqualTo(Double value) {
            addCriterion("attr14 >=", value, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14LessThan(Double value) {
            addCriterion("attr14 <", value, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14LessThanOrEqualTo(Double value) {
            addCriterion("attr14 <=", value, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14In(List<Double> values) {
            addCriterion("attr14 in", values, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14NotIn(List<Double> values) {
            addCriterion("attr14 not in", values, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14Between(Double value1, Double value2) {
            addCriterion("attr14 between", value1, value2, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14NotBetween(Double value1, Double value2) {
            addCriterion("attr14 not between", value1, value2, "attr14");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}