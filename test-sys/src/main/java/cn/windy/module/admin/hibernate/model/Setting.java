package cn.windy.module.admin.hibernate.model;

import cn.windy.module.core.hibernate.model.BaseModel;

import javax.persistence.*;

@Entity
@Table(name = "windy_setting")
public class Setting extends BaseModel {
    private String name;
    private String shortName;
    private String domain;
    private String recordNumber;
    private String addIsDialog; //添加和编辑是不是弹出窗口
    private String orgIsUse;    //是否启用组织
    private Double oldMoneyNum;
    private Double couponNum;

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "short_name")
    public String getShortName() {
        return shortName;
    }

    public void setShortName(String shortName) {
        this.shortName = shortName;
    }

    @Basic
    @Column(name = "domain")
    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain;
    }

    @Basic
    @Column(name = "record_number")
    public String getRecordNumber() {
        return recordNumber;
    }

    public void setRecordNumber(String recordNumber) {
        this.recordNumber = recordNumber;
    }

    @Basic
    @Column(name = "add_is_dialog")
    public String getAddIsDialog() {
        return addIsDialog;
    }

    public void setAddIsDialog(String addIsDialog) {
        this.addIsDialog = addIsDialog;
    }


    @Basic
    @Column(name = "org_is_use")
    public String getOrgIsUse() {
        return orgIsUse;
    }

    public void setOrgIsUse(String orgIsUse) {
        this.orgIsUse = orgIsUse;
    }
    @Basic
    @Column(name = "oldMoney_num")
    public Double getOldMoneyNum() {
        return oldMoneyNum;
    }

    public void setOldMoneyNum(Double oldMoneyNum) {
        this.oldMoneyNum = oldMoneyNum;
    }
    @Basic
    @Column(name = "coupon_num")
    public Double getCouponNum() {
        return couponNum;
    }

    public void setCouponNum(Double couponNum) {
        this.couponNum = couponNum;
    }
}
