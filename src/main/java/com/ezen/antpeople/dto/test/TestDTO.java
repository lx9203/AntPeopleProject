package com.ezen.antpeople.dto.test;

public class TestDTO {
	private int id;
	private String name;
	private String phone;
	
	
	public TestDTO(int id, String name, String phone) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
	}
	
	public int getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public String getPhone() {
		return phone;
	}
	
	

}
