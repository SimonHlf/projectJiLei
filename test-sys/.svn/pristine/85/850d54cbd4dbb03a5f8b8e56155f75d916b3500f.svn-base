package cn.windy.module.admin.hibernate.model;

import javax.persistence.*;

@Entity
@Table(name = "windy_orgs_users", schema = "windy", catalog = "")
@IdClass(OrgsUsersPK.class)
public class OrgsUsers {
    private long oid;
    private long uid;

    @Id
    @Column(name = "oid")
    public long getOid() {
        return oid;
    }

    public void setOid(long oid) {
        this.oid = oid;
    }

    @Id
    @Column(name = "uid")
    public long getUid() {
        return uid;
    }

    public void setUid(long uid) {
        this.uid = uid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        OrgsUsers orgsUsers = (OrgsUsers) o;

        if (oid != orgsUsers.oid) return false;
        if (uid != orgsUsers.uid) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (oid ^ (oid >>> 32));
        result = 31 * result + (int) (uid ^ (uid >>> 32));
        return result;
    }
}
