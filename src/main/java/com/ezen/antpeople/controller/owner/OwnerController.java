﻿package com.ezen.antpeople.controller.owner;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.antpeople.dto.sche.ScheDetailDTO;
import com.ezen.antpeople.dto.user.RoleDTO;
import com.ezen.antpeople.dto.user.UserDetailDTO;
import com.ezen.antpeople.service.ScheService;
import com.ezen.antpeople.service.UserService;


@Controller
@SessionAttributes("owner")
public class OwnerController {
	private static final Logger logger = LoggerFactory.getLogger(OwnerController.class);
	
	UserService userService;
	ScheService scheService;
	
	public OwnerController(UserService userService, ScheService scheService) {
		this.userService = userService;
		this.scheService = scheService;
	}
	
	// 직원 전체 정보 목록
	@RequestMapping("staffinfo")
	public ModelAndView staffInfo(ModelAndView mv) throws Exception {
		logger.info("staffInfo 페이지");
		List<UserDetailDTO> userList = new ArrayList(userService.findByRole(new RoleDTO(102,"")));
		mv.addObject("userList", userList);
		mv.setViewName("staffinfo");
		return mv;
	}
	


	//----------------------- 근무 일정 페이지 ---------------------------
	// 근무 일정 계획페이지로 이동
	@RequestMapping("planning")
	public String goPlanning() throws Exception {
		logger.info("planning 페이지");
		return "planning";
	}
	
	// 근무 일정 계획 저장
	@RequestMapping("createplan")
	public String planning(Model model, @RequestBody Map<String, ScheDetailDTO> scheDto) throws Exception {
		logger.info("createplan");
		scheService.saveSchedules(scheDto);;
	return "../main/main";  // ( 임시 - 페이지 작성 후 변경 )
	}
//	model.addAttribute("planereventdata", owner); 근무 일정 계획 보내기에 넣을예정
	
	// 승인페이지 이동
	@RequestMapping("accept")
	public String goAccept() throws Exception {
		logger.info("accept 페이지");
		return "accept";
	}
	
//	// 근무 승인
//	@RequestMapping("accept")
//	public ModelAndView accept(#DTO sche, ModelAndView mav) throws Exception {
//		#
//		mav.addObject("sche", sche);
//		mav.setViewName("#");
//		logger.info("승인 완료");
//		return mav;
//	}
}
