package cn.windy.module.examination.mybatis.model;

import java.io.Serializable;

public class Questions implements Serializable {
    /**
     * 试题表
     */
    private Long id;

    /**
     * 试题类型
     */
    private Long quesId;

    /**
     * 试题名称
     */
    private String name;

    /**
     * 类型（0单选，1多选，2判断）
     */
    private Integer type;

    /**
     * 状态
     */
    private String stutas;

    /**
     * 试题题目
     */
    private String title;

    /**
     * 试题图片路径
     */
    private String image;

    /**
     * 是否分享（0分享，1不分享）
     */
    private Integer isShare;

    /**
     * 答案A
     */
    private String optionA;

    /**
     * 答案B
     */
    private String optionB;

    /**
     * 答案C
     */
    private String optionC;

    /**
     * 答案D
     */
    private String optionD;

    /**
     * 答案E
     */
    private String optionE;

    /**
     * 答案F
     */
    private String optionF;

    /**
     * 答案G
     */
    private String optionG;

    /**
     * 答案H
     */
    private String optionH;

    /**
     * 正确答案
     */
    private String answer;

    /**
     * 创建时间
     */
    private String creatTime;

    /**
     * 修改时间
     */
    private String changeTime;

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

    private Integer attr11;

    private Long attr12;

    private Long attr13;

    private Long attr14;

    private Long attr15;

    private static final long serialVersionUID = 1L;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getQuesId() {
        return quesId;
    }

    public void setQuesId(Long quesId) {
        this.quesId = quesId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getStutas() {
        return stutas;
    }

    public void setStutas(String stutas) {
        this.stutas = stutas == null ? null : stutas.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    public Integer getIsShare() {
        return isShare;
    }

    public void setIsShare(Integer isShare) {
        this.isShare = isShare;
    }

    public String getOptionA() {
        return optionA;
    }

    public void setOptionA(String optionA) {
        this.optionA = optionA == null ? null : optionA.trim();
    }

    public String getOptionB() {
        return optionB;
    }

    public void setOptionB(String optionB) {
        this.optionB = optionB == null ? null : optionB.trim();
    }

    public String getOptionC() {
        return optionC;
    }

    public void setOptionC(String optionC) {
        this.optionC = optionC == null ? null : optionC.trim();
    }

    public String getOptionD() {
        return optionD;
    }

    public void setOptionD(String optionD) {
        this.optionD = optionD == null ? null : optionD.trim();
    }

    public String getOptionE() {
        return optionE;
    }

    public void setOptionE(String optionE) {
        this.optionE = optionE == null ? null : optionE.trim();
    }

    public String getOptionF() {
        return optionF;
    }

    public void setOptionF(String optionF) {
        this.optionF = optionF == null ? null : optionF.trim();
    }

    public String getOptionG() {
        return optionG;
    }

    public void setOptionG(String optionG) {
        this.optionG = optionG == null ? null : optionG.trim();
    }

    public String getOptionH() {
        return optionH;
    }

    public void setOptionH(String optionH) {
        this.optionH = optionH == null ? null : optionH.trim();
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer == null ? null : answer.trim();
    }

    public String getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(String creatTime) {
        this.creatTime = creatTime == null ? null : creatTime.trim();
    }

    public String getChangeTime() {
        return changeTime;
    }

    public void setChangeTime(String changeTime) {
        this.changeTime = changeTime == null ? null : changeTime.trim();
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

    public Integer getAttr11() {
        return attr11;
    }

    public void setAttr11(Integer attr11) {
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

    public Long getAttr15() {
        return attr15;
    }

    public void setAttr15(Long attr15) {
        this.attr15 = attr15;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", quesId=").append(quesId);
        sb.append(", name=").append(name);
        sb.append(", type=").append(type);
        sb.append(", stutas=").append(stutas);
        sb.append(", title=").append(title);
        sb.append(", image=").append(image);
        sb.append(", isShare=").append(isShare);
        sb.append(", optionA=").append(optionA);
        sb.append(", optionB=").append(optionB);
        sb.append(", optionC=").append(optionC);
        sb.append(", optionD=").append(optionD);
        sb.append(", optionE=").append(optionE);
        sb.append(", optionF=").append(optionF);
        sb.append(", optionG=").append(optionG);
        sb.append(", optionH=").append(optionH);
        sb.append(", answer=").append(answer);
        sb.append(", creatTime=").append(creatTime);
        sb.append(", changeTime=").append(changeTime);
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