package cn.zc.cris.model;


/**
 * 1. Department是action处理的实际模型，那么manager属性的属性如何在表单中呈现
 * 		Struts2表单标签可以使用属性的属性：name = manager.name or name = manager.birth 	
 * 2. 全局的类型转换器还是可以正常工作的！
 * 	 	xwork-conversion.properties和DateConverter类可以对全局生效！
 */
public class Department {

	private String name;
	private Manager manager;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Manager getManager() {
		return manager;
	}
	public void setManager(Manager manager) {
		this.manager = manager;
	}
	@Override
	public String toString() {
		return "Department [name=" + name + ", manager=" + manager + "]";
	}
	
}
