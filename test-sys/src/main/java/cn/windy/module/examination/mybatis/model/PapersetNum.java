package cn.windy.module.examination.mybatis.model;

import java.io.Serializable;

public class PapersetNum implements Serializable {
    private Long id;

    /**
     * 分类id
     */
    private Long questypeid;

    /**
     * 试卷Id
     */
    private Long creatid;

    /**
     * 单选题数量
     */
    private Integer danxuannum;

    /**
     * 多选题数量
     */
    private Integer duoxuannum;

    /**
     * 判断题数量
     */
    private Integer panudannum;

    /**
     * 描述
     */
    private String decrion;

    /**
     * 类型
     */
    private String type;

    /**
     * 状态
     */
    private String stautes;

    private String creattime;

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

    private Long attr10;

    private Long attr11;

    private Long attr12;

    private static final long serialVersionUID = 1L;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getQuestypeid() {
        return questypeid;
    }

    public void setQuestypeid(Long questypeid) {
        this.questypeid = questypeid;
    }

    public Long getCreatid() {
        return creatid;
    }

    public void setCreatid(Long creatid) {
        this.creatid = creatid;
    }

    public Integer getDanxuannum() {
        return danxuannum;
    }

    public void setDanxuannum(Integer danxuannum) {
        this.danxuannum = danxuannum;
    }

    public Integer getDuoxuannum() {
        return duoxuannum;
    }

    public void setDuoxuannum(Integer duoxuannum) {
        this.duoxuannum = duoxuannum;
    }

    public Integer getPanudannum() {
        return panudannum;
    }

    public void setPanudannum(Integer panudannum) {
        this.panudannum = panudannum;
    }

    public String getDecrion() {
        return decrion;
    }

    public void setDecrion(String decrion) {
        this.decrion = decrion == null ? null : decrion.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getStautes() {
        return stautes;
    }

    public void setStautes(String stautes) {
        this.stautes = stautes == null ? null : stautes.trim();
    }

    public String getCreattime() {
        return creattime;
    }

    public void setCreattime(String creattime) {
        this.creattime = creattime == null ? null : creattime.trim();
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

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", questypeid=").append(questypeid);
        sb.append(", creatid=").append(creatid);
        sb.append(", danxuannum=").append(danxuannum);
        sb.append(", duoxuannum=").append(duoxuannum);
        sb.append(", panudannum=").append(panudannum);
        sb.append(", decrion=").append(decrion);
        sb.append(", type=").append(type);
        sb.append(", stautes=").append(stautes);
        sb.append(", creattime=").append(creattime);
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
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}