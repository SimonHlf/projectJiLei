package cn.windy.module.core.dao.bean;

import java.util.Map;

public class Where {
    private String where;
    private Map<String,Object> param;

    public Where(){}

    public Where(String where, Map<String, Object> param) {
        this.where = where;
        this.param = param;
    }

    public String getWhere() {
        return where;
    }

    public void setWhere(String where) {
        this.where = where;
    }

    public Map<String, Object> getParam() {
        return param;
    }

    public void setParam(Map<String, Object> param) {
        this.param = param;
    }

    @Override
    public String toString() {
        return "Where{" +
                "where='" + where + '\'' +
                ", param=" + param +
                '}';
    }
}
