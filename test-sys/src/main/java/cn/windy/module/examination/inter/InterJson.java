package cn.windy.module.examination.inter;

import cn.windy.module.examination.mybatis.model.FrontUser;
import cn.windy.util.Pagination;

import java.util.List;

public class InterJson {

    private String code;
    private String msg;
    private boolean result;
    private FrontUser frontUser;
    private Pagination pagination;
    private List<?> data;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public boolean isResult() {
        return result;
    }

    public void setResult(boolean result) {
        this.result = result;
    }

    public FrontUser getFrontUser() {
        return frontUser;
    }

    public void setFrontUser(FrontUser frontUser) {
        this.frontUser = frontUser;
    }

    public Pagination getPagination() {
        return pagination;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }

    public List<?> getData() {
        return data;
    }

    public void setData(List<?> data) {
        this.data = data;
    }
}
