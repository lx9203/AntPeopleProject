package com.ezen.antpeople.controller.main;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.antpeople.controller.user.UserController;
import com.ezen.antpeople.service.UserService;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	UserService userService;
	
	public MainController(UserService userService) {
		this.userService = userService;
	}
	
	//AOP 작성 필요
	// index(=login)페이지로 이동
	@RequestMapping("/index")
	public String main() {
		logger.info("index 페이지");
		return "login";
	}
	
	// 공지
	@RequestMapping("/notice")
	public String notice() {
		logger.info("notice 페이지");
		return "notice";
	}
	
	// 직원 전체목록(간략)
	@RequestMapping("/stafflist")
	public String stafflist() throws Exception {
		logger.info("staffList 페이지");
		return "pages/stafflist";
	}
	
	/*
	 * @RequestMapping("/pages/privatecalender") public ModelAndView
	 * privateCalender(ModelAndView mav, @RequestParam("user_id") int user_id)
	 * throws Exception { UserDTO user = userService.getUser(user_id);
	 * mav.setViewName("pages/calender"); mav.addObject("list", user); return mav; }
	 */
	// 개인 별 일정(달력) 데이터 보내기
	@RequestMapping("privatecalender") 
	public ModelAndView privateCalender(ModelAndView mav, int user_id) throws Exception {
		UserDTO user = userService.getUser(user_id);
		mav.setViewName("pages/calender");
		mav.addObject("list", user);
		return mav;
	}
	
	// 금일 근무자 목록
	@RequestMapping("todaystaff")
	public String todaystaff(Model model) throws Exception {
		
		return "todaystaff";
	}
	
}
