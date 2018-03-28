package cn.windy.util;

import java.io.Serializable;

public class ZtreeModel implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String id;
	private String pid;
	private String name;
	private String click;
	private Boolean isParent;//是否为父节点
	private String icon;//图片的存放路径
	private Boolean open;
	private Boolean checked;
	
	
	
	
	public ZtreeModel() {
	}
	public ZtreeModel(String id, String pid, String name, String click,
			Boolean isParent,String icon,Boolean open) {
		super();
		this.id = id;
		this.pid = pid;
		this.name = name;
		this.click = click;
		this.isParent = isParent;
		this.icon = icon;
		this.open=open;
	}
	
	public ZtreeModel(String id, String pid, String name, String click,
			Boolean isParent,String icon,Boolean open,Boolean checked) {
		super();
		this.id = id;
		this.pid = pid;
		this.name = name;
		this.click = click;
		this.isParent = isParent;
		this.icon = icon;
		this.open=open;
		this.checked=checked;
	}
	
	public Boolean getChecked() {
		return checked;
	}
	public void setChecked(Boolean checked) {
		this.checked = checked;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getClick() {
		return click;
	}
	public void setClick(String click) {
		this.click = click;
	}
	public Boolean getIsParent() {
		return isParent;
	}
	public void setIsParent(Boolean isParent) {
		this.isParent = isParent;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public Boolean getOpen() {
		return open;
	}
	public void setOpen(Boolean isOpen) {
		this.open = isOpen;
	}
}
