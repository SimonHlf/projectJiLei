package cn.windy.module.admin.hibernate.model;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

public class OrgsUsersPK implements Serializable {
    private long oid;
    private long uid;

    @Column(name = "oid")
    @Id
    public long getOid() {
        return oid;
    }

    public void setOid(long oid) {
        this.oid = oid;
    }

    @Column(name = "uid")
    @Id
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

        OrgsUsersPK that = (OrgsUsersPK) o;

        if (oid != that.oid) return false;
        if (uid != that.uid) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (oid ^ (oid >>> 32));
        result = 31 * result + (int) (uid ^ (uid >>> 32));
        return result;
    }
}
