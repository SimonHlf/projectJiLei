package cn.windy.module.admin.hibernate.model;

import cn.windy.module.core.hibernate.model.BaseModel;

import javax.persistence.*;

@Entity
@Table(name = "windy_menu")
public class Menu extends BaseModel {
    private String name;
    private String icon;
    private String type;
    private String url;
    private Long pid;
    private String flag;
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
    @Column(name = "icon")
    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    @Basic
    @Column(name = "type")
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Basic
    @Column(name = "url")
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Basic
    @Column(name = "pid")
    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }

    @Basic
    @Column(name = "flag")
    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
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
