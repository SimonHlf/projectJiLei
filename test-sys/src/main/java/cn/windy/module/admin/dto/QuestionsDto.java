package cn.windy.module.admin.dto;

/**
 * 试题管理传输类
 * @author xie
 *
 */
public class QuestionsDto {

	private Long id;//试题id
	
	private String name;//试题名称
	
	private String typeName;//试题分类
	
	private String type;//类型
	
	private String orgName;//所属机构
	
	private String creatTime;//创建时间
	
	private Integer attr8;
	
	public Integer getAttr8() {
		return attr8;
	}

	public void setAttr8(Integer attr8) {
		this.attr8 = attr8;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCreatTime() {
		return creatTime;
	}

	public void setCreatTime(String creatTime) {
		this.creatTime = creatTime;
	}
	
}
