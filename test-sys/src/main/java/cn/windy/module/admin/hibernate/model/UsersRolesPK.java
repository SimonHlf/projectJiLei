package cn.windy.module.admin.hibernate.model;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

public class UsersRolesPK implements Serializable {
    private long uid;
    private long rid;

    @Column(name = "uid")
    @Id
    public long getUid() {
        return uid;
    }

    public void setUid(long uid) {
        this.uid = uid;
    }

    @Column(name = "rid")
    @Id
    public long getRid() {
        return rid;
    }

    public void setRid(long rid) {
        this.rid = rid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UsersRolesPK that = (UsersRolesPK) o;

        if (uid != that.uid) return false;
        if (rid != that.rid) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (uid ^ (uid >>> 32));
        result = 31 * result + (int) (rid ^ (rid >>> 32));
        return result;
    }
}
