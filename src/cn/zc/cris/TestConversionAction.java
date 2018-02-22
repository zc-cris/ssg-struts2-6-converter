package cn.zc.cris;

import java.util.Date;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.zc.cris.model.User;

public class TestConversionAction extends ActionSupport implements ModelDriven<User> {

	
	/**
	 * @Field Name：serialVersionUID
	 * @Description：TODO (用一句话描述这个变量表示什么) 
	 */
	
	private static final long serialVersionUID = 1L;
	
//	private int age;
//	public void setAge(int age) {
//		this.age = age;
//	}
//	public int getAge() {
//		return age;
//	}
//	private Date birth;
//	public void setBirth(Date birth) {
//		this.birth = birth;
//	}
//	public Date getBirth() {
//		return birth;
//	}
	public String execute() {
		System.out.println(this.user.getAge());
		System.out.println(this.user.getBirth());
		return "success";
	}

	private User user;
	@Override
	public User getModel() {
		this.user = new User();
		return this.user;
	}
	
}
