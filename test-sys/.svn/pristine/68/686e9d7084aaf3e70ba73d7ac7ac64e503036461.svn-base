package cn.windy.module.examination.mybatis.model;

import java.util.ArrayList;
import java.util.List;

public class PaperSetQuery {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    protected Integer pageNo = 1;

    protected Integer startRow;

    protected Integer pageSize = 10;

    protected String fields;

    public PaperSetQuery() {
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

        public Criteria andPaperIdIsNull() {
            addCriterion("paper_id is null");
            return (Criteria) this;
        }

        public Criteria andPaperIdIsNotNull() {
            addCriterion("paper_id is not null");
            return (Criteria) this;
        }

        public Criteria andPaperIdEqualTo(Long value) {
            addCriterion("paper_id =", value, "paperId");
            return (Criteria) this;
        }

        public Criteria andPaperIdNotEqualTo(Long value) {
            addCriterion("paper_id <>", value, "paperId");
            return (Criteria) this;
        }

        public Criteria andPaperIdGreaterThan(Long value) {
            addCriterion("paper_id >", value, "paperId");
            return (Criteria) this;
        }

        public Criteria andPaperIdGreaterThanOrEqualTo(Long value) {
            addCriterion("paper_id >=", value, "paperId");
            return (Criteria) this;
        }

        public Criteria andPaperIdLessThan(Long value) {
            addCriterion("paper_id <", value, "paperId");
            return (Criteria) this;
        }

        public Criteria andPaperIdLessThanOrEqualTo(Long value) {
            addCriterion("paper_id <=", value, "paperId");
            return (Criteria) this;
        }

        public Criteria andPaperIdIn(List<Long> values) {
            addCriterion("paper_id in", values, "paperId");
            return (Criteria) this;
        }

        public Criteria andPaperIdNotIn(List<Long> values) {
            addCriterion("paper_id not in", values, "paperId");
            return (Criteria) this;
        }

        public Criteria andPaperIdBetween(Long value1, Long value2) {
            addCriterion("paper_id between", value1, value2, "paperId");
            return (Criteria) this;
        }

        public Criteria andPaperIdNotBetween(Long value1, Long value2) {
            addCriterion("paper_id not between", value1, value2, "paperId");
            return (Criteria) this;
        }

        public Criteria andPaperProportionIsNull() {
            addCriterion("paper_proportion is null");
            return (Criteria) this;
        }

        public Criteria andPaperProportionIsNotNull() {
            addCriterion("paper_proportion is not null");
            return (Criteria) this;
        }

        public Criteria andPaperProportionEqualTo(String value) {
            addCriterion("paper_proportion =", value, "paperProportion");
            return (Criteria) this;
        }

        public Criteria andPaperProportionNotEqualTo(String value) {
            addCriterion("paper_proportion <>", value, "paperProportion");
            return (Criteria) this;
        }

        public Criteria andPaperProportionGreaterThan(String value) {
            addCriterion("paper_proportion >", value, "paperProportion");
            return (Criteria) this;
        }

        public Criteria andPaperProportionGreaterThanOrEqualTo(String value) {
            addCriterion("paper_proportion >=", value, "paperProportion");
            return (Criteria) this;
        }

        public Criteria andPaperProportionLessThan(String value) {
            addCriterion("paper_proportion <", value, "paperProportion");
            return (Criteria) this;
        }

        public Criteria andPaperProportionLessThanOrEqualTo(String value) {
            addCriterion("paper_proportion <=", value, "paperProportion");
            return (Criteria) this;
        }

        public Criteria andPaperProportionLike(String value) {
            addCriterion("paper_proportion like", value, "paperProportion");
            return (Criteria) this;
        }

        public Criteria andPaperProportionNotLike(String value) {
            addCriterion("paper_proportion not like", value, "paperProportion");
            return (Criteria) this;
        }

        public Criteria andPaperProportionIn(List<String> values) {
            addCriterion("paper_proportion in", values, "paperProportion");
            return (Criteria) this;
        }

        public Criteria andPaperProportionNotIn(List<String> values) {
            addCriterion("paper_proportion not in", values, "paperProportion");
            return (Criteria) this;
        }

        public Criteria andPaperProportionBetween(String value1, String value2) {
            addCriterion("paper_proportion between", value1, value2, "paperProportion");
            return (Criteria) this;
        }

        public Criteria andPaperProportionNotBetween(String value1, String value2) {
            addCriterion("paper_proportion not between", value1, value2, "paperProportion");
            return (Criteria) this;
        }

        public Criteria andPaperLineIsNull() {
            addCriterion("paper_line is null");
            return (Criteria) this;
        }

        public Criteria andPaperLineIsNotNull() {
            addCriterion("paper_line is not null");
            return (Criteria) this;
        }

        public Criteria andPaperLineEqualTo(Integer value) {
            addCriterion("paper_line =", value, "paperLine");
            return (Criteria) this;
        }

        public Criteria andPaperLineNotEqualTo(Integer value) {
            addCriterion("paper_line <>", value, "paperLine");
            return (Criteria) this;
        }

        public Criteria andPaperLineGreaterThan(Integer value) {
            addCriterion("paper_line >", value, "paperLine");
            return (Criteria) this;
        }

        public Criteria andPaperLineGreaterThanOrEqualTo(Integer value) {
            addCriterion("paper_line >=", value, "paperLine");
            return (Criteria) this;
        }

        public Criteria andPaperLineLessThan(Integer value) {
            addCriterion("paper_line <", value, "paperLine");
            return (Criteria) this;
        }

        public Criteria andPaperLineLessThanOrEqualTo(Integer value) {
            addCriterion("paper_line <=", value, "paperLine");
            return (Criteria) this;
        }

        public Criteria andPaperLineIn(List<Integer> values) {
            addCriterion("paper_line in", values, "paperLine");
            return (Criteria) this;
        }

        public Criteria andPaperLineNotIn(List<Integer> values) {
            addCriterion("paper_line not in", values, "paperLine");
            return (Criteria) this;
        }

        public Criteria andPaperLineBetween(Integer value1, Integer value2) {
            addCriterion("paper_line between", value1, value2, "paperLine");
            return (Criteria) this;
        }

        public Criteria andPaperLineNotBetween(Integer value1, Integer value2) {
            addCriterion("paper_line not between", value1, value2, "paperLine");
            return (Criteria) this;
        }

        public Criteria andPaperTotailIsNull() {
            addCriterion("paper_totail is null");
            return (Criteria) this;
        }

        public Criteria andPaperTotailIsNotNull() {
            addCriterion("paper_totail is not null");
            return (Criteria) this;
        }

        public Criteria andPaperTotailEqualTo(Integer value) {
            addCriterion("paper_totail =", value, "paperTotail");
            return (Criteria) this;
        }

        public Criteria andPaperTotailNotEqualTo(Integer value) {
            addCriterion("paper_totail <>", value, "paperTotail");
            return (Criteria) this;
        }

        public Criteria andPaperTotailGreaterThan(Integer value) {
            addCriterion("paper_totail >", value, "paperTotail");
            return (Criteria) this;
        }

        public Criteria andPaperTotailGreaterThanOrEqualTo(Integer value) {
            addCriterion("paper_totail >=", value, "paperTotail");
            return (Criteria) this;
        }

        public Criteria andPaperTotailLessThan(Integer value) {
            addCriterion("paper_totail <", value, "paperTotail");
            return (Criteria) this;
        }

        public Criteria andPaperTotailLessThanOrEqualTo(Integer value) {
            addCriterion("paper_totail <=", value, "paperTotail");
            return (Criteria) this;
        }

        public Criteria andPaperTotailIn(List<Integer> values) {
            addCriterion("paper_totail in", values, "paperTotail");
            return (Criteria) this;
        }

        public Criteria andPaperTotailNotIn(List<Integer> values) {
            addCriterion("paper_totail not in", values, "paperTotail");
            return (Criteria) this;
        }

        public Criteria andPaperTotailBetween(Integer value1, Integer value2) {
            addCriterion("paper_totail between", value1, value2, "paperTotail");
            return (Criteria) this;
        }

        public Criteria andPaperTotailNotBetween(Integer value1, Integer value2) {
            addCriterion("paper_totail not between", value1, value2, "paperTotail");
            return (Criteria) this;
        }

        public Criteria andExamTotleIsNull() {
            addCriterion("exam_totle is null");
            return (Criteria) this;
        }

        public Criteria andExamTotleIsNotNull() {
            addCriterion("exam_totle is not null");
            return (Criteria) this;
        }

        public Criteria andExamTotleEqualTo(Integer value) {
            addCriterion("exam_totle =", value, "examTotle");
            return (Criteria) this;
        }

        public Criteria andExamTotleNotEqualTo(Integer value) {
            addCriterion("exam_totle <>", value, "examTotle");
            return (Criteria) this;
        }

        public Criteria andExamTotleGreaterThan(Integer value) {
            addCriterion("exam_totle >", value, "examTotle");
            return (Criteria) this;
        }

        public Criteria andExamTotleGreaterThanOrEqualTo(Integer value) {
            addCriterion("exam_totle >=", value, "examTotle");
            return (Criteria) this;
        }

        public Criteria andExamTotleLessThan(Integer value) {
            addCriterion("exam_totle <", value, "examTotle");
            return (Criteria) this;
        }

        public Criteria andExamTotleLessThanOrEqualTo(Integer value) {
            addCriterion("exam_totle <=", value, "examTotle");
            return (Criteria) this;
        }

        public Criteria andExamTotleIn(List<Integer> values) {
            addCriterion("exam_totle in", values, "examTotle");
            return (Criteria) this;
        }

        public Criteria andExamTotleNotIn(List<Integer> values) {
            addCriterion("exam_totle not in", values, "examTotle");
            return (Criteria) this;
        }

        public Criteria andExamTotleBetween(Integer value1, Integer value2) {
            addCriterion("exam_totle between", value1, value2, "examTotle");
            return (Criteria) this;
        }

        public Criteria andExamTotleNotBetween(Integer value1, Integer value2) {
            addCriterion("exam_totle not between", value1, value2, "examTotle");
            return (Criteria) this;
        }

        public Criteria andExamRealIsNull() {
            addCriterion("exam_real is null");
            return (Criteria) this;
        }

        public Criteria andExamRealIsNotNull() {
            addCriterion("exam_real is not null");
            return (Criteria) this;
        }

        public Criteria andExamRealEqualTo(Integer value) {
            addCriterion("exam_real =", value, "examReal");
            return (Criteria) this;
        }

        public Criteria andExamRealNotEqualTo(Integer value) {
            addCriterion("exam_real <>", value, "examReal");
            return (Criteria) this;
        }

        public Criteria andExamRealGreaterThan(Integer value) {
            addCriterion("exam_real >", value, "examReal");
            return (Criteria) this;
        }

        public Criteria andExamRealGreaterThanOrEqualTo(Integer value) {
            addCriterion("exam_real >=", value, "examReal");
            return (Criteria) this;
        }

        public Criteria andExamRealLessThan(Integer value) {
            addCriterion("exam_real <", value, "examReal");
            return (Criteria) this;
        }

        public Criteria andExamRealLessThanOrEqualTo(Integer value) {
            addCriterion("exam_real <=", value, "examReal");
            return (Criteria) this;
        }

        public Criteria andExamRealIn(List<Integer> values) {
            addCriterion("exam_real in", values, "examReal");
            return (Criteria) this;
        }

        public Criteria andExamRealNotIn(List<Integer> values) {
            addCriterion("exam_real not in", values, "examReal");
            return (Criteria) this;
        }

        public Criteria andExamRealBetween(Integer value1, Integer value2) {
            addCriterion("exam_real between", value1, value2, "examReal");
            return (Criteria) this;
        }

        public Criteria andExamRealNotBetween(Integer value1, Integer value2) {
            addCriterion("exam_real not between", value1, value2, "examReal");
            return (Criteria) this;
        }

        public Criteria andExamResetIsNull() {
            addCriterion("exam_reset is null");
            return (Criteria) this;
        }

        public Criteria andExamResetIsNotNull() {
            addCriterion("exam_reset is not null");
            return (Criteria) this;
        }

        public Criteria andExamResetEqualTo(Integer value) {
            addCriterion("exam_reset =", value, "examReset");
            return (Criteria) this;
        }

        public Criteria andExamResetNotEqualTo(Integer value) {
            addCriterion("exam_reset <>", value, "examReset");
            return (Criteria) this;
        }

        public Criteria andExamResetGreaterThan(Integer value) {
            addCriterion("exam_reset >", value, "examReset");
            return (Criteria) this;
        }

        public Criteria andExamResetGreaterThanOrEqualTo(Integer value) {
            addCriterion("exam_reset >=", value, "examReset");
            return (Criteria) this;
        }

        public Criteria andExamResetLessThan(Integer value) {
            addCriterion("exam_reset <", value, "examReset");
            return (Criteria) this;
        }

        public Criteria andExamResetLessThanOrEqualTo(Integer value) {
            addCriterion("exam_reset <=", value, "examReset");
            return (Criteria) this;
        }

        public Criteria andExamResetIn(List<Integer> values) {
            addCriterion("exam_reset in", values, "examReset");
            return (Criteria) this;
        }

        public Criteria andExamResetNotIn(List<Integer> values) {
            addCriterion("exam_reset not in", values, "examReset");
            return (Criteria) this;
        }

        public Criteria andExamResetBetween(Integer value1, Integer value2) {
            addCriterion("exam_reset between", value1, value2, "examReset");
            return (Criteria) this;
        }

        public Criteria andExamResetNotBetween(Integer value1, Integer value2) {
            addCriterion("exam_reset not between", value1, value2, "examReset");
            return (Criteria) this;
        }

        public Criteria andExamResetNumIsNull() {
            addCriterion("exam_reset_num is null");
            return (Criteria) this;
        }

        public Criteria andExamResetNumIsNotNull() {
            addCriterion("exam_reset_num is not null");
            return (Criteria) this;
        }

        public Criteria andExamResetNumEqualTo(Integer value) {
            addCriterion("exam_reset_num =", value, "examResetNum");
            return (Criteria) this;
        }

        public Criteria andExamResetNumNotEqualTo(Integer value) {
            addCriterion("exam_reset_num <>", value, "examResetNum");
            return (Criteria) this;
        }

        public Criteria andExamResetNumGreaterThan(Integer value) {
            addCriterion("exam_reset_num >", value, "examResetNum");
            return (Criteria) this;
        }

        public Criteria andExamResetNumGreaterThanOrEqualTo(Integer value) {
            addCriterion("exam_reset_num >=", value, "examResetNum");
            return (Criteria) this;
        }

        public Criteria andExamResetNumLessThan(Integer value) {
            addCriterion("exam_reset_num <", value, "examResetNum");
            return (Criteria) this;
        }

        public Criteria andExamResetNumLessThanOrEqualTo(Integer value) {
            addCriterion("exam_reset_num <=", value, "examResetNum");
            return (Criteria) this;
        }

        public Criteria andExamResetNumIn(List<Integer> values) {
            addCriterion("exam_reset_num in", values, "examResetNum");
            return (Criteria) this;
        }

        public Criteria andExamResetNumNotIn(List<Integer> values) {
            addCriterion("exam_reset_num not in", values, "examResetNum");
            return (Criteria) this;
        }

        public Criteria andExamResetNumBetween(Integer value1, Integer value2) {
            addCriterion("exam_reset_num between", value1, value2, "examResetNum");
            return (Criteria) this;
        }

        public Criteria andExamResetNumNotBetween(Integer value1, Integer value2) {
            addCriterion("exam_reset_num not between", value1, value2, "examResetNum");
            return (Criteria) this;
        }

        public Criteria andExamNumIsNull() {
            addCriterion("exam_num is null");
            return (Criteria) this;
        }

        public Criteria andExamNumIsNotNull() {
            addCriterion("exam_num is not null");
            return (Criteria) this;
        }

        public Criteria andExamNumEqualTo(Integer value) {
            addCriterion("exam_num =", value, "examNum");
            return (Criteria) this;
        }

        public Criteria andExamNumNotEqualTo(Integer value) {
            addCriterion("exam_num <>", value, "examNum");
            return (Criteria) this;
        }

        public Criteria andExamNumGreaterThan(Integer value) {
            addCriterion("exam_num >", value, "examNum");
            return (Criteria) this;
        }

        public Criteria andExamNumGreaterThanOrEqualTo(Integer value) {
            addCriterion("exam_num >=", value, "examNum");
            return (Criteria) this;
        }

        public Criteria andExamNumLessThan(Integer value) {
            addCriterion("exam_num <", value, "examNum");
            return (Criteria) this;
        }

        public Criteria andExamNumLessThanOrEqualTo(Integer value) {
            addCriterion("exam_num <=", value, "examNum");
            return (Criteria) this;
        }

        public Criteria andExamNumIn(List<Integer> values) {
            addCriterion("exam_num in", values, "examNum");
            return (Criteria) this;
        }

        public Criteria andExamNumNotIn(List<Integer> values) {
            addCriterion("exam_num not in", values, "examNum");
            return (Criteria) this;
        }

        public Criteria andExamNumBetween(Integer value1, Integer value2) {
            addCriterion("exam_num between", value1, value2, "examNum");
            return (Criteria) this;
        }

        public Criteria andExamNumNotBetween(Integer value1, Integer value2) {
            addCriterion("exam_num not between", value1, value2, "examNum");
            return (Criteria) this;
        }

        public Criteria andExamTimeIsNull() {
            addCriterion("exam_time is null");
            return (Criteria) this;
        }

        public Criteria andExamTimeIsNotNull() {
            addCriterion("exam_time is not null");
            return (Criteria) this;
        }

        public Criteria andExamTimeEqualTo(String value) {
            addCriterion("exam_time =", value, "examTime");
            return (Criteria) this;
        }

        public Criteria andExamTimeNotEqualTo(String value) {
            addCriterion("exam_time <>", value, "examTime");
            return (Criteria) this;
        }

        public Criteria andExamTimeGreaterThan(String value) {
            addCriterion("exam_time >", value, "examTime");
            return (Criteria) this;
        }

        public Criteria andExamTimeGreaterThanOrEqualTo(String value) {
            addCriterion("exam_time >=", value, "examTime");
            return (Criteria) this;
        }

        public Criteria andExamTimeLessThan(String value) {
            addCriterion("exam_time <", value, "examTime");
            return (Criteria) this;
        }

        public Criteria andExamTimeLessThanOrEqualTo(String value) {
            addCriterion("exam_time <=", value, "examTime");
            return (Criteria) this;
        }

        public Criteria andExamTimeLike(String value) {
            addCriterion("exam_time like", value, "examTime");
            return (Criteria) this;
        }

        public Criteria andExamTimeNotLike(String value) {
            addCriterion("exam_time not like", value, "examTime");
            return (Criteria) this;
        }

        public Criteria andExamTimeIn(List<String> values) {
            addCriterion("exam_time in", values, "examTime");
            return (Criteria) this;
        }

        public Criteria andExamTimeNotIn(List<String> values) {
            addCriterion("exam_time not in", values, "examTime");
            return (Criteria) this;
        }

        public Criteria andExamTimeBetween(String value1, String value2) {
            addCriterion("exam_time between", value1, value2, "examTime");
            return (Criteria) this;
        }

        public Criteria andExamTimeNotBetween(String value1, String value2) {
            addCriterion("exam_time not between", value1, value2, "examTime");
            return (Criteria) this;
        }

        public Criteria andExamUseIsNull() {
            addCriterion("exam_use is null");
            return (Criteria) this;
        }

        public Criteria andExamUseIsNotNull() {
            addCriterion("exam_use is not null");
            return (Criteria) this;
        }

        public Criteria andExamUseEqualTo(Integer value) {
            addCriterion("exam_use =", value, "examUse");
            return (Criteria) this;
        }

        public Criteria andExamUseNotEqualTo(Integer value) {
            addCriterion("exam_use <>", value, "examUse");
            return (Criteria) this;
        }

        public Criteria andExamUseGreaterThan(Integer value) {
            addCriterion("exam_use >", value, "examUse");
            return (Criteria) this;
        }

        public Criteria andExamUseGreaterThanOrEqualTo(Integer value) {
            addCriterion("exam_use >=", value, "examUse");
            return (Criteria) this;
        }

        public Criteria andExamUseLessThan(Integer value) {
            addCriterion("exam_use <", value, "examUse");
            return (Criteria) this;
        }

        public Criteria andExamUseLessThanOrEqualTo(Integer value) {
            addCriterion("exam_use <=", value, "examUse");
            return (Criteria) this;
        }

        public Criteria andExamUseIn(List<Integer> values) {
            addCriterion("exam_use in", values, "examUse");
            return (Criteria) this;
        }

        public Criteria andExamUseNotIn(List<Integer> values) {
            addCriterion("exam_use not in", values, "examUse");
            return (Criteria) this;
        }

        public Criteria andExamUseBetween(Integer value1, Integer value2) {
            addCriterion("exam_use between", value1, value2, "examUse");
            return (Criteria) this;
        }

        public Criteria andExamUseNotBetween(Integer value1, Integer value2) {
            addCriterion("exam_use not between", value1, value2, "examUse");
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

        public Criteria andCreatByIsNull() {
            addCriterion("creat_by is null");
            return (Criteria) this;
        }

        public Criteria andCreatByIsNotNull() {
            addCriterion("creat_by is not null");
            return (Criteria) this;
        }

        public Criteria andCreatByEqualTo(Long value) {
            addCriterion("creat_by =", value, "creatBy");
            return (Criteria) this;
        }

        public Criteria andCreatByNotEqualTo(Long value) {
            addCriterion("creat_by <>", value, "creatBy");
            return (Criteria) this;
        }

        public Criteria andCreatByGreaterThan(Long value) {
            addCriterion("creat_by >", value, "creatBy");
            return (Criteria) this;
        }

        public Criteria andCreatByGreaterThanOrEqualTo(Long value) {
            addCriterion("creat_by >=", value, "creatBy");
            return (Criteria) this;
        }

        public Criteria andCreatByLessThan(Long value) {
            addCriterion("creat_by <", value, "creatBy");
            return (Criteria) this;
        }

        public Criteria andCreatByLessThanOrEqualTo(Long value) {
            addCriterion("creat_by <=", value, "creatBy");
            return (Criteria) this;
        }

        public Criteria andCreatByIn(List<Long> values) {
            addCriterion("creat_by in", values, "creatBy");
            return (Criteria) this;
        }

        public Criteria andCreatByNotIn(List<Long> values) {
            addCriterion("creat_by not in", values, "creatBy");
            return (Criteria) this;
        }

        public Criteria andCreatByBetween(Long value1, Long value2) {
            addCriterion("creat_by between", value1, value2, "creatBy");
            return (Criteria) this;
        }

        public Criteria andCreatByNotBetween(Long value1, Long value2) {
            addCriterion("creat_by not between", value1, value2, "creatBy");
            return (Criteria) this;
        }

        public Criteria andChangeTimeIsNull() {
            addCriterion("change_time is null");
            return (Criteria) this;
        }

        public Criteria andChangeTimeIsNotNull() {
            addCriterion("change_time is not null");
            return (Criteria) this;
        }

        public Criteria andChangeTimeEqualTo(Long value) {
            addCriterion("change_time =", value, "changeTime");
            return (Criteria) this;
        }

        public Criteria andChangeTimeNotEqualTo(Long value) {
            addCriterion("change_time <>", value, "changeTime");
            return (Criteria) this;
        }

        public Criteria andChangeTimeGreaterThan(Long value) {
            addCriterion("change_time >", value, "changeTime");
            return (Criteria) this;
        }

        public Criteria andChangeTimeGreaterThanOrEqualTo(Long value) {
            addCriterion("change_time >=", value, "changeTime");
            return (Criteria) this;
        }

        public Criteria andChangeTimeLessThan(Long value) {
            addCriterion("change_time <", value, "changeTime");
            return (Criteria) this;
        }

        public Criteria andChangeTimeLessThanOrEqualTo(Long value) {
            addCriterion("change_time <=", value, "changeTime");
            return (Criteria) this;
        }

        public Criteria andChangeTimeIn(List<Long> values) {
            addCriterion("change_time in", values, "changeTime");
            return (Criteria) this;
        }

        public Criteria andChangeTimeNotIn(List<Long> values) {
            addCriterion("change_time not in", values, "changeTime");
            return (Criteria) this;
        }

        public Criteria andChangeTimeBetween(Long value1, Long value2) {
            addCriterion("change_time between", value1, value2, "changeTime");
            return (Criteria) this;
        }

        public Criteria andChangeTimeNotBetween(Long value1, Long value2) {
            addCriterion("change_time not between", value1, value2, "changeTime");
            return (Criteria) this;
        }

        public Criteria andChangeByIsNull() {
            addCriterion("change_by is null");
            return (Criteria) this;
        }

        public Criteria andChangeByIsNotNull() {
            addCriterion("change_by is not null");
            return (Criteria) this;
        }

        public Criteria andChangeByEqualTo(Long value) {
            addCriterion("change_by =", value, "changeBy");
            return (Criteria) this;
        }

        public Criteria andChangeByNotEqualTo(Long value) {
            addCriterion("change_by <>", value, "changeBy");
            return (Criteria) this;
        }

        public Criteria andChangeByGreaterThan(Long value) {
            addCriterion("change_by >", value, "changeBy");
            return (Criteria) this;
        }

        public Criteria andChangeByGreaterThanOrEqualTo(Long value) {
            addCriterion("change_by >=", value, "changeBy");
            return (Criteria) this;
        }

        public Criteria andChangeByLessThan(Long value) {
            addCriterion("change_by <", value, "changeBy");
            return (Criteria) this;
        }

        public Criteria andChangeByLessThanOrEqualTo(Long value) {
            addCriterion("change_by <=", value, "changeBy");
            return (Criteria) this;
        }

        public Criteria andChangeByIn(List<Long> values) {
            addCriterion("change_by in", values, "changeBy");
            return (Criteria) this;
        }

        public Criteria andChangeByNotIn(List<Long> values) {
            addCriterion("change_by not in", values, "changeBy");
            return (Criteria) this;
        }

        public Criteria andChangeByBetween(Long value1, Long value2) {
            addCriterion("change_by between", value1, value2, "changeBy");
            return (Criteria) this;
        }

        public Criteria andChangeByNotBetween(Long value1, Long value2) {
            addCriterion("change_by not between", value1, value2, "changeBy");
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

        public Criteria andAttr14EqualTo(Long value) {
            addCriterion("attr14 =", value, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14NotEqualTo(Long value) {
            addCriterion("attr14 <>", value, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14GreaterThan(Long value) {
            addCriterion("attr14 >", value, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14GreaterThanOrEqualTo(Long value) {
            addCriterion("attr14 >=", value, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14LessThan(Long value) {
            addCriterion("attr14 <", value, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14LessThanOrEqualTo(Long value) {
            addCriterion("attr14 <=", value, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14In(List<Long> values) {
            addCriterion("attr14 in", values, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14NotIn(List<Long> values) {
            addCriterion("attr14 not in", values, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14Between(Long value1, Long value2) {
            addCriterion("attr14 between", value1, value2, "attr14");
            return (Criteria) this;
        }

        public Criteria andAttr14NotBetween(Long value1, Long value2) {
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

        public Criteria andAttr15EqualTo(Double value) {
            addCriterion("attr15 =", value, "attr15");
            return (Criteria) this;
        }

        public Criteria andAttr15NotEqualTo(Double value) {
            addCriterion("attr15 <>", value, "attr15");
            return (Criteria) this;
        }

        public Criteria andAttr15GreaterThan(Double value) {
            addCriterion("attr15 >", value, "attr15");
            return (Criteria) this;
        }

        public Criteria andAttr15GreaterThanOrEqualTo(Double value) {
            addCriterion("attr15 >=", value, "attr15");
            return (Criteria) this;
        }

        public Criteria andAttr15LessThan(Double value) {
            addCriterion("attr15 <", value, "attr15");
            return (Criteria) this;
        }

        public Criteria andAttr15LessThanOrEqualTo(Double value) {
            addCriterion("attr15 <=", value, "attr15");
            return (Criteria) this;
        }

        public Criteria andAttr15In(List<Double> values) {
            addCriterion("attr15 in", values, "attr15");
            return (Criteria) this;
        }

        public Criteria andAttr15NotIn(List<Double> values) {
            addCriterion("attr15 not in", values, "attr15");
            return (Criteria) this;
        }

        public Criteria andAttr15Between(Double value1, Double value2) {
            addCriterion("attr15 between", value1, value2, "attr15");
            return (Criteria) this;
        }

        public Criteria andAttr15NotBetween(Double value1, Double value2) {
            addCriterion("attr15 not between", value1, value2, "attr15");
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