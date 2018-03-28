package cn.windy.module.admin.hibernate.model;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

public class RolesMenusPK implements Serializable {
    private long rid;
    private long mid;

    @Column(name = "rid")
    @Id
    public long getRid() {
        return rid;
    }

    public void setRid(long rid) {
        this.rid = rid;
    }

    @Column(name = "mid")
    @Id
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

        RolesMenusPK that = (RolesMenusPK) o;

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
