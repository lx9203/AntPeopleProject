package com.ezen.antpeople.controller.staff;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.antpeople.dto.user.UserDetailDTO;
import com.ezen.antpeople.service.UserService;

@Controller
public class StaffController {
	private static final Logger logger = LoggerFactory.getLogger(StaffController.class);

	UserService userService;
	UserDetailDTO userDetailDto;

	public StaffController(UserService userService) {
		this.userService = userService;
	}
	public StaffController(UserDetailDTO userDetailDto) {
		this.userDetailDto = userDetailDto;
	}
	
	// 근무 신청
	@RequestMapping("requestwork")
	public String requestwork() throws Exception {
		return "requestwork";
	}
	
	// 근무 수정
	@RequestMapping("modifywork")
	public String modifywork() throws Exception {
		return "modifywork";
	}
	
}
