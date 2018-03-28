package cn.windy.module.admin.hibernate.model;

import javax.persistence.*;

@Entity
@Table(name = "windy_users_roles", schema = "windy", catalog = "")
@IdClass(UsersRolesPK.class)
public class UsersRoles {
    private long uid;
    private long rid;

    @Id
    @Column(name = "uid")
    public long getUid() {
        return uid;
    }

    public void setUid(long uid) {
        this.uid = uid;
    }

    @Id
    @Column(name = "rid")
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

        UsersRoles that = (UsersRoles) o;

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
