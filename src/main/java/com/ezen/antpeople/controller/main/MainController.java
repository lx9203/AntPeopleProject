package com.ezen.antpeople.controller.main;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.antpeople.dto.bbs.BbsDetailDTO;
import com.ezen.antpeople.dto.user.UserDetailDTO;
import com.ezen.antpeople.service.BbsService;
import com.ezen.antpeople.service.UserService;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	UserService userService;
	UserDetailDTO userDetailDto;
	BbsService bbsService;
	
	public MainController(UserService userService, BbsService bbsService) {
		this.userService = userService;
		this.bbsService = bbsService;
	}
	public MainController(UserDetailDTO userDetailDto) {
		this.userDetailDto = userDetailDto;
	}

	// 메인 페이지
	@RequestMapping("guestmain")
	public String mainPage() {
		logger.info("guestMain 페이지");
		return "guestmain";
	}

	// 공지
	@RequestMapping("notice")
	public String notice() {
		logger.info("notice 페이지");
		return "notice";
	}

	@RequestMapping("bbs")
	public String bbsPage(Model model) {
		List<BbsDetailDTO> bbsDetailList = new ArrayList(bbsService.findByAll());
		model.addAttribute("bbsList",bbsDetailList);
		logger.info("bbs 페이지");
		return "bbs";
	}
	
	// 직원 전체목록(간략)
	@RequestMapping("/stafflist")
	public String stafflist(Model model) throws Exception {
		logger.info("staffList 페이지");
		List<UserDetailDTO> stafflist = userService.findByAll();
		model.addAttribute("stafflist", stafflist);
		return "main/stafflist";
	}
	
	// Email로 검색해서 데이터 받아오기 - calender
	@RequestMapping("privatecalender")
	public String privatecalender(Model model, String email) throws Exception {
		logger.info("privatecalender 페이지");
		model.addAttribute("privatecalender", userService.findByEmail(email));
		return "calender";
	}

	// 금일 근무자 목록
	@RequestMapping("todaystaff")
	public String todaystaff(Model model) throws Exception {
		logger.info("todaystaff 페이지");
//		model.addAttribute("todaystaff", userService.findBystate());
		return "todaystaff";
	}

}
