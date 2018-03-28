package cn.windy.module.examination.mybatis.model;

import java.util.ArrayList;
import java.util.List;

public class PapersetNumQuery {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    protected Integer pageNo = 1;

    protected Integer startRow;

    protected Integer pageSize = 10;

    protected String fields;

    public PapersetNumQuery() {
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

        public Criteria andQuestypeidIsNull() {
            addCriterion("quesTypeId is null");
            return (Criteria) this;
        }

        public Criteria andQuestypeidIsNotNull() {
            addCriterion("quesTypeId is not null");
            return (Criteria) this;
        }

        public Criteria andQuestypeidEqualTo(Long value) {
            addCriterion("quesTypeId =", value, "questypeid");
            return (Criteria) this;
        }

        public Criteria andQuestypeidNotEqualTo(Long value) {
            addCriterion("quesTypeId <>", value, "questypeid");
            return (Criteria) this;
        }

        public Criteria andQuestypeidGreaterThan(Long value) {
            addCriterion("quesTypeId >", value, "questypeid");
            return (Criteria) this;
        }

        public Criteria andQuestypeidGreaterThanOrEqualTo(Long value) {
            addCriterion("quesTypeId >=", value, "questypeid");
            return (Criteria) this;
        }

        public Criteria andQuestypeidLessThan(Long value) {
            addCriterion("quesTypeId <", value, "questypeid");
            return (Criteria) this;
        }

        public Criteria andQuestypeidLessThanOrEqualTo(Long value) {
            addCriterion("quesTypeId <=", value, "questypeid");
            return (Criteria) this;
        }

        public Criteria andQuestypeidIn(List<Long> values) {
            addCriterion("quesTypeId in", values, "questypeid");
            return (Criteria) this;
        }

        public Criteria andQuestypeidNotIn(List<Long> values) {
            addCriterion("quesTypeId not in", values, "questypeid");
            return (Criteria) this;
        }

        public Criteria andQuestypeidBetween(Long value1, Long value2) {
            addCriterion("quesTypeId between", value1, value2, "questypeid");
            return (Criteria) this;
        }

        public Criteria andQuestypeidNotBetween(Long value1, Long value2) {
            addCriterion("quesTypeId not between", value1, value2, "questypeid");
            return (Criteria) this;
        }

        public Criteria andCreatidIsNull() {
            addCriterion("creatId is null");
            return (Criteria) this;
        }

        public Criteria andCreatidIsNotNull() {
            addCriterion("creatId is not null");
            return (Criteria) this;
        }

        public Criteria andCreatidEqualTo(Long value) {
            addCriterion("creatId =", value, "creatid");
            return (Criteria) this;
        }

        public Criteria andCreatidNotEqualTo(Long value) {
            addCriterion("creatId <>", value, "creatid");
            return (Criteria) this;
        }

        public Criteria andCreatidGreaterThan(Long value) {
            addCriterion("creatId >", value, "creatid");
            return (Criteria) this;
        }

        public Criteria andCreatidGreaterThanOrEqualTo(Long value) {
            addCriterion("creatId >=", value, "creatid");
            return (Criteria) this;
        }

        public Criteria andCreatidLessThan(Long value) {
            addCriterion("creatId <", value, "creatid");
            return (Criteria) this;
        }

        public Criteria andCreatidLessThanOrEqualTo(Long value) {
            addCriterion("creatId <=", value, "creatid");
            return (Criteria) this;
        }

        public Criteria andCreatidIn(List<Long> values) {
            addCriterion("creatId in", values, "creatid");
            return (Criteria) this;
        }

        public Criteria andCreatidNotIn(List<Long> values) {
            addCriterion("creatId not in", values, "creatid");
            return (Criteria) this;
        }

        public Criteria andCreatidBetween(Long value1, Long value2) {
            addCriterion("creatId between", value1, value2, "creatid");
            return (Criteria) this;
        }

        public Criteria andCreatidNotBetween(Long value1, Long value2) {
            addCriterion("creatId not between", value1, value2, "creatid");
            return (Criteria) this;
        }

        public Criteria andDanxuannumIsNull() {
            addCriterion("danxuanNum is null");
            return (Criteria) this;
        }

        public Criteria andDanxuannumIsNotNull() {
            addCriterion("danxuanNum is not null");
            return (Criteria) this;
        }

        public Criteria andDanxuannumEqualTo(Integer value) {
            addCriterion("danxuanNum =", value, "danxuannum");
            return (Criteria) this;
        }

        public Criteria andDanxuannumNotEqualTo(Integer value) {
            addCriterion("danxuanNum <>", value, "danxuannum");
            return (Criteria) this;
        }

        public Criteria andDanxuannumGreaterThan(Integer value) {
            addCriterion("danxuanNum >", value, "danxuannum");
            return (Criteria) this;
        }

        public Criteria andDanxuannumGreaterThanOrEqualTo(Integer value) {
            addCriterion("danxuanNum >=", value, "danxuannum");
            return (Criteria) this;
        }

        public Criteria andDanxuannumLessThan(Integer value) {
            addCriterion("danxuanNum <", value, "danxuannum");
            return (Criteria) this;
        }

        public Criteria andDanxuannumLessThanOrEqualTo(Integer value) {
            addCriterion("danxuanNum <=", value, "danxuannum");
            return (Criteria) this;
        }

        public Criteria andDanxuannumIn(List<Integer> values) {
            addCriterion("danxuanNum in", values, "danxuannum");
            return (Criteria) this;
        }

        public Criteria andDanxuannumNotIn(List<Integer> values) {
            addCriterion("danxuanNum not in", values, "danxuannum");
            return (Criteria) this;
        }

        public Criteria andDanxuannumBetween(Integer value1, Integer value2) {
            addCriterion("danxuanNum between", value1, value2, "danxuannum");
            return (Criteria) this;
        }

        public Criteria andDanxuannumNotBetween(Integer value1, Integer value2) {
            addCriterion("danxuanNum not between", value1, value2, "danxuannum");
            return (Criteria) this;
        }

        public Criteria andDuoxuannumIsNull() {
            addCriterion("duoxuanNum is null");
            return (Criteria) this;
        }

        public Criteria andDuoxuannumIsNotNull() {
            addCriterion("duoxuanNum is not null");
            return (Criteria) this;
        }

        public Criteria andDuoxuannumEqualTo(Integer value) {
            addCriterion("duoxuanNum =", value, "duoxuannum");
            return (Criteria) this;
        }

        public Criteria andDuoxuannumNotEqualTo(Integer value) {
            addCriterion("duoxuanNum <>", value, "duoxuannum");
            return (Criteria) this;
        }

        public Criteria andDuoxuannumGreaterThan(Integer value) {
            addCriterion("duoxuanNum >", value, "duoxuannum");
            return (Criteria) this;
        }

        public Criteria andDuoxuannumGreaterThanOrEqualTo(Integer value) {
            addCriterion("duoxuanNum >=", value, "duoxuannum");
            return (Criteria) this;
        }

        public Criteria andDuoxuannumLessThan(Integer value) {
            addCriterion("duoxuanNum <", value, "duoxuannum");
            return (Criteria) this;
        }

        public Criteria andDuoxuannumLessThanOrEqualTo(Integer value) {
            addCriterion("duoxuanNum <=", value, "duoxuannum");
            return (Criteria) this;
        }

        public Criteria andDuoxuannumIn(List<Integer> values) {
            addCriterion("duoxuanNum in", values, "duoxuannum");
            return (Criteria) this;
        }

        public Criteria andDuoxuannumNotIn(List<Integer> values) {
            addCriterion("duoxuanNum not in", values, "duoxuannum");
            return (Criteria) this;
        }

        public Criteria andDuoxuannumBetween(Integer value1, Integer value2) {
            addCriterion("duoxuanNum between", value1, value2, "duoxuannum");
            return (Criteria) this;
        }

        public Criteria andDuoxuannumNotBetween(Integer value1, Integer value2) {
            addCriterion("duoxuanNum not between", value1, value2, "duoxuannum");
            return (Criteria) this;
        }

        public Criteria andPanudannumIsNull() {
            addCriterion("panudanNum is null");
            return (Criteria) this;
        }

        public Criteria andPanudannumIsNotNull() {
            addCriterion("panudanNum is not null");
            return (Criteria) this;
        }

        public Criteria andPanudannumEqualTo(Integer value) {
            addCriterion("panudanNum =", value, "panudannum");
            return (Criteria) this;
        }

        public Criteria andPanudannumNotEqualTo(Integer value) {
            addCriterion("panudanNum <>", value, "panudannum");
            return (Criteria) this;
        }

        public Criteria andPanudannumGreaterThan(Integer value) {
            addCriterion("panudanNum >", value, "panudannum");
            return (Criteria) this;
        }

        public Criteria andPanudannumGreaterThanOrEqualTo(Integer value) {
            addCriterion("panudanNum >=", value, "panudannum");
            return (Criteria) this;
        }

        public Criteria andPanudannumLessThan(Integer value) {
            addCriterion("panudanNum <", value, "panudannum");
            return (Criteria) this;
        }

        public Criteria andPanudannumLessThanOrEqualTo(Integer value) {
            addCriterion("panudanNum <=", value, "panudannum");
            return (Criteria) this;
        }

        public Criteria andPanudannumIn(List<Integer> values) {
            addCriterion("panudanNum in", values, "panudannum");
            return (Criteria) this;
        }

        public Criteria andPanudannumNotIn(List<Integer> values) {
            addCriterion("panudanNum not in", values, "panudannum");
            return (Criteria) this;
        }

        public Criteria andPanudannumBetween(Integer value1, Integer value2) {
            addCriterion("panudanNum between", value1, value2, "panudannum");
            return (Criteria) this;
        }

        public Criteria andPanudannumNotBetween(Integer value1, Integer value2) {
            addCriterion("panudanNum not between", value1, value2, "panudannum");
            return (Criteria) this;
        }

        public Criteria andDecrionIsNull() {
            addCriterion("decrion is null");
            return (Criteria) this;
        }

        public Criteria andDecrionIsNotNull() {
            addCriterion("decrion is not null");
            return (Criteria) this;
        }

        public Criteria andDecrionEqualTo(String value) {
            addCriterion("decrion =", value, "decrion");
            return (Criteria) this;
        }

        public Criteria andDecrionNotEqualTo(String value) {
            addCriterion("decrion <>", value, "decrion");
            return (Criteria) this;
        }

        public Criteria andDecrionGreaterThan(String value) {
            addCriterion("decrion >", value, "decrion");
            return (Criteria) this;
        }

        public Criteria andDecrionGreaterThanOrEqualTo(String value) {
            addCriterion("decrion >=", value, "decrion");
            return (Criteria) this;
        }

        public Criteria andDecrionLessThan(String value) {
            addCriterion("decrion <", value, "decrion");
            return (Criteria) this;
        }

        public Criteria andDecrionLessThanOrEqualTo(String value) {
            addCriterion("decrion <=", value, "decrion");
            return (Criteria) this;
        }

        public Criteria andDecrionLike(String value) {
            addCriterion("decrion like", value, "decrion");
            return (Criteria) this;
        }

        public Criteria andDecrionNotLike(String value) {
            addCriterion("decrion not like", value, "decrion");
            return (Criteria) this;
        }

        public Criteria andDecrionIn(List<String> values) {
            addCriterion("decrion in", values, "decrion");
            return (Criteria) this;
        }

        public Criteria andDecrionNotIn(List<String> values) {
            addCriterion("decrion not in", values, "decrion");
            return (Criteria) this;
        }

        public Criteria andDecrionBetween(String value1, String value2) {
            addCriterion("decrion between", value1, value2, "decrion");
            return (Criteria) this;
        }

        public Criteria andDecrionNotBetween(String value1, String value2) {
            addCriterion("decrion not between", value1, value2, "decrion");
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

        public Criteria andTypeEqualTo(String value) {
            addCriterion("type =", value, "type");
            return (Criteria) this;
        }

        public Criteria andTypeNotEqualTo(String value) {
            addCriterion("type <>", value, "type");
            return (Criteria) this;
        }

        public Criteria andTypeGreaterThan(String value) {
            addCriterion("type >", value, "type");
            return (Criteria) this;
        }

        public Criteria andTypeGreaterThanOrEqualTo(String value) {
            addCriterion("type >=", value, "type");
            return (Criteria) this;
        }

        public Criteria andTypeLessThan(String value) {
            addCriterion("type <", value, "type");
            return (Criteria) this;
        }

        public Criteria andTypeLessThanOrEqualTo(String value) {
            addCriterion("type <=", value, "type");
            return (Criteria) this;
        }

        public Criteria andTypeLike(String value) {
            addCriterion("type like", value, "type");
            return (Criteria) this;
        }

        public Criteria andTypeNotLike(String value) {
            addCriterion("type not like", value, "type");
            return (Criteria) this;
        }

        public Criteria andTypeIn(List<String> values) {
            addCriterion("type in", values, "type");
            return (Criteria) this;
        }

        public Criteria andTypeNotIn(List<String> values) {
            addCriterion("type not in", values, "type");
            return (Criteria) this;
        }

        public Criteria andTypeBetween(String value1, String value2) {
            addCriterion("type between", value1, value2, "type");
            return (Criteria) this;
        }

        public Criteria andTypeNotBetween(String value1, String value2) {
            addCriterion("type not between", value1, value2, "type");
            return (Criteria) this;
        }

        public Criteria andStautesIsNull() {
            addCriterion("stautes is null");
            return (Criteria) this;
        }

        public Criteria andStautesIsNotNull() {
            addCriterion("stautes is not null");
            return (Criteria) this;
        }

        public Criteria andStautesEqualTo(String value) {
            addCriterion("stautes =", value, "stautes");
            return (Criteria) this;
        }

        public Criteria andStautesNotEqualTo(String value) {
            addCriterion("stautes <>", value, "stautes");
            return (Criteria) this;
        }

        public Criteria andStautesGreaterThan(String value) {
            addCriterion("stautes >", value, "stautes");
            return (Criteria) this;
        }

        public Criteria andStautesGreaterThanOrEqualTo(String value) {
            addCriterion("stautes >=", value, "stautes");
            return (Criteria) this;
        }

        public Criteria andStautesLessThan(String value) {
            addCriterion("stautes <", value, "stautes");
            return (Criteria) this;
        }

        public Criteria andStautesLessThanOrEqualTo(String value) {
            addCriterion("stautes <=", value, "stautes");
            return (Criteria) this;
        }

        public Criteria andStautesLike(String value) {
            addCriterion("stautes like", value, "stautes");
            return (Criteria) this;
        }

        public Criteria andStautesNotLike(String value) {
            addCriterion("stautes not like", value, "stautes");
            return (Criteria) this;
        }

        public Criteria andStautesIn(List<String> values) {
            addCriterion("stautes in", values, "stautes");
            return (Criteria) this;
        }

        public Criteria andStautesNotIn(List<String> values) {
            addCriterion("stautes not in", values, "stautes");
            return (Criteria) this;
        }

        public Criteria andStautesBetween(String value1, String value2) {
            addCriterion("stautes between", value1, value2, "stautes");
            return (Criteria) this;
        }

        public Criteria andStautesNotBetween(String value1, String value2) {
            addCriterion("stautes not between", value1, value2, "stautes");
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