package com.ezen.antpeople.controller.admin;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.antpeople.dto.user.UserDetailDTO;
import com.ezen.antpeople.service.UserService;


@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	UserService userService;
	UserDetailDTO userDetailDto;

	public AdminController(UserService userService) {
		this.userService = userService;
	}
	public AdminController(UserDetailDTO userDetailDto) {
		this.userDetailDto = userDetailDto;
	}
	
//	// 직원 전체 정보 목록
//	@RequestMapping("staffinfo")
//	public ModelAndView staffinfo(ModelAndView mav) throws Exception {
//		logger.info("staffInfo 페이지");
//		mav.addObject("staffinfo", userService.findByAll();
//		mav.setViewName("admin/staffinfo");
//		return mav;
//	}
	
	// 근무 일정 계획
	@RequestMapping("planning")
	public String planning() throws Exception {
		logger.info("todayStaff 페이지");
		return "admin/planning";
	}
	
	// 근무 승인
	@RequestMapping("accept")
	public String accept() throws Exception {
		logger.info("accept 페이지");
		return "admin/accept";
	}
}
