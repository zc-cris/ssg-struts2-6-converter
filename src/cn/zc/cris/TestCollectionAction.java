package cn.zc.cris;

import java.util.Collection;

import com.opensymphony.xwork2.ActionSupport;

import cn.zc.cris.model.Manager;

//测试jsp页面传来的集合为其进行Date类型的转换
public class TestCollectionAction extends ActionSupport {

	
	/**
	 * @Field Name：serialVersionUID
	 * @Description：TODO (用一句话描述这个变量表示什么) 
	 */
	
	private static final long serialVersionUID = 1L;
	
	private Collection<Manager> managers;
	public void setManagers(Collection<Manager> managers) {
		this.managers = managers;
	}
	public Collection<Manager> getManagers() {
		return managers;
	}
	
	@Override
	public String execute() throws Exception {
		System.out.println(this.managers);
		return SUCCESS;
	}

}
