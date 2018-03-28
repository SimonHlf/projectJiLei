package cn.windy.util;

import java.util.List;


public class MenuTree {
	private Long id;
	private Long pid;
	private String name;
	private String text;
	private List<MenuTree> children;
	private int attr1;
	private int attr2;
	private String attr3;
	private String attr4;
	private Long attr5;
	private Long attr6;
	
	private String attr7;
	private String attr8;
	private Long attr9;
	
	public MenuTree() {
		super();
	}

	public MenuTree(Long id, Long pid, String name, String text, List<MenuTree> children, int attr1, int attr2,
			String attr3, String attr4, Long attr5, Long attr6, String attr7, String attr8, Long attr9) {
		super();
		this.id = id;
		this.pid = pid;
		this.name = name;
		this.text = text;
		this.children = children;
		this.attr1 = attr1;
		this.attr2 = attr2;
		this.attr3 = attr3;
		this.attr4 = attr4;
		this.attr5 = attr5;
		this.attr6 = attr6;
		this.attr7 = attr7;
		this.attr8 = attr8;
		this.attr9 = attr9;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getPid() {
		return pid;
	}

	public void setPid(Long pid) {
		this.pid = pid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public List<MenuTree> getChildren() {
		return children;
	}

	public void setChildren(List<MenuTree> children) {
		this.children = children;
	}

	public int getAttr1() {
		return attr1;
	}

	public void setAttr1(int attr1) {
		this.attr1 = attr1;
	}

	public int getAttr2() {
		return attr2;
	}

	public void setAttr2(int attr2) {
		this.attr2 = attr2;
	}

	public String getAttr3() {
		return attr3;
	}

	public void setAttr3(String attr3) {
		this.attr3 = attr3;
	}

	public String getAttr4() {
		return attr4;
	}

	public void setAttr4(String attr4) {
		this.attr4 = attr4;
	}

	public Long getAttr5() {
		return attr5;
	}

	public void setAttr5(Long attr5) {
		this.attr5 = attr5;
	}

	public Long getAttr6() {
		return attr6;
	}

	public void setAttr6(Long attr6) {
		this.attr6 = attr6;
	}

	public String getAttr7() {
		return attr7;
	}

	public void setAttr7(String attr7) {
		this.attr7 = attr7;
	}

	public String getAttr8() {
		return attr8;
	}

	public void setAttr8(String attr8) {
		this.attr8 = attr8;
	}

	public Long getAttr9() {
		return attr9;
	}

	public void setAttr9(Long attr9) {
		this.attr9 = attr9;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + attr1;
		result = prime * result + attr2;
		result = prime * result + ((attr3 == null) ? 0 : attr3.hashCode());
		result = prime * result + ((attr4 == null) ? 0 : attr4.hashCode());
		result = prime * result + ((attr5 == null) ? 0 : attr5.hashCode());
		result = prime * result + ((attr6 == null) ? 0 : attr6.hashCode());
		result = prime * result + ((attr7 == null) ? 0 : attr7.hashCode());
		result = prime * result + ((attr8 == null) ? 0 : attr8.hashCode());
		result = prime * result + ((attr9 == null) ? 0 : attr9.hashCode());
		result = prime * result + ((children == null) ? 0 : children.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((pid == null) ? 0 : pid.hashCode());
		result = prime * result + ((text == null) ? 0 : text.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MenuTree other = (MenuTree) obj;
		if (attr1 != other.attr1)
			return false;
		if (attr2 != other.attr2)
			return false;
		if (attr3 == null) {
			if (other.attr3 != null)
				return false;
		} else if (!attr3.equals(other.attr3))
			return false;
		if (attr4 == null) {
			if (other.attr4 != null)
				return false;
		} else if (!attr4.equals(other.attr4))
			return false;
		if (attr5 == null) {
			if (other.attr5 != null)
				return false;
		} else if (!attr5.equals(other.attr5))
			return false;
		if (attr6 == null) {
			if (other.attr6 != null)
				return false;
		} else if (!attr6.equals(other.attr6))
			return false;
		if (attr7 == null) {
			if (other.attr7 != null)
				return false;
		} else if (!attr7.equals(other.attr7))
			return false;
		if (attr8 == null) {
			if (other.attr8 != null)
				return false;
		} else if (!attr8.equals(other.attr8))
			return false;
		if (attr9 == null) {
			if (other.attr9 != null)
				return false;
		} else if (!attr9.equals(other.attr9))
			return false;
		if (children == null) {
			if (other.children != null)
				return false;
		} else if (!children.equals(other.children))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (pid == null) {
			if (other.pid != null)
				return false;
		} else if (!pid.equals(other.pid))
			return false;
		if (text == null) {
			if (other.text != null)
				return false;
		} else if (!text.equals(other.text))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "MenuTree [id=" + id + ", pid=" + pid + ", name=" + name + ", text=" + text + ", children=" + children
				+ ", attr1=" + attr1 + ", attr2=" + attr2 + ", attr3=" + attr3 + ", attr4=" + attr4 + ", attr5=" + attr5
				+ ", attr6=" + attr6 + ", attr7=" + attr7 + ", attr8=" + attr8 + ", attr9=" + attr9 + "]";
	}
	
	
	
	
}
