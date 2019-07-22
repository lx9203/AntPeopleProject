package com.ezen.antpeople.serviceimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ezen.antpeople.dto.user.RoleDTO;
import com.ezen.antpeople.dto.user.StoreDTO;
import com.ezen.antpeople.dto.user.UserDetailDTO;
import com.ezen.antpeople.dto.user.UserLoginDTO;
import com.ezen.antpeople.entity.RoleEntity;
import com.ezen.antpeople.entity.StoreEntity;
import com.ezen.antpeople.entity.UserEntity;
import com.ezen.antpeople.repository.RoleRepository;
import com.ezen.antpeople.repository.StoreRepository;
import com.ezen.antpeople.repository.UserRepository;
import com.ezen.antpeople.service.UserService;

@Service("UserService")
@Transactional
public class UserServiceImpl implements UserService {
	
	private UserRepository userRepository;
	private RoleRepository roleRepository;
	private StoreRepository storeRepositoty;
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	//생성자 의존성 추가
	private UserServiceImpl(UserRepository userRepository 
			,RoleRepository roleRepository
			,BCryptPasswordEncoder bCryptPasswordEncoder
			,StoreRepository storeRepository) {
		this.userRepository = userRepository;
		this.roleRepository = roleRepository;
		this.bCryptPasswordEncoder = bCryptPasswordEncoder;
		this.storeRepositoty = storeRepository;
	}
	
	//회원 정보 확인 
	@Override
	public UserDetailDTO findByEmail(String email) {
		Optional<UserEntity> userDetail = userRepository.findByEmail(email);
		return userDetail.get().buildDTO();
	}

	// 로그인 로직
	@Override
	public Boolean verifiedPassword(UserLoginDTO user) {
		Optional<UserEntity> userDetail = userRepository.findByEmail(user.getEmail());
		System.out.println(userDetail.get().toString());
		if(bCryptPasswordEncoder.matches(user.getPassword(), userDetail.get().getPassword()))
			return true;
		else 
			return false;
	}

	//회원 가입 로직 
	@Override
	public String userSignUp(UserDetailDTO udd) {
		UserEntity entity = new UserEntity(udd,bCryptPasswordEncoder.encode(udd.getPassword()));
		userRepository.save(entity);
		Optional<UserEntity> checkEmail = userRepository.findByEmail(udd.getEmail());
		if(checkEmail.isPresent())
			return udd.getEmail();
		else
			return  "회원 가입에 실패하였습니다.";
	}
	
	//회원 탈퇴 로직
	@Override
	public String userDelete(String email, String password) {
		String msg = new String();
		Optional<UserEntity> entity = userRepository.findByEmail(email);
		if(entity.get().getPassword().equals(password)) {
			userRepository.delete(entity.get());
			msg = "정상적으로 회원 탈퇴가 되었습니다.";
		} else {
			msg = "비밀번호가 틀렸습니다. 다시 입력해 주세요.";
		}
		return msg;
			
		
	}
	//회원 가입시 역할, 지점 리스트 출력
	@Override
	public List<RoleDTO> RoleList() {
		List<RoleEntity> entitys = new ArrayList(roleRepository.findAll());
		List<RoleDTO> roles = new ArrayList();
		for(RoleEntity entity : entitys)
			roles.add(entity.buildDTO());
		return roles;
	}

	@Override
	public List<StoreDTO> StoreList() {
		List<StoreEntity> entitys = new ArrayList(storeRepositoty.findAll());
		List<StoreDTO> stores = new ArrayList();
		for(StoreEntity entity : entitys)
			stores.add(entity.buildDTO());
		return stores;
	}

	

}
