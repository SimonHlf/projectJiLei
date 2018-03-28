package cn.windy.module.examination.mybatis.model;

import java.io.Serializable;

public class PaperSet implements Serializable {
    /**
     * 试卷设置表
     */
    private Long id;

    /**
     * 试卷id
     */
    private Long paperId;

    /**
     * 试卷题目比例(例1:5:4)
     */
    private String paperProportion;

    /**
     * 达标分数线
     */
    private Integer paperLine;

    /**
     * 试卷总分设置
     */
    private Integer paperTotail;

    /**
     * 考试总人数
     */
    private Integer examTotle;

    /**
     * 考试实到人数
     */
    private Integer examReal;

    /**
     * 补考人数
     */
    private Integer examReset;

    /**
     * 重复考试次数
     */
    private Integer examResetNum;

    /**
     * 考试次数
     */
    private Integer examNum;

    /**
     * 考试时间限制
     */
    private String examTime;

    /**
     * 使用试卷次数
     */
    private Integer examUse;

    /**
     * 创建时间
     */
    private String creatTime;

    /**
     * 创建人ID
     */
    private Long creatBy;

    /**
     * 修改时间
     */
    private Long changeTime;

    /**
     * 修改人ID
     */
    private Long changeBy;

    private String attr0;

    private String attr1;

    private String attr2;

    private String attr3;

    private String attr4;

    private String attr5;

    private Integer attr6;

    private Integer attr7;

    private Integer attr8;

    private Integer attr9;

    private Integer attr10;

    private Long attr11;

    private Long attr12;

    private Long attr13;

    private Long attr14;

    private Double attr15;

    private static final long serialVersionUID = 1L;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getPaperId() {
        return paperId;
    }

    public void setPaperId(Long paperId) {
        this.paperId = paperId;
    }

    public String getPaperProportion() {
        return paperProportion;
    }

    public void setPaperProportion(String paperProportion) {
        this.paperProportion = paperProportion == null ? null : paperProportion.trim();
    }

    public Integer getPaperLine() {
        return paperLine;
    }

    public void setPaperLine(Integer paperLine) {
        this.paperLine = paperLine;
    }

    public Integer getPaperTotail() {
        return paperTotail;
    }

    public void setPaperTotail(Integer paperTotail) {
        this.paperTotail = paperTotail;
    }

    public Integer getExamTotle() {
        return examTotle;
    }

    public void setExamTotle(Integer examTotle) {
        this.examTotle = examTotle;
    }

    public Integer getExamReal() {
        return examReal;
    }

    public void setExamReal(Integer examReal) {
        this.examReal = examReal;
    }

    public Integer getExamReset() {
        return examReset;
    }

    public void setExamReset(Integer examReset) {
        this.examReset = examReset;
    }

    public Integer getExamResetNum() {
        return examResetNum;
    }

    public void setExamResetNum(Integer examResetNum) {
        this.examResetNum = examResetNum;
    }

    public Integer getExamNum() {
        return examNum;
    }

    public void setExamNum(Integer examNum) {
        this.examNum = examNum;
    }

    public String getExamTime() {
        return examTime;
    }

    public void setExamTime(String examTime) {
        this.examTime = examTime == null ? null : examTime.trim();
    }

    public Integer getExamUse() {
        return examUse;
    }

    public void setExamUse(Integer examUse) {
        this.examUse = examUse;
    }

    public String getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(String creatTime) {
        this.creatTime = creatTime == null ? null : creatTime.trim();
    }

    public Long getCreatBy() {
        return creatBy;
    }

    public void setCreatBy(Long creatBy) {
        this.creatBy = creatBy;
    }

    public Long getChangeTime() {
        return changeTime;
    }

    public void setChangeTime(Long changeTime) {
        this.changeTime = changeTime;
    }

    public Long getChangeBy() {
        return changeBy;
    }

    public void setChangeBy(Long changeBy) {
        this.changeBy = changeBy;
    }

