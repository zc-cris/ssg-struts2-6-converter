package cn.zc.cris;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.zc.cris.model.Department;
import javafx.scene.DepthTest;

public class TestComplextPropertyAction extends ActionSupport implements ModelDriven<Department> {

	
	/**
	 * @Field Name：serialVersionUID
	 * @Description：TODO (用一句话描述这个变量表示什么) 
	 */
	
	private static final long serialVersionUID = 1L;

	private Department dept;
	@Override
	public String execute() throws Exception {
		System.out.println(this.dept);
		return SUCCESS;
	}
	
	@Override
	public Department getModel() {
		this.dept = new Department();
		return this.dept;
	}

}
