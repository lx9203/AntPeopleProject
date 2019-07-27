package com.ezen.antpeople.service;

import java.util.List;

import com.ezen.antpeople.dto.user.RoleDTO;
import com.ezen.antpeople.dto.user.StoreDTO;
import com.ezen.antpeople.dto.user.UserDetailDTO;


public interface UserService {
	//로그인 기능
	public boolean verifiedPassword(UserDetailDTO user,String password); //회원 로그인
	public String userSignUp(UserDetailDTO udd); // 회원 가입
	public String userDelete(String email, String password); // 회원 탈퇴
	
	//유저 검색 기능
	public UserDetailDTO findByEmail(String email);
	public List<UserDetailDTO> findByAll();
	public List<UserDetailDTO> findByRole(RoleDTO role);
	public List<UserDetailDTO> findByStore(RoleDTO role,StoreDTO store);
	
	//회원가입 리스트 출력
	public List<RoleDTO> RoleList();
	public List<StoreDTO> StoreList();

}