    public String getAttr0() {
        return attr0;
    }

    public void setAttr0(String attr0) {
        this.attr0 = attr0 == null ? null : attr0.trim();
    }

    public String getAttr1() {
        return attr1;
    }

    public void setAttr1(String attr1) {
        this.attr1 = attr1 == null ? null : attr1.trim();
    }

    public String getAttr2() {
        return attr2;
    }

    public void setAttr2(String attr2) {
        this.attr2 = attr2 == null ? null : attr2.trim();
    }

    public String getAttr3() {
        return attr3;
    }

    public void setAttr3(String attr3) {
        this.attr3 = attr3 == null ? null : attr3.trim();
    }

    public String getAttr4() {
        return attr4;
    }

    public void setAttr4(String attr4) {
        this.attr4 = attr4 == null ? null : attr4.trim();
    }

    public String getAttr5() {
        return attr5;
    }

    public void setAttr5(String attr5) {
        this.attr5 = attr5 == null ? null : attr5.trim();
    }

    public Integer getAttr6() {
        return attr6;
    }

    public void setAttr6(Integer attr6) {
        this.attr6 = attr6;
    }

    public Integer getAttr7() {
        return attr7;
    }

    public void setAttr7(Integer attr7) {
        this.attr7 = attr7;
    }

    public Integer getAttr8() {
        return attr8;
    }

    public void setAttr8(Integer attr8) {
        this.attr8 = attr8;
    }

    public Integer getAttr9() {
        return attr9;
    }

    public void setAttr9(Integer attr9) {
        this.attr9 = attr9;
    }

    public Integer getAttr10() {
        return attr10;
    }

    public void setAttr10(Integer attr10) {
        this.attr10 = attr10;
    }

    public Long getAttr11() {
        return attr11;
    }

    public void setAttr11(Long attr11) {
        this.attr11 = attr11;
    }

    public Long getAttr12() {
        return attr12;
    }

    public void setAttr12(Long attr12) {
        this.attr12 = attr12;
    }

    public Long getAttr13() {
        return attr13;
    }

    public void setAttr13(Long attr13) {
        this.attr13 = attr13;
    }

    public Long getAttr14() {
        return attr14;
    }

    public void setAttr14(Long attr14) {
        this.attr14 = attr14;
    }

    public Double getAttr15() {
        return attr15;
    }

    public void setAttr15(Double attr15) {
        this.attr15 = attr15;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", paperId=").append(paperId);
        sb.append(", paperProportion=").append(paperProportion);
        sb.append(", paperLine=").append(paperLine);
        sb.append(", paperTotail=").append(paperTotail);
        sb.append(", examTotle=").append(examTotle);
        sb.append(", examReal=").append(examReal);
        sb.append(", examReset=").append(examReset);
        sb.append(", examResetNum=").append(examResetNum);
        sb.append(", examNum=").append(examNum);
        sb.append(", examTime=").append(examTime);
        sb.append(", examUse=").append(examUse);
        sb.append(", creatTime=").append(creatTime);
        sb.append(", creatBy=").append(creatBy);
        sb.append(", changeTime=").append(changeTime);
        sb.append(", changeBy=").append(changeBy);
        sb.append(", attr0=").append(attr0);
        sb.append(", attr1=").append(attr1);
        sb.append(", attr2=").append(attr2);
        sb.append(", attr3=").append(attr3);
        sb.append(", attr4=").append(attr4);
        sb.append(", attr5=").append(attr5);
        sb.append(", attr6=").append(attr6);
        sb.append(", attr7=").append(attr7);
        sb.append(", attr8=").append(attr8);
        sb.append(", attr9=").append(attr9);
        sb.append(", attr10=").append(attr10);
        sb.append(", attr11=").append(attr11);
        sb.append(", attr12=").append(attr12);
        sb.append(", attr13=").append(attr13);
        sb.append(", attr14=").append(attr14);
        sb.append(", attr15=").append(attr15);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}