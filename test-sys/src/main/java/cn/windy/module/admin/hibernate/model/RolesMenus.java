package cn.windy.module.admin.hibernate.model;

import javax.persistence.*;

@Entity
@Table(name = "windy_roles_menus", schema = "windy", catalog = "")
@IdClass(RolesMenusPK.class)
public class RolesMenus {
    private long rid;
    private long mid;

    @Id
    @Column(name = "rid")
    public long getRid() {
        return rid;
    }

    public void setRid(long rid) {
        this.rid = rid;
    }

    @Id
    @Column(name = "mid")
    public long getMid() {
        return mid;
    }

    public void setMid(long mid) {
        this.mid = mid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        RolesMenus that = (RolesMenus) o;

        if (rid != that.rid) return false;
        if (mid != that.mid) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (rid ^ (rid >>> 32));
        result = 31 * result + (int) (mid ^ (mid >>> 32));
        return result;
    }
}
