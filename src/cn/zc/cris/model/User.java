package cn.zc.cris.model;

import java.util.Date;

public class User {
	private int age;
	public void setAge(int age) {
		this.age = age;
	}
	public int getAge() {
		return age;
	}
	private Date birth;
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public Date getBirth() {
		return birth;
	}
	public User(int age, Date birth) {
		super();
		this.age = age;
		this.birth = birth;
	}
	public User() {
		super();
		
	}
	@Override
	public String toString() {
		return "User [age=" + age + ", birth=" + birth + "]";
	}
	
}
