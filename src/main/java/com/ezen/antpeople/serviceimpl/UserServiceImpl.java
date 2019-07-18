package com.ezen.antpeople.serviceimpl;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Optional;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ezen.antpeople.dto.user.UserDTO;
import com.ezen.antpeople.entity.RoleEntity;
import com.ezen.antpeople.entity.UserEntity;
import com.ezen.antpeople.repository.RoleRepository;
import com.ezen.antpeople.repository.UserRepository;
import com.ezen.antpeople.service.UserService;

@Service("UserService")
@Transactional
public class UserServiceImpl implements UserService {
	
	private UserRepository userRepository;
	private RoleRepository roleRepository;
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	//생성자 의존성 추가
	private UserServiceImpl(UserRepository userRepository 
			,RoleRepository roleRepository
			,BCryptPasswordEncoder bCryptPasswordEncoder) {
		this.userRepository = userRepository;
		this.roleRepository = roleRepository;
		this.bCryptPasswordEncoder = bCryptPasswordEncoder;
	}

	@Override
	public UserDTO findUserByEmail(String email) {
		UserEntity userEntity = new UserEntity();
		userEntity = userRepository.findByEmail(email);
		return userEntity.buildDTO();
	}

	@Override
	public void saveUser(UserDTO user) {
	}

	@Override
	public UserDTO getUser(int id) {
		Optional<UserEntity> userEntity = userRepository.findById(id);
		if (userEntity.isPresent())
			return userEntity.get().buildDTO();
		else return new UserDTO();
	}

	@Override
	public void deleteUser(UserDTO user) {
		UserEntity userEntity = userRepository.findByEmail(user.getEmail());
		userRepository.deleteById(userEntity.getId());
		
	}

	//정보 업데이트
	//view로부터 유저의 변경 정보를 얻는다. (이때, 이메일은 제외한다.)
	//예를 들어 유저의 정보 중 주소만 변경 되었다고 할 경우, 나머지 사항은 원래 값이 들어 가있다.
	//이때, Entity의 메소드를 통해 주소,전화번호만 변경 가능하게 한다. (초기테스트)
	
	
	@Override
	public boolean verifyPassword(UserDTO user) {
		UserEntity userEntity = userRepository.findByEmail(user.getEmail());
		System.out.println(userEntity.toString());
		if(bCryptPasswordEncoder.matches(user.getPassword(), userEntity.getPassword()))
			return true;
		else
			return false;
	}
	
	//출퇴근용
		@Override
		public void saveGo(UserDTO userDTO) {
			// TODO Auto-generated method stub
			
		}

		@Override
		public void saveOut(UserDTO userDTO) {
			// TODO Auto-generated method stub
			
		}

		@Override
		public void updateUser(UserDTO user) {
			// TODO Auto-generated method stub
			
		}

}
