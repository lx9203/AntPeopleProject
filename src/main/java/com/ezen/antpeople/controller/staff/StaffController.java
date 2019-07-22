package com.ezen.antpeople.controller.staff;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.antpeople.controller.user.UserController;
import com.ezen.antpeople.service.UserService;

@Controller
public class StaffController {
	private static final Logger logger = LoggerFactory.getLogger(StaffController.class);
	
	@Inject
	UserService userService;
	
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
