package com.ezen.antpeople.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

import com.ezen.antpeople.dto.test.TestDTO;

@Entity
@Table(name="test")
public class TestEntity {
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    protected int id;
	
	@NotEmpty(message="*Please provide your name")
	private String name;
	
	private String phone;
	
	//Entity -> DTO
		public TestDTO buildDomain() {
			TestDTO test = new TestDTO(id,name,phone);
			return test;
		}
		
		//user생성
		public void buildEntity(TestDTO test){
			this.name = test.getName();
			this.phone = test.getPhone();
		}

}
