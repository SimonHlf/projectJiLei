package cn.windy.module.admin.hibernate.model;

import javax.persistence.*;

import cn.windy.module.core.hibernate.model.BaseModel;

/**
 * Created by root on 2017/9/27.
 */
@Entity
@Table(name = "phone_identy")
public class PhoneIdenty extends BaseModel {
    private String mobile;
    private String code;
    private String logInterval;
    private String createTime;
    private Integer status;

    @Basic
    @Column(name = "mobile")
    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    @Basic
    @Column(name = "code")
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Basic
    @Column(name = "log_interval")
    public String getLogInterval() {
        return logInterval;
    }

    public void setLogInterval(String logInterval) {
        this.logInterval = logInterval;
    }

    @Basic
    @Column(name = "create_time")
    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    @Basic
    @Column(name = "status")
    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        PhoneIdenty that = (PhoneIdenty) o;

        if (mobile != null ? !mobile.equals(that.mobile) : that.mobile != null) return false;
        if (code != null ? !code.equals(that.code) : that.code != null) return false;
        if (logInterval != null ? !logInterval.equals(that.logInterval) : that.logInterval != null) return false;
        if (createTime != null ? !createTime.equals(that.createTime) : that.createTime != null) return false;
        if (status != null ? !status.equals(that.status) : that.status != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = 1;
        result = 31 * result + (mobile != null ? mobile.hashCode() : 0);
        result = 31 * result + (code != null ? code.hashCode() : 0);
        result = 31 * result + (logInterval != null ? logInterval.hashCode() : 0);
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        result = 31 * result + (status != null ? status.hashCode() : 0);
        return result;
    }
}
