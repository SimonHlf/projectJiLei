package cn.windy.module.examination.mybatis.model;

import java.io.Serializable;

public class ExamineeInformation implements Serializable {
    /**
     * 考生信息表
     */
    private Long id;

    /**
     * 名字
     */
    private String exName;

    /**
     * 性别
     */
    private String exGender;

    /**
     * 年龄
     */
    private Integer exAge;

    /**
     * 编号
     */
    private Long exNum;

    /**
     * 详细信息
     */
    private String exInformation;

    /**
     * 头像
     */
    private String exPicture;

    /**
     * 类型
     */
    private Integer exType;

    /**
     * 状态
     */
    private Integer exState;

    /**
     * 所属机构
     */
    private Long exOrgId;

    /**
     * 创建时间
     */
    private String creatTime;

    /**
     * 修改时间
     */
    private String updateTime;

    private String attr0;

    private String attr1;

    private String attr2;

    private String attr3;

    private String attr4;

    private Integer attr5;

    private Integer attr6;

    private Integer attr7;

    private Integer attr8;

    private Integer attr9;

    private Long attr10;

    private Long attr11;

    private Long attr12;

    private Long attr13;

    private Double attr14;

    private static final long serialVersionUID = 1L;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getExName() {
        return exName;
    }

    public void setExName(String exName) {
        this.exName = exName == null ? null : exName.trim();
    }

    public String getExGender() {
        return exGender;
    }

    public void setExGender(String exGender) {
        this.exGender = exGender == null ? null : exGender.trim();
    }

    public Integer getExAge() {
        return exAge;
    }

    public void setExAge(Integer exAge) {
        this.exAge = exAge;
    }

    public Long getExNum() {
        return exNum;
    }

    public void setExNum(Long exNum) {
        this.exNum = exNum;
    }

    public String getExInformation() {
        return exInformation;
    }

    public void setExInformation(String exInformation) {
        this.exInformation = exInformation == null ? null : exInformation.trim();
    }

    public String getExPicture() {
        return exPicture;
    }

    public void setExPicture(String exPicture) {
        this.exPicture = exPicture == null ? null : exPicture.trim();
    }

    public Integer getExType() {
        return exType;
    }

    public void setExType(Integer exType) {
        this.exType = exType;
    }

    public Integer getExState() {
        return exState;
    }

    public void setExState(Integer exState) {
        this.exState = exState;
    }

    public Long getExOrgId() {
        return exOrgId;
    }

    public void setExOrgId(Long exOrgId) {
        this.exOrgId = exOrgId;
    }

    public String getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(String creatTime) {
        this.creatTime = creatTime == null ? null : creatTime.trim();
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime == null ? null : updateTime.trim();
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

    public Integer getAttr5() {
        return attr5;
    }

    public void setAttr5(Integer attr5) {
        this.attr5 = attr5;
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

    public Long getAttr10() {
        return attr10;
    }

    public void setAttr10(Long attr10) {
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

    public Double getAttr14() {
        return attr14;
    }

    public void setAttr14(Double attr14) {
        this.attr14 = attr14;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", exName=").append(exName);
        sb.append(", exGender=").append(exGender);
        sb.append(", exAge=").append(exAge);
        sb.append(", exNum=").append(exNum);
        sb.append(", exInformation=").append(exInformation);
        sb.append(", exPicture=").append(exPicture);
        sb.append(", exType=").append(exType);
        sb.append(", exState=").append(exState);
        sb.append(", exOrgId=").append(exOrgId);
        sb.append(", creatTime=").append(creatTime);
        sb.append(", updateTime=").append(updateTime);
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
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}