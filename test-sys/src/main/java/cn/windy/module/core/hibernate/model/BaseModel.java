package cn.windy.module.core.hibernate.model;

import cn.windy.util.StringUtil;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 此类为所有hibernate映射类的基类，<br>
 *     1、在这里添加了默认的字段信息：主键、10个备用字段、添加人、修改人、添加时间、修改时间、标识<br>
 *     2、添加了两个数据库无关的三个字段resultMessage、resultState、condition，前两个用来保存处理结果，后一个用来保存查询条件
 * @author zhangzunwei:1760708176@qq.com
 *
 */
@MappedSuperclass
public class BaseModel implements Serializable {

    private Long id;

    private String attr0;
    private String attr1;
    private String attr2;
    private String attr3;
    private String attr4;
    private String attr5;
    private String attr6;
    private String attr7;
    private String attr8;
    private String attr9;

    private Long addUser;
    private Long updateUser;
    private String addTime;
    private String updateTime;

    private String order;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "attr0")
    public String getAttr0() {
        return attr0;
    }

    public void setAttr0(String attr0) {
        this.attr0 = attr0;
    }

    @Basic
    @Column(name = "attr1")
    public String getAttr1() {
        return attr1;
    }

    public void setAttr1(String attr1) {
        this.attr1 = attr1;
    }

    @Basic
    @Column(name = "attr2")
    public String getAttr2() {
        return attr2;
    }

    public void setAttr2(String attr2) {
        this.attr2 = attr2;
    }

    @Basic
    @Column(name = "attr3")
    public String getAttr3() {
        return attr3;
    }

    public void setAttr3(String attr3) {
        this.attr3 = attr3;
    }

    @Basic
    @Column(name = "attr4")
    public String getAttr4() {
        return attr4;
    }

    public void setAttr4(String attr4) {
        this.attr4 = attr4;
    }

    @Basic
    @Column(name = "attr5")
    public String getAttr5() {
        return attr5;
    }

    public void setAttr5(String attr5) {
        this.attr5 = attr5;
    }

    @Basic
    @Column(name = "attr6")
    public String getAttr6() {
        return attr6;
    }

    public void setAttr6(String attr6) {
        this.attr6 = attr6;
    }

    @Basic
    @Column(name = "attr7")
    public String getAttr7() {
        return attr7;
    }

    public void setAttr7(String attr7) {
        this.attr7 = attr7;
    }

    @Basic
    @Column(name = "attr8")
    public String getAttr8() {
        return attr8;
    }

    public void setAttr8(String attr8) {
        this.attr8 = attr8;
    }

    @Basic
    @Column(name = "attr9")
    public String getAttr9() {
        return attr9;
    }

    public void setAttr9(String attr9) {
        this.attr9 = attr9;
    }

    @Basic
    @Column(name = "add_User")
    public Long getAddUser() {
        return addUser;
    }

    public void setAddUser(Long addUser) {
        this.addUser = addUser;
    }

    @Basic
    @Column(name = "update_User")
    public Long getUpdateUser() {
        return updateUser;
    }

    public void setUpdateUser(Long updateUser) {
        this.updateUser = updateUser;
    }

    @Basic
    @Column(name = "add_Time")
    public String getAddTime() {
        return addTime;
    }

    public void setAddTime(String addTime) {
        this.addTime = addTime;
    }

    @Basic
    @Column(name = "update_Time")
    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    private String resultInfo;

    private boolean resultState;

    private String condition="[%s]";

    @Transient
    public String getResultInfo() {
        return resultInfo;
    }

    public void setResultInfo(String resultInfo) {
        this.resultInfo = resultInfo;
    }

    @Transient
    public boolean isResultState() {
        return resultState;
    }

    public void setResultState(boolean resultState) {
        this.resultState = resultState;
    }

    @Transient
    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    /**
     * 设置查询条件，都包含哪些这段，及关系，使用json格式来说明。
     * 格式如：{property:'name',required:true,relation:'and',isLike:false}
     *
     * @return
     */
    @Transient
    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public void addCondition(String property, boolean required, String relation, boolean isLike) {
        String condition = String.format("{property:'%s',required:%b,relation:'%s',isLike:%b}",
                property, required, relation, isLike);
        addCondition(condition);
    }

    public void addCondition(String condition) {
        if (!StringUtil.isBlank(condition)) {
            if(this.condition.length()>4){
                this.condition = String.format(this.condition,","+condition+"%s");
            }else{
                this.condition = String.format(this.condition,condition+"%s");
            }
        }
    }


}
