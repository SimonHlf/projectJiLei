package cn.windy.module.examination.mybatis.model;

import java.util.ArrayList;
import java.util.List;

public class PaperTestQuery {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    protected Integer pageNo = 1;

    protected Integer startRow;

    protected Integer pageSize = 10;

    protected String fields;

    public PaperTestQuery() {
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

        public Criteria andPapercreatidIsNull() {
            addCriterion("paperCreatId is null");
            return (Criteria) this;
        }

        public Criteria andPapercreatidIsNotNull() {
            addCriterion("paperCreatId is not null");
            return (Criteria) this;
        }

        public Criteria andPapercreatidEqualTo(Long value) {
            addCriterion("paperCreatId =", value, "papercreatid");
            return (Criteria) this;
        }

        public Criteria andPapercreatidNotEqualTo(Long value) {
            addCriterion("paperCreatId <>", value, "papercreatid");
            return (Criteria) this;
        }

        public Criteria andPapercreatidGreaterThan(Long value) {
            addCriterion("paperCreatId >", value, "papercreatid");
            return (Criteria) this;
        }

        public Criteria andPapercreatidGreaterThanOrEqualTo(Long value) {
            addCriterion("paperCreatId >=", value, "papercreatid");
            return (Criteria) this;
        }

        public Criteria andPapercreatidLessThan(Long value) {
            addCriterion("paperCreatId <", value, "papercreatid");
            return (Criteria) this;
        }

        public Criteria andPapercreatidLessThanOrEqualTo(Long value) {
            addCriterion("paperCreatId <=", value, "papercreatid");
            return (Criteria) this;
        }

        public Criteria andPapercreatidIn(List<Long> values) {
            addCriterion("paperCreatId in", values, "papercreatid");
            return (Criteria) this;
        }

        public Criteria andPapercreatidNotIn(List<Long> values) {
            addCriterion("paperCreatId not in", values, "papercreatid");
            return (Criteria) this;
        }

        public Criteria andPapercreatidBetween(Long value1, Long value2) {
            addCriterion("paperCreatId between", value1, value2, "papercreatid");
            return (Criteria) this;
        }

        public Criteria andPapercreatidNotBetween(Long value1, Long value2) {
            addCriterion("paperCreatId not between", value1, value2, "papercreatid");
            return (Criteria) this;
        }

        public Criteria andIsrepeatIsNull() {
            addCriterion("isRepeat is null");
            return (Criteria) this;
        }

        public Criteria andIsrepeatIsNotNull() {
            addCriterion("isRepeat is not null");
            return (Criteria) this;
        }

        public Criteria andIsrepeatEqualTo(Integer value) {
            addCriterion("isRepeat =", value, "isrepeat");
            return (Criteria) this;
        }

        public Criteria andIsrepeatNotEqualTo(Integer value) {
            addCriterion("isRepeat <>", value, "isrepeat");
            return (Criteria) this;
        }

        public Criteria andIsrepeatGreaterThan(Integer value) {
            addCriterion("isRepeat >", value, "isrepeat");
            return (Criteria) this;
        }

        public Criteria andIsrepeatGreaterThanOrEqualTo(Integer value) {
            addCriterion("isRepeat >=", value, "isrepeat");
            return (Criteria) this;
        }

        public Criteria andIsrepeatLessThan(Integer value) {
            addCriterion("isRepeat <", value, "isrepeat");
            return (Criteria) this;
        }

        public Criteria andIsrepeatLessThanOrEqualTo(Integer value) {
            addCriterion("isRepeat <=", value, "isrepeat");
            return (Criteria) this;
        }

        public Criteria andIsrepeatIn(List<Integer> values) {
            addCriterion("isRepeat in", values, "isrepeat");
            return (Criteria) this;
        }

        public Criteria andIsrepeatNotIn(List<Integer> values) {
            addCriterion("isRepeat not in", values, "isrepeat");
            return (Criteria) this;
        }

        public Criteria andIsrepeatBetween(Integer value1, Integer value2) {
            addCriterion("isRepeat between", value1, value2, "isrepeat");
            return (Criteria) this;
        }

        public Criteria andIsrepeatNotBetween(Integer value1, Integer value2) {
            addCriterion("isRepeat not between", value1, value2, "isrepeat");
            return (Criteria) this;
        }

        public Criteria andOrgIdIsNull() {
            addCriterion("org_id is null");
            return (Criteria) this;
        }

        public Criteria andOrgIdIsNotNull() {
            addCriterion("org_id is not null");
            return (Criteria) this;
        }

        public Criteria andOrgIdEqualTo(Long value) {
            addCriterion("org_id =", value, "orgId");
            return (Criteria) this;
        }

        public Criteria andOrgIdNotEqualTo(Long value) {
            addCriterion("org_id <>", value, "orgId");
            return (Criteria) this;
        }

        public Criteria andOrgIdGreaterThan(Long value) {
            addCriterion("org_id >", value, "orgId");
            return (Criteria) this;
        }

        public Criteria andOrgIdGreaterThanOrEqualTo(Long value) {
            addCriterion("org_id >=", value, "orgId");
            return (Criteria) this;
        }

        public Criteria andOrgIdLessThan(Long value) {
            addCriterion("org_id <", value, "orgId");
            return (Criteria) this;
        }

        public Criteria andOrgIdLessThanOrEqualTo(Long value) {
            addCriterion("org_id <=", value, "orgId");
            return (Criteria) this;
        }

        public Criteria andOrgIdIn(List<Long> values) {
            addCriterion("org_id in", values, "orgId");
            return (Criteria) this;
        }

        public Criteria andOrgIdNotIn(List<Long> values) {
            addCriterion("org_id not in", values, "orgId");
            return (Criteria) this;
        }

        public Criteria andOrgIdBetween(Long value1, Long value2) {
            addCriterion("org_id between", value1, value2, "orgId");
            return (Criteria) this;
        }

        public Criteria andOrgIdNotBetween(Long value1, Long value2) {
            addCriterion("org_id not between", value1, value2, "orgId");
            return (Criteria) this;
        }

        public Criteria andStarttimeIsNull() {
            addCriterion("startTime is null");
            return (Criteria) this;
        }

        public Criteria andStarttimeIsNotNull() {
            addCriterion("startTime is not null");
            return (Criteria) this;
        }

        public Criteria andStarttimeEqualTo(String value) {
            addCriterion("startTime =", value, "starttime");
            return (Criteria) this;
        }

        public Criteria andStarttimeNotEqualTo(String value) {
            addCriterion("startTime <>", value, "starttime");
            return (Criteria) this;
        }

        public Criteria andStarttimeGreaterThan(String value) {
            addCriterion("startTime >", value, "starttime");
            return (Criteria) this;
        }

        public Criteria andStarttimeGreaterThanOrEqualTo(String value) {
            addCriterion("startTime >=", value, "starttime");
            return (Criteria) this;
        }

        public Criteria andStarttimeLessThan(String value) {
            addCriterion("startTime <", value, "starttime");
            return (Criteria) this;
        }

        public Criteria andStarttimeLessThanOrEqualTo(String value) {
            addCriterion("startTime <=", value, "starttime");
            return (Criteria) this;
        }

        public Criteria andStarttimeLike(String value) {
            addCriterion("startTime like", value, "starttime");
            return (Criteria) this;
        }

        public Criteria andStarttimeNotLike(String value) {
            addCriterion("startTime not like", value, "starttime");
            return (Criteria) this;
        }

        public Criteria andStarttimeIn(List<String> values) {
            addCriterion("startTime in", values, "starttime");
            return (Criteria) this;
        }

        public Criteria andStarttimeNotIn(List<String> values) {
            addCriterion("startTime not in", values, "starttime");
            return (Criteria) this;
        }

        public Criteria andStarttimeBetween(String value1, String value2) {
            addCriterion("startTime between", value1, value2, "starttime");
            return (Criteria) this;
        }

        public Criteria andStarttimeNotBetween(String value1, String value2) {
            addCriterion("startTime not between", value1, value2, "starttime");
            return (Criteria) this;
        }

        public Criteria andEndtimeIsNull() {
            addCriterion("endTime is null");
            return (Criteria) this;
        }

        public Criteria andEndtimeIsNotNull() {
            addCriterion("endTime is not null");
            return (Criteria) this;
        }

        public Criteria andEndtimeEqualTo(String value) {
            addCriterion("endTime =", value, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeNotEqualTo(String value) {
            addCriterion("endTime <>", value, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeGreaterThan(String value) {
            addCriterion("endTime >", value, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeGreaterThanOrEqualTo(String value) {
            addCriterion("endTime >=", value, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeLessThan(String value) {
            addCriterion("endTime <", value, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeLessThanOrEqualTo(String value) {
            addCriterion("endTime <=", value, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeLike(String value) {
            addCriterion("endTime like", value, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeNotLike(String value) {
            addCriterion("endTime not like", value, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeIn(List<String> values) {
            addCriterion("endTime in", values, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeNotIn(List<String> values) {
            addCriterion("endTime not in", values, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeBetween(String value1, String value2) {
            addCriterion("endTime between", value1, value2, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeNotBetween(String value1, String value2) {
            addCriterion("endTime not between", value1, value2, "endtime");
            return (Criteria) this;
        }

        public Criteria andFixtesttimeIsNull() {
            addCriterion("fixTestTime is null");
            return (Criteria) this;
        }

        public Criteria andFixtesttimeIsNotNull() {
            addCriterion("fixTestTime is not null");
            return (Criteria) this;
        }

        public Criteria andFixtesttimeEqualTo(String value) {
            addCriterion("fixTestTime =", value, "fixtesttime");
            return (Criteria) this;
        }

        public Criteria andFixtesttimeNotEqualTo(String value) {
            addCriterion("fixTestTime <>", value, "fixtesttime");
            return (Criteria) this;
        }

        public Criteria andFixtesttimeGreaterThan(String value) {
            addCriterion("fixTestTime >", value, "fixtesttime");
            return (Criteria) this;
        }

        public Criteria andFixtesttimeGreaterThanOrEqualTo(String value) {
            addCriterion("fixTestTime >=", value, "fixtesttime");
            return (Criteria) this;
        }

        public Criteria andFixtesttimeLessThan(String value) {
            addCriterion("fixTestTime <", value, "fixtesttime");
            return (Criteria) this;
        }

        public Criteria andFixtesttimeLessThanOrEqualTo(String value) {
            addCriterion("fixTestTime <=", value, "fixtesttime");
            return (Criteria) this;
        }

        public Criteria andFixtesttimeLike(String value) {
            addCriterion("fixTestTime like", value, "fixtesttime");
            return (Criteria) this;
        }

        public Criteria andFixtesttimeNotLike(String value) {
            addCriterion("fixTestTime not like", value, "fixtesttime");
            return (Criteria) this;
        }

        public Criteria andFixtesttimeIn(List<String> values) {
            addCriterion("fixTestTime in", values, "fixtesttime");
            return (Criteria) this;
        }

        public Criteria andFixtesttimeNotIn(List<String> values) {
            addCriterion("fixTestTime not in", values, "fixtesttime");
            return (Criteria) this;
        }

        public Criteria andFixtesttimeBetween(String value1, String value2) {
            addCriterion("fixTestTime between", value1, value2, "fixtesttime");
            return (Criteria) this;
        }

        public Criteria andFixtesttimeNotBetween(String value1, String value2) {
            addCriterion("fixTestTime not between", value1, value2, "fixtesttime");
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

        public Criteria andAttr5EqualTo(String value) {
            addCriterion("attr5 =", value, "attr5");
            return (Criteria) this;
        }

        public Criteria andAttr5NotEqualTo(String value) {
            addCriterion("attr5 <>", value, "attr5");
            return (Criteria) this;
        }

        public Criteria andAttr5GreaterThan(String value) {
            addCriterion("attr5 >", value, "attr5");
            return (Criteria) this;
        }

        public Criteria andAttr5GreaterThanOrEqualTo(String value) {
            addCriterion("attr5 >=", value, "attr5");
            return (Criteria) this;
        }

        public Criteria andAttr5LessThan(String value) {
            addCriterion("attr5 <", value, "attr5");
            return (Criteria) this;
        }

        public Criteria andAttr5LessThanOrEqualTo(String value) {
            addCriterion("attr5 <=", value, "attr5");
            return (Criteria) this;
        }

        public Criteria andAttr5Like(String value) {
            addCriterion("attr5 like", value, "attr5");
            return (Criteria) this;
        }

        public Criteria andAttr5NotLike(String value) {
            addCriterion("attr5 not like", value, "attr5");
            return (Criteria) this;
        }

        public Criteria andAttr5In(List<String> values) {
            addCriterion("attr5 in", values, "attr5");
            return (Criteria) this;
        }

        public Criteria andAttr5NotIn(List<String> values) {
            addCriterion("attr5 not in", values, "attr5");
            return (Criteria) this;
        }

        public Criteria andAttr5Between(String value1, String value2) {
            addCriterion("attr5 between", value1, value2, "attr5");
            return (Criteria) this;
        }

        public Criteria andAttr5NotBetween(String value1, String value2) {
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

        public Criteria andAttr6EqualTo(String value) {
            addCriterion("attr6 =", value, "attr6");
            return (Criteria) this;
        }

        public Criteria andAttr6NotEqualTo(String value) {
            addCriterion("attr6 <>", value, "attr6");
            return (Criteria) this;
        }

        public Criteria andAttr6GreaterThan(String value) {
            addCriterion("attr6 >", value, "attr6");
            return (Criteria) this;
        }

        public Criteria andAttr6GreaterThanOrEqualTo(String value) {
            addCriterion("attr6 >=", value, "attr6");
            return (Criteria) this;
        }

        public Criteria andAttr6LessThan(String value) {
            addCriterion("attr6 <", value, "attr6");
            return (Criteria) this;
        }

        public Criteria andAttr6LessThanOrEqualTo(String value) {
            addCriterion("attr6 <=", value, "attr6");
            return (Criteria) this;
        }

        public Criteria andAttr6Like(String value) {
            addCriterion("attr6 like", value, "attr6");
            return (Criteria) this;
        }

        public Criteria andAttr6NotLike(String value) {
            addCriterion("attr6 not like", value, "attr6");
            return (Criteria) this;
        }

        public Criteria andAttr6In(List<String> values) {
            addCriterion("attr6 in", values, "attr6");
            return (Criteria) this;
        }

        public Criteria andAttr6NotIn(List<String> values) {
            addCriterion("attr6 not in", values, "attr6");
            return (Criteria) this;
        }

        public Criteria andAttr6Between(String value1, String value2) {
            addCriterion("attr6 between", value1, value2, "attr6");
            return (Criteria) this;
        }

        public Criteria andAttr6NotBetween(String value1, String value2) {
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

        public Criteria andAttr7EqualTo(String value) {
            addCriterion("attr7 =", value, "attr7");
            return (Criteria) this;
        }

        public Criteria andAttr7NotEqualTo(String value) {
            addCriterion("attr7 <>", value, "attr7");
            return (Criteria) this;
        }

        public Criteria andAttr7GreaterThan(String value) {
            addCriterion("attr7 >", value, "attr7");
            return (Criteria) this;
        }

        public Criteria andAttr7GreaterThanOrEqualTo(String value) {
            addCriterion("attr7 >=", value, "attr7");
            return (Criteria) this;
        }

        public Criteria andAttr7LessThan(String value) {
            addCriterion("attr7 <", value, "attr7");
            return (Criteria) this;
        }

        public Criteria andAttr7LessThanOrEqualTo(String value) {
            addCriterion("attr7 <=", value, "attr7");
            return (Criteria) this;
        }

        public Criteria andAttr7Like(String value) {
            addCriterion("attr7 like", value, "attr7");
            return (Criteria) this;
        }

        public Criteria andAttr7NotLike(String value) {
            addCriterion("attr7 not like", value, "attr7");
            return (Criteria) this;
        }

        public Criteria andAttr7In(List<String> values) {
            addCriterion("attr7 in", values, "attr7");
            return (Criteria) this;
        }

        public Criteria andAttr7NotIn(List<String> values) {
            addCriterion("attr7 not in", values, "attr7");
            return (Criteria) this;
        }

        public Criteria andAttr7Between(String value1, String value2) {
            addCriterion("attr7 between", value1, value2, "attr7");
            return (Criteria) this;
        }

        public Criteria andAttr7NotBetween(String value1, String value2) {
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

        public Criteria andAttr8EqualTo(String value) {
            addCriterion("attr8 =", value, "attr8");
            return (Criteria) this;
        }

        public Criteria andAttr8NotEqualTo(String value) {
            addCriterion("attr8 <>", value, "attr8");
            return (Criteria) this;
        }

        public Criteria andAttr8GreaterThan(String value) {
            addCriterion("attr8 >", value, "attr8");
            return (Criteria) this;
        }

        public Criteria andAttr8GreaterThanOrEqualTo(String value) {
            addCriterion("attr8 >=", value, "attr8");
            return (Criteria) this;
        }

        public Criteria andAttr8LessThan(String value) {
            addCriterion("attr8 <", value, "attr8");
            return (Criteria) this;
        }

        public Criteria andAttr8LessThanOrEqualTo(String value) {
            addCriterion("attr8 <=", value, "attr8");
            return (Criteria) this;
        }

        public Criteria andAttr8Like(String value) {
            addCriterion("attr8 like", value, "attr8");
            return (Criteria) this;
        }

        public Criteria andAttr8NotLike(String value) {
            addCriterion("attr8 not like", value, "attr8");
            return (Criteria) this;
        }

        public Criteria andAttr8In(List<String> values) {
            addCriterion("attr8 in", values, "attr8");
            return (Criteria) this;
        }

        public Criteria andAttr8NotIn(List<String> values) {
            addCriterion("attr8 not in", values, "attr8");
            return (Criteria) this;
        }

        public Criteria andAttr8Between(String value1, String value2) {
            addCriterion("attr8 between", value1, value2, "attr8");
            return (Criteria) this;
        }

        public Criteria andAttr8NotBetween(String value1, String value2) {
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

        public Criteria andAttr9EqualTo(String value) {
            addCriterion("attr9 =", value, "attr9");
            return (Criteria) this;
        }

        public Criteria andAttr9NotEqualTo(String value) {
            addCriterion("attr9 <>", value, "attr9");
            return (Criteria) this;
        }

        public Criteria andAttr9GreaterThan(String value) {
            addCriterion("attr9 >", value, "attr9");
            return (Criteria) this;
        }

        public Criteria andAttr9GreaterThanOrEqualTo(String value) {
            addCriterion("attr9 >=", value, "attr9");
            return (Criteria) this;
        }

        public Criteria andAttr9LessThan(String value) {
            addCriterion("attr9 <", value, "attr9");
            return (Criteria) this;
        }

        public Criteria andAttr9LessThanOrEqualTo(String value) {
            addCriterion("attr9 <=", value, "attr9");
            return (Criteria) this;
        }

        public Criteria andAttr9Like(String value) {
            addCriterion("attr9 like", value, "attr9");
            return (Criteria) this;
        }

        public Criteria andAttr9NotLike(String value) {
            addCriterion("attr9 not like", value, "attr9");
            return (Criteria) this;
        }

        public Criteria andAttr9In(List<String> values) {
            addCriterion("attr9 in", values, "attr9");
            return (Criteria) this;
        }

        public Criteria andAttr9NotIn(List<String> values) {
            addCriterion("attr9 not in", values, "attr9");
            return (Criteria) this;
        }

        public Criteria andAttr9Between(String value1, String value2) {
            addCriterion("attr9 between", value1, value2, "attr9");
            return (Criteria) this;
        }

        public Criteria andAttr9NotBetween(String value1, String value2) {
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

        public Criteria andAttr10EqualTo(Integer value) {
            addCriterion("attr10 =", value, "attr10");
            return (Criteria) this;
        }

        public Criteria andAttr10NotEqualTo(Integer value) {
            addCriterion("attr10 <>", value, "attr10");
            return (Criteria) this;
        }

        public Criteria andAttr10GreaterThan(Integer value) {
            addCriterion("attr10 >", value, "attr10");
            return (Criteria) this;
        }

        public Criteria andAttr10GreaterThanOrEqualTo(Integer value) {
            addCriterion("attr10 >=", value, "attr10");
            return (Criteria) this;
        }

        public Criteria andAttr10LessThan(Integer value) {
            addCriterion("attr10 <", value, "attr10");
            return (Criteria) this;
        }

        public Criteria andAttr10LessThanOrEqualTo(Integer value) {
            addCriterion("attr10 <=", value, "attr10");
            return (Criteria) this;
        }

        public Criteria andAttr10In(List<Integer> values) {
            addCriterion("attr10 in", values, "attr10");
            return (Criteria) this;
        }

        public Criteria andAttr10NotIn(List<Integer> values) {
            addCriterion("attr10 not in", values, "attr10");
            return (Criteria) this;
        }

        public Criteria andAttr10Between(Integer value1, Integer value2) {
            addCriterion("attr10 between", value1, value2, "attr10");
            return (Criteria) this;
        }

        public Criteria andAttr10NotBetween(Integer value1, Integer value2) {
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

        public Criteria andAttr11EqualTo(Integer value) {
            addCriterion("attr11 =", value, "attr11");
            return (Criteria) this;
        }

        public Criteria andAttr11NotEqualTo(Integer value) {
            addCriterion("attr11 <>", value, "attr11");
            return (Criteria) this;
        }

        public Criteria andAttr11GreaterThan(Integer value) {
            addCriterion("attr11 >", value, "attr11");
            return (Criteria) this;
        }

        public Criteria andAttr11GreaterThanOrEqualTo(Integer value) {
            addCriterion("attr11 >=", value, "attr11");
            return (Criteria) this;
        }

        public Criteria andAttr11LessThan(Integer value) {
            addCriterion("attr11 <", value, "attr11");
            return (Criteria) this;
        }

        public Criteria andAttr11LessThanOrEqualTo(Integer value) {
            addCriterion("attr11 <=", value, "attr11");
            return (Criteria) this;
        }

        public Criteria andAttr11In(List<Integer> values) {
            addCriterion("attr11 in", values, "attr11");
            return (Criteria) this;
        }

        public Criteria andAttr11NotIn(List<Integer> values) {
            addCriterion("attr11 not in", values, "attr11");
            return (Criteria) this;
        }

        public Criteria andAttr11Between(Integer value1, Integer value2) {
            addCriterion("attr11 between", value1, value2, "attr11");
            return (Criteria) this;
        }

        public Criteria andAttr11NotBetween(Integer value1, Integer value2) {
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

        public Criteria andAttr12EqualTo(Integer value) {
            addCriterion("attr12 =", value, "attr12");
            return (Criteria) this;
        }

        public Criteria andAttr12NotEqualTo(Integer value) {
            addCriterion("attr12 <>", value, "attr12");
            return (Criteria) this;
        }

        public Criteria andAttr12GreaterThan(Integer value) {
            addCriterion("attr12 >", value, "attr12");
            return (Criteria) this;
        }

        public Criteria andAttr12GreaterThanOrEqualTo(Integer value) {
            addCriterion("attr12 >=", value, "attr12");
            return (Criteria) this;
        }

        public Criteria andAttr12LessThan(Integer value) {
            addCriterion("attr12 <", value, "attr12");
            return (Criteria) this;
        }

        public Criteria andAttr12LessThanOrEqualTo(Integer value) {
            addCriterion("attr12 <=", value, "attr12");
            return (Criteria) this;
        }

        public Criteria andAttr12In(List<Integer> values) {
            addCriterion("attr12 in", values, "attr12");
            return (Criteria) this;
        }

        public Criteria andAttr12NotIn(List<Integer> values) {
            addCriterion("attr12 not in", values, "attr12");
            return (Criteria) this;
        }

        public Criteria andAttr12Between(Integer value1, Integer value2) {
            addCriterion("attr12 between", value1, value2, "attr12");
            return (Criteria) this;
        }

        public Criteria andAttr12NotBetween(Integer value1, Integer value2) {
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

        public Criteria andAttr13EqualTo(Integer value) {
            addCriterion("attr13 =", value, "attr13");
            return (Criteria) this;
        }

        public Criteria andAttr13NotEqualTo(Integer value) {
            addCriterion("attr13 <>", value, "attr13");
            return (Criteria) this;
        }

        public Criteria andAttr13GreaterThan(Integer value) {
            addCriterion("attr13 >", value, "attr13");
            return (Criteria) this;
        }

        public Criteria andAttr13GreaterThanOrEqualTo(Integer value) {
            addCriterion("attr13 >=", value, "attr13");
            return (Criteria) this;
        }

        public Criteria andAttr13LessThan(Integer value) {
            addCriterion("attr13 <", value, "attr13");
            return (Criteria) this;
        }

        public Criteria andAttr13LessThanOrEqualTo(Integer value) {
            addCriterion("attr13 <=", value, "attr13");
            return (Criteria) this;
        }

        public Criteria andAttr13In(List<Integer> values) {
            addCriterion("attr13 in", values, "attr13");
            return (Criteria) this;
        }

        public Criteria andAttr13NotIn(List<Integer> values) {
            addCriterion("attr13 not in", values, "attr13");
            return (Criteria) this;
        }

        public Criteria andAttr13Between(Integer value1, Integer value2) {
            addCriterion("attr13 between", value1, value2, "attr13");
            return (Criteria) this;
        }

        public Criteria andAttr13NotBetween(Integer value1, Integer value2) {
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

        public Criteria andAttr14EqualTo(Integer value) {
            addCriterion("attr14 =", value, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14NotEqualTo(Integer value) {
            addCriterion("attr14 <>", value, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14GreaterThan(Integer value) {
            addCriterion("attr14 >", value, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14GreaterThanOrEqualTo(Integer value) {
            addCriterion("attr14 >=", value, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14LessThan(Integer value) {
            addCriterion("attr14 <", value, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14LessThanOrEqualTo(Integer value) {
            addCriterion("attr14 <=", value, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14In(List<Integer> values) {
            addCriterion("attr14 in", values, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14NotIn(List<Integer> values) {
            addCriterion("attr14 not in", values, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14Between(Integer value1, Integer value2) {
            addCriterion("attr14 between", value1, value2, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14NotBetween(Integer value1, Integer value2) {
            addCriterion("attr14 not between", value1, value2, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr15IsNull() {
            addCriterion("attr15 is null");
            return (Criteria) this;
        }

        public Criteria andAttr15IsNotNull() {
            addCriterion("attr15 is not null");
            return (Criteria) this;
        }

        public Criteria andAttr15EqualTo(Integer value) {
            addCriterion("attr15 =", value, "attr15");
            return (Criteria) this;
        }

        public Criteria andAttr15NotEqualTo(Integer value) {
            addCriterion("attr15 <>", value, "attr15");
            return (Criteria) this;
        }

        public Criteria andAttr15GreaterThan(Integer value) {
            addCriterion("attr15 >", value, "attr15");
            return (Criteria) this;
        }

        public Criteria andAttr15GreaterThanOrEqualTo(Integer value) {
            addCriterion("attr15 >=", value, "attr15");
            return (Criteria) this;
        }

        public Criteria andAttr15LessThan(Integer value) {
            addCriterion("attr15 <", value, "attr15");
            return (Criteria) this;
        }

        public Criteria andAttr15LessThanOrEqualTo(Integer value) {
            addCriterion("attr15 <=", value, "attr15");
            return (Criteria) this;
        }

        public Criteria andAttr15In(List<Integer> values) {
            addCriterion("attr15 in", values, "attr15");
            return (Criteria) this;
        }

        public Criteria andAttr15NotIn(List<Integer> values) {
            addCriterion("attr15 not in", values, "attr15");
            return (Criteria) this;
        }

        public Criteria andAttr15Between(Integer value1, Integer value2) {
            addCriterion("attr15 between", value1, value2, "attr15");
            return (Criteria) this;
        }

        public Criteria andAttr15NotBetween(Integer value1, Integer value2) {
            addCriterion("attr15 not between", value1, value2, "attr15");
            return (Criteria) this;
        }

        public Criteria andAttr16IsNull() {
            addCriterion("attr16 is null");
            return (Criteria) this;
        }

        public Criteria andAttr16IsNotNull() {
            addCriterion("attr16 is not null");
            return (Criteria) this;
        }

        public Criteria andAttr16EqualTo(Long value) {
            addCriterion("attr16 =", value, "attr16");
            return (Criteria) this;
        }

        public Criteria andAttr16NotEqualTo(Long value) {
            addCriterion("attr16 <>", value, "attr16");
            return (Criteria) this;
        }

        public Criteria andAttr16GreaterThan(Long value) {
            addCriterion("attr16 >", value, "attr16");
            return (Criteria) this;
        }

        public Criteria andAttr16GreaterThanOrEqualTo(Long value) {
            addCriterion("attr16 >=", value, "attr16");
            return (Criteria) this;
        }

        public Criteria andAttr16LessThan(Long value) {
            addCriterion("attr16 <", value, "attr16");
            return (Criteria) this;
        }

        public Criteria andAttr16LessThanOrEqualTo(Long value) {
            addCriterion("attr16 <=", value, "attr16");
            return (Criteria) this;
        }

        public Criteria andAttr16In(List<Long> values) {
            addCriterion("attr16 in", values, "attr16");
            return (Criteria) this;
        }

        public Criteria andAttr16NotIn(List<Long> values) {
            addCriterion("attr16 not in", values, "attr16");
            return (Criteria) this;
        }

        public Criteria andAttr16Between(Long value1, Long value2) {
            addCriterion("attr16 between", value1, value2, "attr16");
            return (Criteria) this;
        }

        public Criteria andAttr16NotBetween(Long value1, Long value2) {
            addCriterion("attr16 not between", value1, value2, "attr16");
            return (Criteria) this;
        }

        public Criteria andAttr17IsNull() {
            addCriterion("attr17 is null");
            return (Criteria) this;
        }

        public Criteria andAttr17IsNotNull() {
            addCriterion("attr17 is not null");
            return (Criteria) this;
        }

        public Criteria andAttr17EqualTo(Long value) {
            addCriterion("attr17 =", value, "attr17");
            return (Criteria) this;
        }

        public Criteria andAttr17NotEqualTo(Long value) {
            addCriterion("attr17 <>", value, "attr17");
            return (Criteria) this;
        }

        public Criteria andAttr17GreaterThan(Long value) {
            addCriterion("attr17 >", value, "attr17");
            return (Criteria) this;
        }

        public Criteria andAttr17GreaterThanOrEqualTo(Long value) {
            addCriterion("attr17 >=", value, "attr17");
            return (Criteria) this;
        }

        public Criteria andAttr17LessThan(Long value) {
            addCriterion("attr17 <", value, "attr17");
            return (Criteria) this;
        }

        public Criteria andAttr17LessThanOrEqualTo(Long value) {
            addCriterion("attr17 <=", value, "attr17");
            return (Criteria) this;
        }

        public Criteria andAttr17In(List<Long> values) {
            addCriterion("attr17 in", values, "attr17");
            return (Criteria) this;
        }

        public Criteria andAttr17NotIn(List<Long> values) {
            addCriterion("attr17 not in", values, "attr17");
            return (Criteria) this;
        }

        public Criteria andAttr17Between(Long value1, Long value2) {
            addCriterion("attr17 between", value1, value2, "attr17");
            return (Criteria) this;
        }

        public Criteria andAttr17NotBetween(Long value1, Long value2) {
            addCriterion("attr17 not between", value1, value2, "attr17");
            return (Criteria) this;
        }

        public Criteria andAttr18IsNull() {
            addCriterion("attr18 is null");
            return (Criteria) this;
        }

        public Criteria andAttr18IsNotNull() {
            addCriterion("attr18 is not null");
            return (Criteria) this;
        }

        public Criteria andAttr18EqualTo(Long value) {
            addCriterion("attr18 =", value, "attr18");
            return (Criteria) this;
        }

        public Criteria andAttr18NotEqualTo(Long value) {
            addCriterion("attr18 <>", value, "attr18");
            return (Criteria) this;
        }

        public Criteria andAttr18GreaterThan(Long value) {
            addCriterion("attr18 >", value, "attr18");
            return (Criteria) this;
        }

        public Criteria andAttr18GreaterThanOrEqualTo(Long value) {
            addCriterion("attr18 >=", value, "attr18");
            return (Criteria) this;
        }

        public Criteria andAttr18LessThan(Long value) {
            addCriterion("attr18 <", value, "attr18");
            return (Criteria) this;
        }

        public Criteria andAttr18LessThanOrEqualTo(Long value) {
            addCriterion("attr18 <=", value, "attr18");
            return (Criteria) this;
        }

        public Criteria andAttr18In(List<Long> values) {
            addCriterion("attr18 in", values, "attr18");
            return (Criteria) this;
        }

        public Criteria andAttr18NotIn(List<Long> values) {
            addCriterion("attr18 not in", values, "attr18");
            return (Criteria) this;
        }

        public Criteria andAttr18Between(Long value1, Long value2) {
            addCriterion("attr18 between", value1, value2, "attr18");
            return (Criteria) this;
        }

        public Criteria andAttr18NotBetween(Long value1, Long value2) {
            addCriterion("attr18 not between", value1, value2, "attr18");
            return (Criteria) this;
        }

        public Criteria andAttr19IsNull() {
            addCriterion("attr19 is null");
            return (Criteria) this;
        }

        public Criteria andAttr19IsNotNull() {
            addCriterion("attr19 is not null");
            return (Criteria) this;
        }

        public Criteria andAttr19EqualTo(Long value) {
            addCriterion("attr19 =", value, "attr19");
            return (Criteria) this;
        }

        public Criteria andAttr19NotEqualTo(Long value) {
            addCriterion("attr19 <>", value, "attr19");
            return (Criteria) this;
        }

        public Criteria andAttr19GreaterThan(Long value) {
            addCriterion("attr19 >", value, "attr19");
            return (Criteria) this;
        }

        public Criteria andAttr19GreaterThanOrEqualTo(Long value) {
            addCriterion("attr19 >=", value, "attr19");
            return (Criteria) this;
        }

        public Criteria andAttr19LessThan(Long value) {
            addCriterion("attr19 <", value, "attr19");
            return (Criteria) this;
        }

        public Criteria andAttr19LessThanOrEqualTo(Long value) {
            addCriterion("attr19 <=", value, "attr19");
            return (Criteria) this;
        }

        public Criteria andAttr19In(List<Long> values) {
            addCriterion("attr19 in", values, "attr19");
            return (Criteria) this;
        }

        public Criteria andAttr19NotIn(List<Long> values) {
            addCriterion("attr19 not in", values, "attr19");
            return (Criteria) this;
        }

        public Criteria andAttr19Between(Long value1, Long value2) {
            addCriterion("attr19 between", value1, value2, "attr19");
            return (Criteria) this;
        }

        public Criteria andAttr19NotBetween(Long value1, Long value2) {
            addCriterion("attr19 not between", value1, value2, "attr19");
            return (Criteria) this;
        }

        public Criteria andAttr20IsNull() {
            addCriterion("attr20 is null");
            return (Criteria) this;
        }

        public Criteria andAttr20IsNotNull() {
            addCriterion("attr20 is not null");
            return (Criteria) this;
        }

        public Criteria andAttr20EqualTo(Double value) {
            addCriterion("attr20 =", value, "attr20");
            return (Criteria) this;
        }

        public Criteria andAttr20NotEqualTo(Double value) {
            addCriterion("attr20 <>", value, "attr20");
            return (Criteria) this;
        }

        public Criteria andAttr20GreaterThan(Double value) {
            addCriterion("attr20 >", value, "attr20");
            return (Criteria) this;
        }

        public Criteria andAttr20GreaterThanOrEqualTo(Double value) {
            addCriterion("attr20 >=", value, "attr20");
            return (Criteria) this;
        }

        public Criteria andAttr20LessThan(Double value) {
            addCriterion("attr20 <", value, "attr20");
            return (Criteria) this;
        }

        public Criteria andAttr20LessThanOrEqualTo(Double value) {
            addCriterion("attr20 <=", value, "attr20");
            return (Criteria) this;
        }

        public Criteria andAttr20In(List<Double> values) {
            addCriterion("attr20 in", values, "attr20");
            return (Criteria) this;
        }

        public Criteria andAttr20NotIn(List<Double> values) {
            addCriterion("attr20 not in", values, "attr20");
            return (Criteria) this;
        }

        public Criteria andAttr20Between(Double value1, Double value2) {
            addCriterion("attr20 between", value1, value2, "attr20");
            return (Criteria) this;
        }

        public Criteria andAttr20NotBetween(Double value1, Double value2) {
            addCriterion("attr20 not between", value1, value2, "attr20");
            return (Criteria) this;
        }

        public Criteria andAttr21IsNull() {
            addCriterion("attr21 is null");
            return (Criteria) this;
        }

        public Criteria andAttr21IsNotNull() {
            addCriterion("attr21 is not null");
            return (Criteria) this;
        }

        public Criteria andAttr21EqualTo(Double value) {
            addCriterion("attr21 =", value, "attr21");
            return (Criteria) this;
        }

        public Criteria andAttr21NotEqualTo(Double value) {
            addCriterion("attr21 <>", value, "attr21");
            return (Criteria) this;
        }

        public Criteria andAttr21GreaterThan(Double value) {
            addCriterion("attr21 >", value, "attr21");
            return (Criteria) this;
        }

        public Criteria andAttr21GreaterThanOrEqualTo(Double value) {
            addCriterion("attr21 >=", value, "attr21");
            return (Criteria) this;
        }

        public Criteria andAttr21LessThan(Double value) {
            addCriterion("attr21 <", value, "attr21");
            return (Criteria) this;
        }

        public Criteria andAttr21LessThanOrEqualTo(Double value) {
            addCriterion("attr21 <=", value, "attr21");
            return (Criteria) this;
        }

        public Criteria andAttr21In(List<Double> values) {
            addCriterion("attr21 in", values, "attr21");
            return (Criteria) this;
        }

        public Criteria andAttr21NotIn(List<Double> values) {
            addCriterion("attr21 not in", values, "attr21");
            return (Criteria) this;
        }

        public Criteria andAttr21Between(Double value1, Double value2) {
            addCriterion("attr21 between", value1, value2, "attr21");
            return (Criteria) this;
        }

        public Criteria andAttr21NotBetween(Double value1, Double value2) {
            addCriterion("attr21 not between", value1, value2, "attr21");
            return (Criteria) this;
        }

        public Criteria andAttr22IsNull() {
            addCriterion("attr22 is null");
            return (Criteria) this;
        }

        public Criteria andAttr22IsNotNull() {
            addCriterion("attr22 is not null");
            return (Criteria) this;
        }

        public Criteria andAttr22EqualTo(Long value) {
            addCriterion("attr22 =", value, "attr22");
            return (Criteria) this;
        }

        public Criteria andAttr22NotEqualTo(Long value) {
            addCriterion("attr22 <>", value, "attr22");
            return (Criteria) this;
        }

        public Criteria andAttr22GreaterThan(Long value) {
            addCriterion("attr22 >", value, "attr22");
            return (Criteria) this;
        }

        public Criteria andAttr22GreaterThanOrEqualTo(Long value) {
            addCriterion("attr22 >=", value, "attr22");
            return (Criteria) this;
        }

        public Criteria andAttr22LessThan(Long value) {
            addCriterion("attr22 <", value, "attr22");
            return (Criteria) this;
        }

        public Criteria andAttr22LessThanOrEqualTo(Long value) {
            addCriterion("attr22 <=", value, "attr22");
            return (Criteria) this;
        }

        public Criteria andAttr22In(List<Long> values) {
            addCriterion("attr22 in", values, "attr22");
            return (Criteria) this;
        }

        public Criteria andAttr22NotIn(List<Long> values) {
            addCriterion("attr22 not in", values, "attr22");
            return (Criteria) this;
        }

        public Criteria andAttr22Between(Long value1, Long value2) {
            addCriterion("attr22 between", value1, value2, "attr22");
            return (Criteria) this;
        }

        public Criteria andAttr22NotBetween(Long value1, Long value2) {
            addCriterion("attr22 not between", value1, value2, "attr22");
            return (Criteria) this;
        }

        public Criteria andAttr23IsNull() {
            addCriterion("attr23 is null");
            return (Criteria) this;
        }

        public Criteria andAttr23IsNotNull() {
            addCriterion("attr23 is not null");
            return (Criteria) this;
        }

        public Criteria andAttr23EqualTo(Long value) {
            addCriterion("attr23 =", value, "attr23");
            return (Criteria) this;
        }

        public Criteria andAttr23NotEqualTo(Long value) {
            addCriterion("attr23 <>", value, "attr23");
            return (Criteria) this;
        }

        public Criteria andAttr23GreaterThan(Long value) {
            addCriterion("attr23 >", value, "attr23");
            return (Criteria) this;
        }

        public Criteria andAttr23GreaterThanOrEqualTo(Long value) {
            addCriterion("attr23 >=", value, "attr23");
            return (Criteria) this;
        }

        public Criteria andAttr23LessThan(Long value) {
            addCriterion("attr23 <", value, "attr23");
            return (Criteria) this;
        }

        public Criteria andAttr23LessThanOrEqualTo(Long value) {
            addCriterion("attr23 <=", value, "attr23");
            return (Criteria) this;
        }

        public Criteria andAttr23In(List<Long> values) {
            addCriterion("attr23 in", values, "attr23");
            return (Criteria) this;
        }

        public Criteria andAttr23NotIn(List<Long> values) {
            addCriterion("attr23 not in", values, "attr23");
            return (Criteria) this;
        }

        public Criteria andAttr23Between(Long value1, Long value2) {
            addCriterion("attr23 between", value1, value2, "attr23");
            return (Criteria) this;
        }

        public Criteria andAttr23NotBetween(Long value1, Long value2) {
            addCriterion("attr23 not between", value1, value2, "attr23");
            return (Criteria) this;
        }

        public Criteria andAttr24IsNull() {
            addCriterion("attr24 is null");
            return (Criteria) this;
        }

        public Criteria andAttr24IsNotNull() {
            addCriterion("attr24 is not null");
            return (Criteria) this;
        }

        public Criteria andAttr24EqualTo(Integer value) {
            addCriterion("attr24 =", value, "attr24");
            return (Criteria) this;
        }

        public Criteria andAttr24NotEqualTo(Integer value) {
            addCriterion("attr24 <>", value, "attr24");
            return (Criteria) this;
        }

        public Criteria andAttr24GreaterThan(Integer value) {
            addCriterion("attr24 >", value, "attr24");
            return (Criteria) this;
        }

        public Criteria andAttr24GreaterThanOrEqualTo(Integer value) {
            addCriterion("attr24 >=", value, "attr24");
            return (Criteria) this;
        }

        public Criteria andAttr24LessThan(Integer value) {
            addCriterion("attr24 <", value, "attr24");
            return (Criteria) this;
        }

        public Criteria andAttr24LessThanOrEqualTo(Integer value) {
            addCriterion("attr24 <=", value, "attr24");
            return (Criteria) this;
        }

        public Criteria andAttr24In(List<Integer> values) {
            addCriterion("attr24 in", values, "attr24");
            return (Criteria) this;
        }

        public Criteria andAttr24NotIn(List<Integer> values) {
            addCriterion("attr24 not in", values, "attr24");
            return (Criteria) this;
        }

        public Criteria andAttr24Between(Integer value1, Integer value2) {
            addCriterion("attr24 between", value1, value2, "attr24");
            return (Criteria) this;
        }

        public Criteria andAttr24NotBetween(Integer value1, Integer value2) {
            addCriterion("attr24 not between", value1, value2, "attr24");
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