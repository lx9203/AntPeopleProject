package com.ezen.antpeople.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.antpeople.dto.user.UserLoginDTO;
import com.ezen.antpeople.service.UserService;

@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	UserService userService;

	public UserController(UserService userService) {
		this.userService = userService;
	}
	
	// 로그인 페이지로 이동
	@RequestMapping("login")
	public String login(Model model) {
		logger.info("로그인 페이지");
		return "login";
	}
	
	@RequestMapping("/pages/userSuccess")
	public String loginSuccess(Model model) {
		logger.info("로그인 페이지");
		return "login/login";
	}

	
	// 로그인시 아이디 비밀번호 존재여부 체크
	@RequestMapping(value="logincheck", method = RequestMethod.POST)
	public String logincheck(@RequestParam("email") String email, @RequestParam("password") String password) throws Exception {
		logger.info("체크 페이지");			
		UserLoginDTO user = new UserLoginDTO(email, password);
		String returnURL ="";
		if(userService.verifiedPassword(user)) {
			returnURL = "pages/notice";
		} else {
			returnURL = "pages/login";
		}
		return returnURL;
	}

	// 회원가입 페이지로 이동
	@RequestMapping("register")
	public String register() throws Exception {
		return "pages/register";
	}
	
	// 회원가입
	@RequestMapping(value="register.do", method= RequestMethod.POST)
	public String registerPOST(UserDTO userDto, String email, String password) throws Exception {
		String returnUrl = "";
		if(email != null) {
			userService.saveUser(userDto);
			logger.info("register.do DTO추가");
			returnUrl = "redirect:/pages/login";
		} else {
			returnUrl = "pages/register";
		}
		return returnUrl;
	}

	// 출근
	@RequestMapping(value = "goWork.do")
	public Model goWork(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession(); // 세션을 가져옴
		UserDTO dto = new UserDTO();
		boolean isSuccess = false; // 성공여부
		try {
			if (session.getAttribute("user_id") != null) { // 세션이 null일경우 String 으로 변환 안됨(Exception 발생)
				String user_id = (String) session.getAttribute("user_id"); // 세션에 저장한 user_id 가져옴
				// dto.setId(user_id); // dto에 유저아이디를 저장함
				userService.saveGo(dto); // userService 에 saveGo 를 실행함
				isSuccess = true; // 결과값 = 성공
			}
			model.addAttribute("result", isSuccess);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	// 퇴근
	@RequestMapping(value = "outWork.do")
	public Model outWork(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession(); // 세션을 가져옴
		UserDTO dto = new UserDTO();
		boolean isSuccess = false; // 성공여부
		try {
			if (session.getAttribute("user_id") != null) { // 세션이 null일경우 String 으로 변환 안됨.(Exception 발생)
				String user_id = (String) session.getAttribute("user_id"); // 세션에 저장한 user_id 가져옴
				// dto.setId(user_id); // dto에 유저아이디를 저장함
				userService.saveOut(dto); // userService 에 saveGo 를 실행함
				isSuccess = true; // 결과값 = 성공
			}
			model.addAttribute("result", isSuccess);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

}