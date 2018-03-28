package cn.windy.module.admin.dto;

/**
 * 错题分析dto
 * @author xie
 *
 */
public class AnalysisDto {

	private Long id;//题号id
	
	private String name;//题号名称
	
	private int count;//出题总数
	
	private int countTrue;//正确总数
	
	private int countErrir;//错误总数
	
	private double correctRate;//正确率
	
	private double errorRate;//错误率

	public double getCorrectRate() {
		return correctRate;
	}

	public void setCorrectRate(double correctRate) {
		this.correctRate = correctRate;
	}

	public double getErrorRate() {
		return errorRate;
	}

	public void setErrorRate(double errorRate) {
		this.errorRate = errorRate;
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

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getCountTrue() {
		return countTrue;
	}

	public void setCountTrue(int countTrue) {
		this.countTrue = countTrue;
	}

	public int getCountErrir() {
		return countErrir;
	}

	public void setCountErrir(int countErrir) {
		this.countErrir = countErrir;
	}
	
	
}
