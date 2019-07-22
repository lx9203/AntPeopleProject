package com.ezen.antpeople.serviceimpl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.antpeople.dto.test.TestDTO;
import com.ezen.antpeople.entity.TestEntity;
import com.ezen.antpeople.repository.TestRepository;
import com.ezen.antpeople.service.TestService;

@Service("TestService")
public class TestServiceImpl implements TestService{
	
	@Autowired
	private TestRepository tr;

	@Override
	public TestDTO getTest(int id) {
		Optional<TestEntity> entity = tr.findById(id);
		return entity.get().buildDomain();
	}

}
