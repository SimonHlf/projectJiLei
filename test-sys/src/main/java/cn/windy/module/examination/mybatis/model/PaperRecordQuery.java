package cn.windy.module.examination.mybatis.model;

import java.util.ArrayList;
import java.util.List;

public class PaperRecordQuery {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    protected Integer pageNo = 1;

    protected Integer startRow;

    protected Integer pageSize = 10;

    protected String fields;

    public PaperRecordQuery() {
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

        public Criteria andUseridIsNull() {
            addCriterion("userId is null");
            return (Criteria) this;
        }

        public Criteria andUseridIsNotNull() {
            addCriterion("userId is not null");
            return (Criteria) this;
        }

        public Criteria andUseridEqualTo(Long value) {
            addCriterion("userId =", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridNotEqualTo(Long value) {
            addCriterion("userId <>", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridGreaterThan(Long value) {
            addCriterion("userId >", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridGreaterThanOrEqualTo(Long value) {
            addCriterion("userId >=", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridLessThan(Long value) {
            addCriterion("userId <", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridLessThanOrEqualTo(Long value) {
            addCriterion("userId <=", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridIn(List<Long> values) {
            addCriterion("userId in", values, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridNotIn(List<Long> values) {
            addCriterion("userId not in", values, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridBetween(Long value1, Long value2) {
            addCriterion("userId between", value1, value2, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridNotBetween(Long value1, Long value2) {
            addCriterion("userId not between", value1, value2, "userid");
            return (Criteria) this;
        }

        public Criteria andAudioidIsNull() {
            addCriterion("audioId is null");
            return (Criteria) this;
        }

        public Criteria andAudioidIsNotNull() {
            addCriterion("audioId is not null");
            return (Criteria) this;
        }

        public Criteria andAudioidEqualTo(Integer value) {
            addCriterion("audioId =", value, "audioid");
            return (Criteria) this;
        }

        public Criteria andAudioidNotEqualTo(Integer value) {
            addCriterion("audioId <>", value, "audioid");
            return (Criteria) this;
        }

        public Criteria andAudioidGreaterThan(Integer value) {
            addCriterion("audioId >", value, "audioid");
            return (Criteria) this;
        }

        public Criteria andAudioidGreaterThanOrEqualTo(Integer value) {
            addCriterion("audioId >=", value, "audioid");
            return (Criteria) this;
        }

        public Criteria andAudioidLessThan(Integer value) {
            addCriterion("audioId <", value, "audioid");
            return (Criteria) this;
        }

        public Criteria andAudioidLessThanOrEqualTo(Integer value) {
            addCriterion("audioId <=", value, "audioid");
            return (Criteria) this;
        }

        public Criteria andAudioidIn(List<Integer> values) {
            addCriterion("audioId in", values, "audioid");
            return (Criteria) this;
        }

        public Criteria andAudioidNotIn(List<Integer> values) {
            addCriterion("audioId not in", values, "audioid");
            return (Criteria) this;
        }

        public Criteria andAudioidBetween(Integer value1, Integer value2) {
            addCriterion("audioId between", value1, value2, "audioid");
            return (Criteria) this;
        }

        public Criteria andAudioidNotBetween(Integer value1, Integer value2) {
            addCriterion("audioId not between", value1, value2, "audioid");
            return (Criteria) this;
        }

        public Criteria andOptionidIsNull() {
            addCriterion("optionId is null");
            return (Criteria) this;
        }

        public Criteria andOptionidIsNotNull() {
            addCriterion("optionId is not null");
            return (Criteria) this;
        }

        public Criteria andOptionidEqualTo(String value) {
            addCriterion("optionId =", value, "optionid");
            return (Criteria) this;
        }

        public Criteria andOptionidNotEqualTo(String value) {
            addCriterion("optionId <>", value, "optionid");
            return (Criteria) this;
        }

        public Criteria andOptionidGreaterThan(String value) {
            addCriterion("optionId >", value, "optionid");
            return (Criteria) this;
        }

        public Criteria andOptionidGreaterThanOrEqualTo(String value) {
            addCriterion("optionId >=", value, "optionid");
            return (Criteria) this;
        }

        public Criteria andOptionidLessThan(String value) {
            addCriterion("optionId <", value, "optionid");
            return (Criteria) this;
        }

        public Criteria andOptionidLessThanOrEqualTo(String value) {
            addCriterion("optionId <=", value, "optionid");
            return (Criteria) this;
        }

        public Criteria andOptionidLike(String value) {
            addCriterion("optionId like", value, "optionid");
            return (Criteria) this;
        }

        public Criteria andOptionidNotLike(String value) {
            addCriterion("optionId not like", value, "optionid");
            return (Criteria) this;
        }

        public Criteria andOptionidIn(List<String> values) {
            addCriterion("optionId in", values, "optionid");
            return (Criteria) this;
        }

        public Criteria andOptionidNotIn(List<String> values) {
            addCriterion("optionId not in", values, "optionid");
            return (Criteria) this;
        }

        public Criteria andOptionidBetween(String value1, String value2) {
            addCriterion("optionId between", value1, value2, "optionid");
            return (Criteria) this;
        }

        public Criteria andOptionidNotBetween(String value1, String value2) {
            addCriterion("optionId not between", value1, value2, "optionid");
            return (Criteria) this;
        }

        public Criteria andOptionanswerIsNull() {
            addCriterion("optionAnswer is null");
            return (Criteria) this;
        }

        public Criteria andOptionanswerIsNotNull() {
            addCriterion("optionAnswer is not null");
            return (Criteria) this;
        }

        public Criteria andOptionanswerEqualTo(String value) {
            addCriterion("optionAnswer =", value, "optionanswer");
            return (Criteria) this;
        }

        public Criteria andOptionanswerNotEqualTo(String value) {
            addCriterion("optionAnswer <>", value, "optionanswer");
            return (Criteria) this;
        }

        public Criteria andOptionanswerGreaterThan(String value) {
            addCriterion("optionAnswer >", value, "optionanswer");
            return (Criteria) this;
        }

        public Criteria andOptionanswerGreaterThanOrEqualTo(String value) {
            addCriterion("optionAnswer >=", value, "optionanswer");
            return (Criteria) this;
        }

        public Criteria andOptionanswerLessThan(String value) {
            addCriterion("optionAnswer <", value, "optionanswer");
            return (Criteria) this;
        }

        public Criteria andOptionanswerLessThanOrEqualTo(String value) {
            addCriterion("optionAnswer <=", value, "optionanswer");
            return (Criteria) this;
        }

        public Criteria andOptionanswerLike(String value) {
            addCriterion("optionAnswer like", value, "optionanswer");
            return (Criteria) this;
        }

        public Criteria andOptionanswerNotLike(String value) {
            addCriterion("optionAnswer not like", value, "optionanswer");
            return (Criteria) this;
        }

        public Criteria andOptionanswerIn(List<String> values) {
            addCriterion("optionAnswer in", values, "optionanswer");
            return (Criteria) this;
        }

        public Criteria andOptionanswerNotIn(List<String> values) {
            addCriterion("optionAnswer not in", values, "optionanswer");
            return (Criteria) this;
        }

        public Criteria andOptionanswerBetween(String value1, String value2) {
            addCriterion("optionAnswer between", value1, value2, "optionanswer");
            return (Criteria) this;
        }

        public Criteria andOptionanswerNotBetween(String value1, String value2) {
            addCriterion("optionAnswer not between", value1, value2, "optionanswer");
            return (Criteria) this;
        }

        public Criteria andDecididIsNull() {
            addCriterion("decidId is null");
            return (Criteria) this;
        }

        public Criteria andDecididIsNotNull() {
            addCriterion("decidId is not null");
            return (Criteria) this;
        }

        public Criteria andDecididEqualTo(String value) {
            addCriterion("decidId =", value, "decidid");
            return (Criteria) this;
        }

        public Criteria andDecididNotEqualTo(String value) {
            addCriterion("decidId <>", value, "decidid");
            return (Criteria) this;
        }

        public Criteria andDecididGreaterThan(String value) {
            addCriterion("decidId >", value, "decidid");
            return (Criteria) this;
        }

        public Criteria andDecididGreaterThanOrEqualTo(String value) {
            addCriterion("decidId >=", value, "decidid");
            return (Criteria) this;
        }

        public Criteria andDecididLessThan(String value) {
            addCriterion("decidId <", value, "decidid");
            return (Criteria) this;
        }

        public Criteria andDecididLessThanOrEqualTo(String value) {
            addCriterion("decidId <=", value, "decidid");
            return (Criteria) this;
        }

        public Criteria andDecididLike(String value) {
            addCriterion("decidId like", value, "decidid");
            return (Criteria) this;
        }

        public Criteria andDecididNotLike(String value) {
            addCriterion("decidId not like", value, "decidid");
            return (Criteria) this;
        }

        public Criteria andDecididIn(List<String> values) {
            addCriterion("decidId in", values, "decidid");
            return (Criteria) this;
        }

        public Criteria andDecididNotIn(List<String> values) {
            addCriterion("decidId not in", values, "decidid");
            return (Criteria) this;
        }

        public Criteria andDecididBetween(String value1, String value2) {
            addCriterion("decidId between", value1, value2, "decidid");
            return (Criteria) this;
        }

        public Criteria andDecididNotBetween(String value1, String value2) {
            addCriterion("decidId not between", value1, value2, "decidid");
            return (Criteria) this;
        }

        public Criteria andDecidanswerIsNull() {
            addCriterion("decidAnswer is null");
            return (Criteria) this;
        }

        public Criteria andDecidanswerIsNotNull() {
            addCriterion("decidAnswer is not null");
            return (Criteria) this;
        }

        public Criteria andDecidanswerEqualTo(String value) {
            addCriterion("decidAnswer =", value, "decidanswer");
            return (Criteria) this;
        }

        public Criteria andDecidanswerNotEqualTo(String value) {
            addCriterion("decidAnswer <>", value, "decidanswer");
            return (Criteria) this;
        }

        public Criteria andDecidanswerGreaterThan(String value) {
            addCriterion("decidAnswer >", value, "decidanswer");
            return (Criteria) this;
        }

        public Criteria andDecidanswerGreaterThanOrEqualTo(String value) {
            addCriterion("decidAnswer >=", value, "decidanswer");
            return (Criteria) this;
        }

        public Criteria andDecidanswerLessThan(String value) {
            addCriterion("decidAnswer <", value, "decidanswer");
            return (Criteria) this;
        }

        public Criteria andDecidanswerLessThanOrEqualTo(String value) {
            addCriterion("decidAnswer <=", value, "decidanswer");
            return (Criteria) this;
        }

        public Criteria andDecidanswerLike(String value) {
            addCriterion("decidAnswer like", value, "decidanswer");
            return (Criteria) this;
        }

        public Criteria andDecidanswerNotLike(String value) {
            addCriterion("decidAnswer not like", value, "decidanswer");
            return (Criteria) this;
        }

        public Criteria andDecidanswerIn(List<String> values) {
            addCriterion("decidAnswer in", values, "decidanswer");
            return (Criteria) this;
        }

        public Criteria andDecidanswerNotIn(List<String> values) {
            addCriterion("decidAnswer not in", values, "decidanswer");
            return (Criteria) this;
        }

        public Criteria andDecidanswerBetween(String value1, String value2) {
            addCriterion("decidAnswer between", value1, value2, "decidanswer");
            return (Criteria) this;
        }

        public Criteria andDecidanswerNotBetween(String value1, String value2) {
            addCriterion("decidAnswer not between", value1, value2, "decidanswer");
            return (Criteria) this;
        }

        public Criteria andOptionmoreansweridIsNull() {
            addCriterion("optionMoreAnswerId is null");
            return (Criteria) this;
        }

        public Criteria andOptionmoreansweridIsNotNull() {
            addCriterion("optionMoreAnswerId is not null");
            return (Criteria) this;
        }

        public Criteria andOptionmoreansweridEqualTo(String value) {
            addCriterion("optionMoreAnswerId =", value, "optionmoreanswerid");
            return (Criteria) this;
        }

        public Criteria andOptionmoreansweridNotEqualTo(String value) {
            addCriterion("optionMoreAnswerId <>", value, "optionmoreanswerid");
            return (Criteria) this;
        }

        public Criteria andOptionmoreansweridGreaterThan(String value) {
            addCriterion("optionMoreAnswerId >", value, "optionmoreanswerid");
            return (Criteria) this;
        }

        public Criteria andOptionmoreansweridGreaterThanOrEqualTo(String value) {
            addCriterion("optionMoreAnswerId >=", value, "optionmoreanswerid");
            return (Criteria) this;
        }

        public Criteria andOptionmoreansweridLessThan(String value) {
            addCriterion("optionMoreAnswerId <", value, "optionmoreanswerid");
            return (Criteria) this;
        }

        public Criteria andOptionmoreansweridLessThanOrEqualTo(String value) {
            addCriterion("optionMoreAnswerId <=", value, "optionmoreanswerid");
            return (Criteria) this;
        }

        public Criteria andOptionmoreansweridLike(String value) {
            addCriterion("optionMoreAnswerId like", value, "optionmoreanswerid");
            return (Criteria) this;
        }

        public Criteria andOptionmoreansweridNotLike(String value) {
            addCriterion("optionMoreAnswerId not like", value, "optionmoreanswerid");
            return (Criteria) this;
        }

        public Criteria andOptionmoreansweridIn(List<String> values) {
            addCriterion("optionMoreAnswerId in", values, "optionmoreanswerid");
            return (Criteria) this;
        }

        public Criteria andOptionmoreansweridNotIn(List<String> values) {
            addCriterion("optionMoreAnswerId not in", values, "optionmoreanswerid");
            return (Criteria) this;
        }

        public Criteria andOptionmoreansweridBetween(String value1, String value2) {
            addCriterion("optionMoreAnswerId between", value1, value2, "optionmoreanswerid");
            return (Criteria) this;
        }

        public Criteria andOptionmoreansweridNotBetween(String value1, String value2) {
            addCriterion("optionMoreAnswerId not between", value1, value2, "optionmoreanswerid");
            return (Criteria) this;
        }

        public Criteria andOptionmoreanswerIsNull() {
            addCriterion("optionMoreAnswer is null");
            return (Criteria) this;
        }

        public Criteria andOptionmoreanswerIsNotNull() {
            addCriterion("optionMoreAnswer is not null");
            return (Criteria) this;
        }

        public Criteria andOptionmoreanswerEqualTo(String value) {
            addCriterion("optionMoreAnswer =", value, "optionmoreanswer");
            return (Criteria) this;
        }

        public Criteria andOptionmoreanswerNotEqualTo(String value) {
            addCriterion("optionMoreAnswer <>", value, "optionmoreanswer");
            return (Criteria) this;
        }

        public Criteria andOptionmoreanswerGreaterThan(String value) {
            addCriterion("optionMoreAnswer >", value, "optionmoreanswer");
            return (Criteria) this;
        }

        public Criteria andOptionmoreanswerGreaterThanOrEqualTo(String value) {
            addCriterion("optionMoreAnswer >=", value, "optionmoreanswer");
            return (Criteria) this;
        }

        public Criteria andOptionmoreanswerLessThan(String value) {
            addCriterion("optionMoreAnswer <", value, "optionmoreanswer");
            return (Criteria) this;
        }

        public Criteria andOptionmoreanswerLessThanOrEqualTo(String value) {
            addCriterion("optionMoreAnswer <=", value, "optionmoreanswer");
            return (Criteria) this;
        }

        public Criteria andOptionmoreanswerLike(String value) {
            addCriterion("optionMoreAnswer like", value, "optionmoreanswer");
            return (Criteria) this;
        }

        public Criteria andOptionmoreanswerNotLike(String value) {
            addCriterion("optionMoreAnswer not like", value, "optionmoreanswer");
            return (Criteria) this;
        }

        public Criteria andOptionmoreanswerIn(List<String> values) {
            addCriterion("optionMoreAnswer in", values, "optionmoreanswer");
            return (Criteria) this;
        }

        public Criteria andOptionmoreanswerNotIn(List<String> values) {
            addCriterion("optionMoreAnswer not in", values, "optionmoreanswer");
            return (Criteria) this;
        }

        public Criteria andOptionmoreanswerBetween(String value1, String value2) {
            addCriterion("optionMoreAnswer between", value1, value2, "optionmoreanswer");
            return (Criteria) this;
        }

        public Criteria andOptionmoreanswerNotBetween(String value1, String value2) {
            addCriterion("optionMoreAnswer not between", value1, value2, "optionmoreanswer");
            return (Criteria) this;
        }

        public Criteria andOptionNumIsNull() {
            addCriterion("option_num is null");
            return (Criteria) this;
        }

        public Criteria andOptionNumIsNotNull() {
            addCriterion("option_num is not null");
            return (Criteria) this;
        }

        public Criteria andOptionNumEqualTo(Integer value) {
            addCriterion("option_num =", value, "optionNum");
            return (Criteria) this;
        }

        public Criteria andOptionNumNotEqualTo(Integer value) {
            addCriterion("option_num <>", value, "optionNum");
            return (Criteria) this;
        }

        public Criteria andOptionNumGreaterThan(Integer value) {
            addCriterion("option_num >", value, "optionNum");
            return (Criteria) this;
        }

        public Criteria andOptionNumGreaterThanOrEqualTo(Integer value) {
            addCriterion("option_num >=", value, "optionNum");
            return (Criteria) this;
        }

        public Criteria andOptionNumLessThan(Integer value) {
            addCriterion("option_num <", value, "optionNum");
            return (Criteria) this;
        }

        public Criteria andOptionNumLessThanOrEqualTo(Integer value) {
            addCriterion("option_num <=", value, "optionNum");
            return (Criteria) this;
        }

        public Criteria andOptionNumIn(List<Integer> values) {
            addCriterion("option_num in", values, "optionNum");
            return (Criteria) this;
        }

        public Criteria andOptionNumNotIn(List<Integer> values) {
            addCriterion("option_num not in", values, "optionNum");
            return (Criteria) this;
        }

        public Criteria andOptionNumBetween(Integer value1, Integer value2) {
            addCriterion("option_num between", value1, value2, "optionNum");
            return (Criteria) this;
        }

        public Criteria andOptionNumNotBetween(Integer value1, Integer value2) {
            addCriterion("option_num not between", value1, value2, "optionNum");
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

        public Criteria andAttr9EqualTo(Long value) {
            addCriterion("attr9 =", value, "attr9");
            return (Criteria) this;
        }

        public Criteria andAttr9NotEqualTo(Long value) {
            addCriterion("attr9 <>", value, "attr9");
            return (Criteria) this;
        }

        public Criteria andAttr9GreaterThan(Long value) {
            addCriterion("attr9 >", value, "attr9");
            return (Criteria) this;
        }

        public Criteria andAttr9GreaterThanOrEqualTo(Long value) {
            addCriterion("attr9 >=", value, "attr9");
            return (Criteria) this;
        }

        public Criteria andAttr9LessThan(Long value) {
            addCriterion("attr9 <", value, "attr9");
            return (Criteria) this;
        }

        public Criteria andAttr9LessThanOrEqualTo(Long value) {
            addCriterion("attr9 <=", value, "attr9");
            return (Criteria) this;
        }

        public Criteria andAttr9In(List<Long> values) {
            addCriterion("attr9 in", values, "attr9");
            return (Criteria) this;
        }

        public Criteria andAttr9NotIn(List<Long> values) {
            addCriterion("attr9 not in", values, "attr9");
            return (Criteria) this;
        }

        public Criteria andAttr9Between(Long value1, Long value2) {
            addCriterion("attr9 between", value1, value2, "attr9");
            return (Criteria) this;
        }

        public Criteria andAttr9NotBetween(Long value1, Long value2) {
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

        public Criteria andAttr12EqualTo(Double value) {
            addCriterion("attr12 =", value, "attr12");
            return (Criteria) this;
        }

        public Criteria andAttr12NotEqualTo(Double value) {
            addCriterion("attr12 <>", value, "attr12");
            return (Criteria) this;
        }

        public Criteria andAttr12GreaterThan(Double value) {
            addCriterion("attr12 >", value, "attr12");
            return (Criteria) this;
        }

        public Criteria andAttr12GreaterThanOrEqualTo(Double value) {
            addCriterion("attr12 >=", value, "attr12");
            return (Criteria) this;
        }

        public Criteria andAttr12LessThan(Double value) {
            addCriterion("attr12 <", value, "attr12");
            return (Criteria) this;
        }

        public Criteria andAttr12LessThanOrEqualTo(Double value) {
            addCriterion("attr12 <=", value, "attr12");
            return (Criteria) this;
        }

        public Criteria andAttr12In(List<Double> values) {
            addCriterion("attr12 in", values, "attr12");
            return (Criteria) this;
        }

        public Criteria andAttr12NotIn(List<Double> values) {
            addCriterion("attr12 not in", values, "attr12");
            return (Criteria) this;
        }

        public Criteria andAttr12Between(Double value1, Double value2) {
            addCriterion("attr12 between", value1, value2, "attr12");
            return (Criteria) this;
        }

        public Criteria andAttr12NotBetween(Double value1, Double value2) {
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

        public Criteria andAttr13EqualTo(Double value) {
            addCriterion("attr13 =", value, "attr13");
            return (Criteria) this;
        }

        public Criteria andAttr13NotEqualTo(Double value) {
            addCriterion("attr13 <>", value, "attr13");
            return (Criteria) this;
        }

        public Criteria andAttr13GreaterThan(Double value) {
            addCriterion("attr13 >", value, "attr13");
            return (Criteria) this;
        }

        public Criteria andAttr13GreaterThanOrEqualTo(Double value) {
            addCriterion("attr13 >=", value, "attr13");
            return (Criteria) this;
        }

        public Criteria andAttr13LessThan(Double value) {
            addCriterion("attr13 <", value, "attr13");
            return (Criteria) this;
        }

        public Criteria andAttr13LessThanOrEqualTo(Double value) {
            addCriterion("attr13 <=", value, "attr13");
            return (Criteria) this;
        }

        public Criteria andAttr13In(List<Double> values) {
            addCriterion("attr13 in", values, "attr13");
            return (Criteria) this;
        }

        public Criteria andAttr13NotIn(List<Double> values) {
            addCriterion("attr13 not in", values, "attr13");
            return (Criteria) this;
        }

        public Criteria andAttr13Between(Double value1, Double value2) {
            addCriterion("attr13 between", value1, value2, "attr13");
            return (Criteria) this;
        }

        public Criteria andAttr13NotBetween(Double value1, Double value2) {
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

        public Criteria andAttr14EqualTo(String value) {
            addCriterion("attr14 =", value, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14NotEqualTo(String value) {
            addCriterion("attr14 <>", value, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14GreaterThan(String value) {
            addCriterion("attr14 >", value, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14GreaterThanOrEqualTo(String value) {
            addCriterion("attr14 >=", value, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14LessThan(String value) {
            addCriterion("attr14 <", value, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14LessThanOrEqualTo(String value) {
            addCriterion("attr14 <=", value, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14Like(String value) {
            addCriterion("attr14 like", value, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14NotLike(String value) {
            addCriterion("attr14 not like", value, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14In(List<String> values) {
            addCriterion("attr14 in", values, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14NotIn(List<String> values) {
            addCriterion("attr14 not in", values, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14Between(String value1, String value2) {
            addCriterion("attr14 between", value1, value2, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14NotBetween(String value1, String value2) {
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

        public Criteria andAttr15EqualTo(String value) {
            addCriterion("attr15 =", value, "attr15");
            return (Criteria) this;
        }

        public Criteria andAttr15NotEqualTo(String value) {
            addCriterion("attr15 <>", value, "attr15");
            return (Criteria) this;
        }

        public Criteria andAttr15GreaterThan(String value) {
            addCriterion("attr15 >", value, "attr15");
            return (Criteria) this;
        }

        public Criteria andAttr15GreaterThanOrEqualTo(String value) {
            addCriterion("attr15 >=", value, "attr15");
            return (Criteria) this;
        }

        public Criteria andAttr15LessThan(String value) {
            addCriterion("attr15 <", value, "attr15");
            return (Criteria) this;
        }

        public Criteria andAttr15LessThanOrEqualTo(String value) {
            addCriterion("attr15 <=", value, "attr15");
            return (Criteria) this;
        }

        public Criteria andAttr15Like(String value) {
            addCriterion("attr15 like", value, "attr15");
            return (Criteria) this;
        }

        public Criteria andAttr15NotLike(String value) {
            addCriterion("attr15 not like", value, "attr15");
            return (Criteria) this;
        }

        public Criteria andAttr15In(List<String> values) {
            addCriterion("attr15 in", values, "attr15");
            return (Criteria) this;
        }

        public Criteria andAttr15NotIn(List<String> values) {
            addCriterion("attr15 not in", values, "attr15");
            return (Criteria) this;
        }

        public Criteria andAttr15Between(String value1, String value2) {
            addCriterion("attr15 between", value1, value2, "attr15");
            return (Criteria) this;
        }

        public Criteria andAttr15NotBetween(String value1, String value2) {
            addCriterion("attr15 not between", value1, value2, "attr15");
            return (Criteria) this;
        }

        public Criteria andFenIsNull() {
            addCriterion("fen is null");
            return (Criteria) this;
        }

        public Criteria andFenIsNotNull() {
            addCriterion("fen is not null");
            return (Criteria) this;
        }

        public Criteria andFenEqualTo(Double value) {
            addCriterion("fen =", value, "fen");
            return (Criteria) this;
        }

        public Criteria andFenNotEqualTo(Double value) {
            addCriterion("fen <>", value, "fen");
            return (Criteria) this;
        }

        public Criteria andFenGreaterThan(Double value) {
            addCriterion("fen >", value, "fen");
            return (Criteria) this;
        }

        public Criteria andFenGreaterThanOrEqualTo(Double value) {
            addCriterion("fen >=", value, "fen");
            return (Criteria) this;
        }

        public Criteria andFenLessThan(Double value) {
            addCriterion("fen <", value, "fen");
            return (Criteria) this;
        }

        public Criteria andFenLessThanOrEqualTo(Double value) {
            addCriterion("fen <=", value, "fen");
            return (Criteria) this;
        }

        public Criteria andFenIn(List<Double> values) {
            addCriterion("fen in", values, "fen");
            return (Criteria) this;
        }

        public Criteria andFenNotIn(List<Double> values) {
            addCriterion("fen not in", values, "fen");
            return (Criteria) this;
        }

        public Criteria andFenBetween(Double value1, Double value2) {
            addCriterion("fen between", value1, value2, "fen");
            return (Criteria) this;
        }

        public Criteria andFenNotBetween(Double value1, Double value2) {
            addCriterion("fen not between", value1, value2, "fen");
            return (Criteria) this;
        }

        public Criteria andTypeIsNull() {
            addCriterion("type is null");
            return (Criteria) this;
        }

        public Criteria andTypeIsNotNull() {
            addCriterion("type is not null");
            return (Criteria) this;
        }

        public Criteria andTypeEqualTo(Integer value) {
            addCriterion("type =", value, "type");
            return (Criteria) this;
        }

        public Criteria andTypeNotEqualTo(Integer value) {
            addCriterion("type <>", value, "type");
            return (Criteria) this;
        }

        public Criteria andTypeGreaterThan(Integer value) {
            addCriterion("type >", value, "type");
            return (Criteria) this;
        }

        public Criteria andTypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("type >=", value, "type");
            return (Criteria) this;
        }

        public Criteria andTypeLessThan(Integer value) {
            addCriterion("type <", value, "type");
            return (Criteria) this;
        }

        public Criteria andTypeLessThanOrEqualTo(Integer value) {
            addCriterion("type <=", value, "type");
            return (Criteria) this;
        }

        public Criteria andTypeIn(List<Integer> values) {
            addCriterion("type in", values, "type");
            return (Criteria) this;
        }

        public Criteria andTypeNotIn(List<Integer> values) {
            addCriterion("type not in", values, "type");
            return (Criteria) this;
        }

        public Criteria andTypeBetween(Integer value1, Integer value2) {
            addCriterion("type between", value1, value2, "type");
            return (Criteria) this;
        }

        public Criteria andTypeNotBetween(Integer value1, Integer value2) {
            addCriterion("type not between", value1, value2, "type");
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

        public Criteria andOptionanswerofuserIsNull() {
            addCriterion("optionAnswerOfUser is null");
            return (Criteria) this;
        }

        public Criteria andOptionanswerofuserIsNotNull() {
            addCriterion("optionAnswerOfUser is not null");
            return (Criteria) this;
        }

        public Criteria andOptionanswerofuserEqualTo(String value) {
            addCriterion("optionAnswerOfUser =", value, "optionanswerofuser");
            return (Criteria) this;
        }

        public Criteria andOptionanswerofuserNotEqualTo(String value) {
            addCriterion("optionAnswerOfUser <>", value, "optionanswerofuser");
            return (Criteria) this;
        }

        public Criteria andOptionanswerofuserGreaterThan(String value) {
            addCriterion("optionAnswerOfUser >", value, "optionanswerofuser");
            return (Criteria) this;
        }

        public Criteria andOptionanswerofuserGreaterThanOrEqualTo(String value) {
            addCriterion("optionAnswerOfUser >=", value, "optionanswerofuser");
            return (Criteria) this;
        }

        public Criteria andOptionanswerofuserLessThan(String value) {
            addCriterion("optionAnswerOfUser <", value, "optionanswerofuser");
            return (Criteria) this;
        }

        public Criteria andOptionanswerofuserLessThanOrEqualTo(String value) {
            addCriterion("optionAnswerOfUser <=", value, "optionanswerofuser");
            return (Criteria) this;
        }

        public Criteria andOptionanswerofuserLike(String value) {
            addCriterion("optionAnswerOfUser like", value, "optionanswerofuser");
            return (Criteria) this;
        }

        public Criteria andOptionanswerofuserNotLike(String value) {
            addCriterion("optionAnswerOfUser not like", value, "optionanswerofuser");
            return (Criteria) this;
        }

        public Criteria andOptionanswerofuserIn(List<String> values) {
            addCriterion("optionAnswerOfUser in", values, "optionanswerofuser");
            return (Criteria) this;
        }

        public Criteria andOptionanswerofuserNotIn(List<String> values) {
            addCriterion("optionAnswerOfUser not in", values, "optionanswerofuser");
            return (Criteria) this;
        }

        public Criteria andOptionanswerofuserBetween(String value1, String value2) {
            addCriterion("optionAnswerOfUser between", value1, value2, "optionanswerofuser");
            return (Criteria) this;
        }

        public Criteria andOptionanswerofuserNotBetween(String value1, String value2) {
            addCriterion("optionAnswerOfUser not between", value1, value2, "optionanswerofuser");
            return (Criteria) this;
        }

        public Criteria andDecidanswerofuserIsNull() {
            addCriterion("decidAnswerOfUser is null");
            return (Criteria) this;
        }

        public Criteria andDecidanswerofuserIsNotNull() {
            addCriterion("decidAnswerOfUser is not null");
            return (Criteria) this;
        }

        public Criteria andDecidanswerofuserEqualTo(String value) {
            addCriterion("decidAnswerOfUser =", value, "decidanswerofuser");
            return (Criteria) this;
        }

        public Criteria andDecidanswerofuserNotEqualTo(String value) {
            addCriterion("decidAnswerOfUser <>", value, "decidanswerofuser");
            return (Criteria) this;
        }

        public Criteria andDecidanswerofuserGreaterThan(String value) {
            addCriterion("decidAnswerOfUser >", value, "decidanswerofuser");
            return (Criteria) this;
        }

        public Criteria andDecidanswerofuserGreaterThanOrEqualTo(String value) {
            addCriterion("decidAnswerOfUser >=", value, "decidanswerofuser");
            return (Criteria) this;
        }

        public Criteria andDecidanswerofuserLessThan(String value) {
            addCriterion("decidAnswerOfUser <", value, "decidanswerofuser");
            return (Criteria) this;
        }

        public Criteria andDecidanswerofuserLessThanOrEqualTo(String value) {
            addCriterion("decidAnswerOfUser <=", value, "decidanswerofuser");
            return (Criteria) this;
        }

        public Criteria andDecidanswerofuserLike(String value) {
            addCriterion("decidAnswerOfUser like", value, "decidanswerofuser");
            return (Criteria) this;
        }

        public Criteria andDecidanswerofuserNotLike(String value) {
            addCriterion("decidAnswerOfUser not like", value, "decidanswerofuser");
            return (Criteria) this;
        }

        public Criteria andDecidanswerofuserIn(List<String> values) {
            addCriterion("decidAnswerOfUser in", values, "decidanswerofuser");
            return (Criteria) this;
        }

        public Criteria andDecidanswerofuserNotIn(List<String> values) {
            addCriterion("decidAnswerOfUser not in", values, "decidanswerofuser");
            return (Criteria) this;
        }

        public Criteria andDecidanswerofuserBetween(String value1, String value2) {
            addCriterion("decidAnswerOfUser between", value1, value2, "decidanswerofuser");
            return (Criteria) this;
        }

        public Criteria andDecidanswerofuserNotBetween(String value1, String value2) {
            addCriterion("decidAnswerOfUser not between", value1, value2, "decidanswerofuser");
            return (Criteria) this;
        }

        public Criteria andOptionmoreofuserIsNull() {
            addCriterion("optionMoreOfUser is null");
            return (Criteria) this;
        }

        public Criteria andOptionmoreofuserIsNotNull() {
            addCriterion("optionMoreOfUser is not null");
            return (Criteria) this;
        }

        public Criteria andOptionmoreofuserEqualTo(String value) {
            addCriterion("optionMoreOfUser =", value, "optionmoreofuser");
            return (Criteria) this;
        }

        public Criteria andOptionmoreofuserNotEqualTo(String value) {
            addCriterion("optionMoreOfUser <>", value, "optionmoreofuser");
            return (Criteria) this;
        }

        public Criteria andOptionmoreofuserGreaterThan(String value) {
            addCriterion("optionMoreOfUser >", value, "optionmoreofuser");
            return (Criteria) this;
        }

        public Criteria andOptionmoreofuserGreaterThanOrEqualTo(String value) {
            addCriterion("optionMoreOfUser >=", value, "optionmoreofuser");
            return (Criteria) this;
        }

        public Criteria andOptionmoreofuserLessThan(String value) {
            addCriterion("optionMoreOfUser <", value, "optionmoreofuser");
            return (Criteria) this;
        }

        public Criteria andOptionmoreofuserLessThanOrEqualTo(String value) {
            addCriterion("optionMoreOfUser <=", value, "optionmoreofuser");
            return (Criteria) this;
        }

        public Criteria andOptionmoreofuserLike(String value) {
            addCriterion("optionMoreOfUser like", value, "optionmoreofuser");
            return (Criteria) this;
        }

        public Criteria andOptionmoreofuserNotLike(String value) {
            addCriterion("optionMoreOfUser not like", value, "optionmoreofuser");
            return (Criteria) this;
        }

        public Criteria andOptionmoreofuserIn(List<String> values) {
            addCriterion("optionMoreOfUser in", values, "optionmoreofuser");
            return (Criteria) this;
        }

        public Criteria andOptionmoreofuserNotIn(List<String> values) {
            addCriterion("optionMoreOfUser not in", values, "optionmoreofuser");
            return (Criteria) this;
        }

        public Criteria andOptionmoreofuserBetween(String value1, String value2) {
            addCriterion("optionMoreOfUser between", value1, value2, "optionmoreofuser");
            return (Criteria) this;
        }

        public Criteria andOptionmoreofuserNotBetween(String value1, String value2) {
            addCriterion("optionMoreOfUser not between", value1, value2, "optionmoreofuser");
            return (Criteria) this;
        }

        public Criteria andRightnumIsNull() {
            addCriterion("rightNum is null");
            return (Criteria) this;
        }

        public Criteria andRightnumIsNotNull() {
            addCriterion("rightNum is not null");
            return (Criteria) this;
        }

        public Criteria andRightnumEqualTo(Integer value) {
            addCriterion("rightNum =", value, "rightnum");
            return (Criteria) this;
        }

        public Criteria andRightnumNotEqualTo(Integer value) {
            addCriterion("rightNum <>", value, "rightnum");
            return (Criteria) this;
        }

        public Criteria andRightnumGreaterThan(Integer value) {
            addCriterion("rightNum >", value, "rightnum");
            return (Criteria) this;
        }

        public Criteria andRightnumGreaterThanOrEqualTo(Integer value) {
            addCriterion("rightNum >=", value, "rightnum");
            return (Criteria) this;
        }

        public Criteria andRightnumLessThan(Integer value) {
            addCriterion("rightNum <", value, "rightnum");
            return (Criteria) this;
        }

        public Criteria andRightnumLessThanOrEqualTo(Integer value) {
            addCriterion("rightNum <=", value, "rightnum");
            return (Criteria) this;
        }

        public Criteria andRightnumIn(List<Integer> values) {
            addCriterion("rightNum in", values, "rightnum");
            return (Criteria) this;
        }

        public Criteria andRightnumNotIn(List<Integer> values) {
            addCriterion("rightNum not in", values, "rightnum");
            return (Criteria) this;
        }

        public Criteria andRightnumBetween(Integer value1, Integer value2) {
            addCriterion("rightNum between", value1, value2, "rightnum");
            return (Criteria) this;
        }

        public Criteria andRightnumNotBetween(Integer value1, Integer value2) {
            addCriterion("rightNum not between", value1, value2, "rightnum");
            return (Criteria) this;
        }

        public Criteria andCreattimeIsNull() {
            addCriterion("creatTime is null");
            return (Criteria) this;
        }

        public Criteria andCreattimeIsNotNull() {
            addCriterion("creatTime is not null");
            return (Criteria) this;
        }

        public Criteria andCreattimeEqualTo(String value) {
            addCriterion("creatTime =", value, "creattime");
            return (Criteria) this;
        }

        public Criteria andCreattimeNotEqualTo(String value) {
            addCriterion("creatTime <>", value, "creattime");
            return (Criteria) this;
        }

        public Criteria andCreattimeGreaterThan(String value) {
            addCriterion("creatTime >", value, "creattime");
            return (Criteria) this;
        }

        public Criteria andCreattimeGreaterThanOrEqualTo(String value) {
            addCriterion("creatTime >=", value, "creattime");
            return (Criteria) this;
        }

        public Criteria andCreattimeLessThan(String value) {
            addCriterion("creatTime <", value, "creattime");
            return (Criteria) this;
        }

        public Criteria andCreattimeLessThanOrEqualTo(String value) {
            addCriterion("creatTime <=", value, "creattime");
            return (Criteria) this;
        }

        public Criteria andCreattimeLike(String value) {
            addCriterion("creatTime like", value, "creattime");
            return (Criteria) this;
        }

        public Criteria andCreattimeNotLike(String value) {
            addCriterion("creatTime not like", value, "creattime");
            return (Criteria) this;
        }

        public Criteria andCreattimeIn(List<String> values) {
            addCriterion("creatTime in", values, "creattime");
            return (Criteria) this;
        }

        public Criteria andCreattimeNotIn(List<String> values) {
            addCriterion("creatTime not in", values, "creattime");
            return (Criteria) this;
        }

        public Criteria andCreattimeBetween(String value1, String value2) {
            addCriterion("creatTime between", value1, value2, "creattime");
            return (Criteria) this;
        }

        public Criteria andCreattimeNotBetween(String value1, String value2) {
            addCriterion("creatTime not between", value1, value2, "creattime");
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

        public Criteria andAttr16EqualTo(String value) {
            addCriterion("attr16 =", value, "attr16");
            return (Criteria) this;
        }

        public Criteria andAttr16NotEqualTo(String value) {
            addCriterion("attr16 <>", value, "attr16");
            return (Criteria) this;
        }

        public Criteria andAttr16GreaterThan(String value) {
            addCriterion("attr16 >", value, "attr16");
            return (Criteria) this;
        }

        public Criteria andAttr16GreaterThanOrEqualTo(String value) {
            addCriterion("attr16 >=", value, "attr16");
            return (Criteria) this;
        }

        public Criteria andAttr16LessThan(String value) {
            addCriterion("attr16 <", value, "attr16");
            return (Criteria) this;
        }

        public Criteria andAttr16LessThanOrEqualTo(String value) {
            addCriterion("attr16 <=", value, "attr16");
            return (Criteria) this;
        }

        public Criteria andAttr16Like(String value) {
            addCriterion("attr16 like", value, "attr16");
            return (Criteria) this;
        }

        public Criteria andAttr16NotLike(String value) {
            addCriterion("attr16 not like", value, "attr16");
            return (Criteria) this;
        }

        public Criteria andAttr16In(List<String> values) {
            addCriterion("attr16 in", values, "attr16");
            return (Criteria) this;
        }

        public Criteria andAttr16NotIn(List<String> values) {
            addCriterion("attr16 not in", values, "attr16");
            return (Criteria) this;
        }

        public Criteria andAttr16Between(String value1, String value2) {
            addCriterion("attr16 between", value1, value2, "attr16");
            return (Criteria) this;
        }

        public Criteria andAttr16NotBetween(String value1, String value2) {
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

        public Criteria andAttr17EqualTo(String value) {
            addCriterion("attr17 =", value, "attr17");
            return (Criteria) this;
        }

        public Criteria andAttr17NotEqualTo(String value) {
            addCriterion("attr17 <>", value, "attr17");
            return (Criteria) this;
        }

        public Criteria andAttr17GreaterThan(String value) {
            addCriterion("attr17 >", value, "attr17");
            return (Criteria) this;
        }

        public Criteria andAttr17GreaterThanOrEqualTo(String value) {
            addCriterion("attr17 >=", value, "attr17");
            return (Criteria) this;
        }

        public Criteria andAttr17LessThan(String value) {
            addCriterion("attr17 <", value, "attr17");
            return (Criteria) this;
        }

        public Criteria andAttr17LessThanOrEqualTo(String value) {
            addCriterion("attr17 <=", value, "attr17");
            return (Criteria) this;
        }

        public Criteria andAttr17Like(String value) {
            addCriterion("attr17 like", value, "attr17");
            return (Criteria) this;
        }

        public Criteria andAttr17NotLike(String value) {
            addCriterion("attr17 not like", value, "attr17");
            return (Criteria) this;
        }

        public Criteria andAttr17In(List<String> values) {
            addCriterion("attr17 in", values, "attr17");
            return (Criteria) this;
        }

        public Criteria andAttr17NotIn(List<String> values) {
            addCriterion("attr17 not in", values, "attr17");
            return (Criteria) this;
        }

        public Criteria andAttr17Between(String value1, String value2) {
            addCriterion("attr17 between", value1, value2, "attr17");
            return (Criteria) this;
        }

        public Criteria andAttr17NotBetween(String value1, String value2) {
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

        public Criteria andAttr18EqualTo(String value) {
            addCriterion("attr18 =", value, "attr18");
            return (Criteria) this;
        }

        public Criteria andAttr18NotEqualTo(String value) {
            addCriterion("attr18 <>", value, "attr18");
            return (Criteria) this;
        }

        public Criteria andAttr18GreaterThan(String value) {
            addCriterion("attr18 >", value, "attr18");
            return (Criteria) this;
        }

        public Criteria andAttr18GreaterThanOrEqualTo(String value) {
            addCriterion("attr18 >=", value, "attr18");
            return (Criteria) this;
        }

        public Criteria andAttr18LessThan(String value) {
            addCriterion("attr18 <", value, "attr18");
            return (Criteria) this;
        }

        public Criteria andAttr18LessThanOrEqualTo(String value) {
            addCriterion("attr18 <=", value, "attr18");
            return (Criteria) this;
        }

        public Criteria andAttr18Like(String value) {
            addCriterion("attr18 like", value, "attr18");
            return (Criteria) this;
        }

        public Criteria andAttr18NotLike(String value) {
            addCriterion("attr18 not like", value, "attr18");
            return (Criteria) this;
        }

        public Criteria andAttr18In(List<String> values) {
            addCriterion("attr18 in", values, "attr18");
            return (Criteria) this;
        }

        public Criteria andAttr18NotIn(List<String> values) {
            addCriterion("attr18 not in", values, "attr18");
            return (Criteria) this;
        }

        public Criteria andAttr18Between(String value1, String value2) {
            addCriterion("attr18 between", value1, value2, "attr18");
            return (Criteria) this;
        }

        public Criteria andAttr18NotBetween(String value1, String value2) {
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

        public Criteria andAttr19EqualTo(String value) {
            addCriterion("attr19 =", value, "attr19");
            return (Criteria) this;
        }

        public Criteria andAttr19NotEqualTo(String value) {
            addCriterion("attr19 <>", value, "attr19");
            return (Criteria) this;
        }

        public Criteria andAttr19GreaterThan(String value) {
            addCriterion("attr19 >", value, "attr19");
            return (Criteria) this;
        }

        public Criteria andAttr19GreaterThanOrEqualTo(String value) {
            addCriterion("attr19 >=", value, "attr19");
            return (Criteria) this;
        }

        public Criteria andAttr19LessThan(String value) {
            addCriterion("attr19 <", value, "attr19");
            return (Criteria) this;
        }

        public Criteria andAttr19LessThanOrEqualTo(String value) {
            addCriterion("attr19 <=", value, "attr19");
            return (Criteria) this;
        }

        public Criteria andAttr19Like(String value) {
            addCriterion("attr19 like", value, "attr19");
            return (Criteria) this;
        }

        public Criteria andAttr19NotLike(String value) {
            addCriterion("attr19 not like", value, "attr19");
            return (Criteria) this;
        }

        public Criteria andAttr19In(List<String> values) {
            addCriterion("attr19 in", values, "attr19");
            return (Criteria) this;
        }

        public Criteria andAttr19NotIn(List<String> values) {
            addCriterion("attr19 not in", values, "attr19");
            return (Criteria) this;
        }

        public Criteria andAttr19Between(String value1, String value2) {
            addCriterion("attr19 between", value1, value2, "attr19");
            return (Criteria) this;
        }

        public Criteria andAttr19NotBetween(String value1, String value2) {
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

        public Criteria andAttr20EqualTo(String value) {
            addCriterion("attr20 =", value, "attr20");
            return (Criteria) this;
        }

        public Criteria andAttr20NotEqualTo(String value) {
            addCriterion("attr20 <>", value, "attr20");
            return (Criteria) this;
        }

        public Criteria andAttr20GreaterThan(String value) {
            addCriterion("attr20 >", value, "attr20");
            return (Criteria) this;
        }

        public Criteria andAttr20GreaterThanOrEqualTo(String value) {
            addCriterion("attr20 >=", value, "attr20");
            return (Criteria) this;
        }

        public Criteria andAttr20LessThan(String value) {
            addCriterion("attr20 <", value, "attr20");
            return (Criteria) this;
        }

        public Criteria andAttr20LessThanOrEqualTo(String value) {
            addCriterion("attr20 <=", value, "attr20");
            return (Criteria) this;
        }

        public Criteria andAttr20Like(String value) {
            addCriterion("attr20 like", value, "attr20");
            return (Criteria) this;
        }

        public Criteria andAttr20NotLike(String value) {
            addCriterion("attr20 not like", value, "attr20");
            return (Criteria) this;
        }

        public Criteria andAttr20In(List<String> values) {
            addCriterion("attr20 in", values, "attr20");
            return (Criteria) this;
        }

        public Criteria andAttr20NotIn(List<String> values) {
            addCriterion("attr20 not in", values, "attr20");
            return (Criteria) this;
        }

        public Criteria andAttr20Between(String value1, String value2) {
            addCriterion("attr20 between", value1, value2, "attr20");
            return (Criteria) this;
        }

        public Criteria andAttr20NotBetween(String value1, String value2) {
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

        public Criteria andAttr21EqualTo(String value) {
            addCriterion("attr21 =", value, "attr21");
            return (Criteria) this;
        }

        public Criteria andAttr21NotEqualTo(String value) {
            addCriterion("attr21 <>", value, "attr21");
            return (Criteria) this;
        }

        public Criteria andAttr21GreaterThan(String value) {
            addCriterion("attr21 >", value, "attr21");
            return (Criteria) this;
        }

        public Criteria andAttr21GreaterThanOrEqualTo(String value) {
            addCriterion("attr21 >=", value, "attr21");
            return (Criteria) this;
        }

        public Criteria andAttr21LessThan(String value) {
            addCriterion("attr21 <", value, "attr21");
            return (Criteria) this;
        }

        public Criteria andAttr21LessThanOrEqualTo(String value) {
            addCriterion("attr21 <=", value, "attr21");
            return (Criteria) this;
        }

        public Criteria andAttr21Like(String value) {
            addCriterion("attr21 like", value, "attr21");
            return (Criteria) this;
        }

        public Criteria andAttr21NotLike(String value) {
            addCriterion("attr21 not like", value, "attr21");
            return (Criteria) this;
        }

        public Criteria andAttr21In(List<String> values) {
            addCriterion("attr21 in", values, "attr21");
            return (Criteria) this;
        }

        public Criteria andAttr21NotIn(List<String> values) {
            addCriterion("attr21 not in", values, "attr21");
            return (Criteria) this;
        }

        public Criteria andAttr21Between(String value1, String value2) {
            addCriterion("attr21 between", value1, value2, "attr21");
            return (Criteria) this;
        }

        public Criteria andAttr21NotBetween(String value1, String value2) {
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

        public Criteria andAttr22EqualTo(String value) {
            addCriterion("attr22 =", value, "attr22");
            return (Criteria) this;
        }

        public Criteria andAttr22NotEqualTo(String value) {
            addCriterion("attr22 <>", value, "attr22");
            return (Criteria) this;
        }

        public Criteria andAttr22GreaterThan(String value) {
            addCriterion("attr22 >", value, "attr22");
            return (Criteria) this;
        }

        public Criteria andAttr22GreaterThanOrEqualTo(String value) {
            addCriterion("attr22 >=", value, "attr22");
            return (Criteria) this;
        }

        public Criteria andAttr22LessThan(String value) {
            addCriterion("attr22 <", value, "attr22");
            return (Criteria) this;
        }

        public Criteria andAttr22LessThanOrEqualTo(String value) {
            addCriterion("attr22 <=", value, "attr22");
            return (Criteria) this;
        }

        public Criteria andAttr22Like(String value) {
            addCriterion("attr22 like", value, "attr22");
            return (Criteria) this;
        }

        public Criteria andAttr22NotLike(String value) {
            addCriterion("attr22 not like", value, "attr22");
            return (Criteria) this;
        }

        public Criteria andAttr22In(List<String> values) {
            addCriterion("attr22 in", values, "attr22");
            return (Criteria) this;
        }

        public Criteria andAttr22NotIn(List<String> values) {
            addCriterion("attr22 not in", values, "attr22");
            return (Criteria) this;
        }

        public Criteria andAttr22Between(String value1, String value2) {
            addCriterion("attr22 between", value1, value2, "attr22");
            return (Criteria) this;
        }

        public Criteria andAttr22NotBetween(String value1, String value2) {
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

        public Criteria andAttr23EqualTo(String value) {
            addCriterion("attr23 =", value, "attr23");
            return (Criteria) this;
        }

        public Criteria andAttr23NotEqualTo(String value) {
            addCriterion("attr23 <>", value, "attr23");
            return (Criteria) this;
        }

        public Criteria andAttr23GreaterThan(String value) {
            addCriterion("attr23 >", value, "attr23");
            return (Criteria) this;
        }

        public Criteria andAttr23GreaterThanOrEqualTo(String value) {
            addCriterion("attr23 >=", value, "attr23");
            return (Criteria) this;
        }

        public Criteria andAttr23LessThan(String value) {
            addCriterion("attr23 <", value, "attr23");
            return (Criteria) this;
        }

        public Criteria andAttr23LessThanOrEqualTo(String value) {
            addCriterion("attr23 <=", value, "attr23");
            return (Criteria) this;
        }

        public Criteria andAttr23Like(String value) {
            addCriterion("attr23 like", value, "attr23");
            return (Criteria) this;
        }

        public Criteria andAttr23NotLike(String value) {
            addCriterion("attr23 not like", value, "attr23");
            return (Criteria) this;
        }

        public Criteria andAttr23In(List<String> values) {
            addCriterion("attr23 in", values, "attr23");
            return (Criteria) this;
        }

        public Criteria andAttr23NotIn(List<String> values) {
            addCriterion("attr23 not in", values, "attr23");
            return (Criteria) this;
        }

        public Criteria andAttr23Between(String value1, String value2) {
            addCriterion("attr23 between", value1, value2, "attr23");
            return (Criteria) this;
        }

        public Criteria andAttr23NotBetween(String value1, String value2) {
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

        public Criteria andAttr24EqualTo(String value) {
            addCriterion("attr24 =", value, "attr24");
            return (Criteria) this;
        }

        public Criteria andAttr24NotEqualTo(String value) {
            addCriterion("attr24 <>", value, "attr24");
            return (Criteria) this;
        }

        public Criteria andAttr24GreaterThan(String value) {
            addCriterion("attr24 >", value, "attr24");
            return (Criteria) this;
        }

        public Criteria andAttr24GreaterThanOrEqualTo(String value) {
            addCriterion("attr24 >=", value, "attr24");
            return (Criteria) this;
        }

        public Criteria andAttr24LessThan(String value) {
            addCriterion("attr24 <", value, "attr24");
            return (Criteria) this;
        }

        public Criteria andAttr24LessThanOrEqualTo(String value) {
            addCriterion("attr24 <=", value, "attr24");
            return (Criteria) this;
        }

        public Criteria andAttr24Like(String value) {
            addCriterion("attr24 like", value, "attr24");
            return (Criteria) this;
        }

        public Criteria andAttr24NotLike(String value) {
            addCriterion("attr24 not like", value, "attr24");
            return (Criteria) this;
        }

        public Criteria andAttr24In(List<String> values) {
            addCriterion("attr24 in", values, "attr24");
            return (Criteria) this;
        }

        public Criteria andAttr24NotIn(List<String> values) {
            addCriterion("attr24 not in", values, "attr24");
            return (Criteria) this;
        }

        public Criteria andAttr24Between(String value1, String value2) {
            addCriterion("attr24 between", value1, value2, "attr24");
            return (Criteria) this;
        }

        public Criteria andAttr24NotBetween(String value1, String value2) {
            addCriterion("attr24 not between", value1, value2, "attr24");
            return (Criteria) this;
        }

        public Criteria andAttr25IsNull() {
            addCriterion("attr25 is null");
            return (Criteria) this;
        }

        public Criteria andAttr25IsNotNull() {
            addCriterion("attr25 is not null");
            return (Criteria) this;
        }

        public Criteria andAttr25EqualTo(String value) {
            addCriterion("attr25 =", value, "attr25");
            return (Criteria) this;
        }

        public Criteria andAttr25NotEqualTo(String value) {
            addCriterion("attr25 <>", value, "attr25");
            return (Criteria) this;
        }

        public Criteria andAttr25GreaterThan(String value) {
            addCriterion("attr25 >", value, "attr25");
            return (Criteria) this;
        }

        public Criteria andAttr25GreaterThanOrEqualTo(String value) {
            addCriterion("attr25 >=", value, "attr25");
            return (Criteria) this;
        }

        public Criteria andAttr25LessThan(String value) {
            addCriterion("attr25 <", value, "attr25");
            return (Criteria) this;
        }

        public Criteria andAttr25LessThanOrEqualTo(String value) {
            addCriterion("attr25 <=", value, "attr25");
            return (Criteria) this;
        }

        public Criteria andAttr25Like(String value) {
            addCriterion("attr25 like", value, "attr25");
            return (Criteria) this;
        }

        public Criteria andAttr25NotLike(String value) {
            addCriterion("attr25 not like", value, "attr25");
            return (Criteria) this;
        }

        public Criteria andAttr25In(List<String> values) {
            addCriterion("attr25 in", values, "attr25");
            return (Criteria) this;
        }

        public Criteria andAttr25NotIn(List<String> values) {
            addCriterion("attr25 not in", values, "attr25");
            return (Criteria) this;
        }

        public Criteria andAttr25Between(String value1, String value2) {
            addCriterion("attr25 between", value1, value2, "attr25");
            return (Criteria) this;
        }

        public Criteria andAttr25NotBetween(String value1, String value2) {
            addCriterion("attr25 not between", value1, value2, "attr25");
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