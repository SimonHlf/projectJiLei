package cn.windy.module.admin.hibernate.model;

import cn.windy.module.core.hibernate.model.BaseModel;

import javax.persistence.*;

@Entity
@Table(name = "windy_role")
public class Role extends BaseModel {
    private String name;
    private String code;
    private String remark;
    private String dataPermission;

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
    @Column(name = "remark")
    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Basic
    @Column(name = "data_permission")
    public String getDataPermission() {
        return dataPermission;
    }

    public void setDataPermission(String dataPermission) {
        this.dataPermission = dataPermission;
    }

}
