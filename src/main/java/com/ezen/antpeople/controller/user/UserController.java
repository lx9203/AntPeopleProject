package com.ezen.antpeople.controller.user;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.antpeople.dto.user.RoleDTO;
import com.ezen.antpeople.dto.user.StoreDTO;
import com.ezen.antpeople.dto.user.UserDetailDTO;
import com.ezen.antpeople.dto.user.UserLoginDTO;
import com.ezen.antpeople.service.UserService;

@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	UserService userService;
	UserDetailDTO userDetailDto;

	public UserController(UserService userService) {
		this.userService = userService;
	}
	public UserController(UserDetailDTO userDetailDto) {
		this.userDetailDto = userDetailDto;
	}
	
	@RequestMapping("index")
	public String loginIndex(Model model) {
		logger.info("로그인 페이지");
		return "login";
	}
	
	// 로그인 페이지로 이동
	@RequestMapping("login")
	public String login(Model model) {
		logger.info("로그인 페이지");
		return "login";
	}
	
	@RequestMapping("//userSuccess")
	public String loginSuccess(Model model) {
		logger.info("로그인 페이지");
		return "login/login";
	}

	
	// 로그인시 아이디 비밀번호 존재여부 체크
	@RequestMapping(value="logincheck", method = RequestMethod.POST)
	public String logincheck(String email, String password) throws Exception {
		logger.info("체크 페이지");			
		UserLoginDTO user = new UserLoginDTO(email, password);
		String returnURL ="";
		if(userService.verifiedPassword(user)) {
			returnURL = "../main/main";
		} else {
			returnURL = "redirection";
		}
		return returnURL;
	}

	// 회원가입 페이지로 이동 - 완료
	@RequestMapping("register")
	public String registerPage(Model model) throws Exception {
		logger.info("회원가입 페이지");	
		List<RoleDTO> roles = new ArrayList(userService.RoleList());
		List<StoreDTO> stores = new ArrayList(userService.StoreList());
		model.addAttribute("roleList", roles);
		model.addAttribute("storeList", stores);
		return "register";
	}
	
	
	  // 회원가입 
	  @RequestMapping(value="registercheck", method= RequestMethod.POST)
	  public String registercheck(@ModelAttribute UserDetailDTO uDto) throws Exception{
		  logger.info("registercheck 페이지 " + userService.userSignUp(uDto));
		  userService.userSignUp(uDto);
		  return "register";
	  }
	  
	  // 직원 정보 수정
	  @RequestMapping("userUpdate")
	  public String userUpdate(Model model, String email, String password, String name, RoleDTO role, StoreDTO store) {
		  model.addAttribute(email);
		  model.addAttribute(password);
		  model.addAttribute(name);
		  model.addAttribute(role);
		  model.addAttribute(store);
//		  userService.userUpdate(model);
		  return "main/stafflist";
	  }
	 
	 

	// 출근
	/*
	 * @RequestMapping(value = "goWork.do") public Model goWork(HttpServletRequest
	 * request, Model model) throws Exception { HttpSession session =
	 * request.getSession(); // 세션을 가져옴 UserDTO dto = new UserDTO(); boolean
	 * isSuccess = false; // 성공여부 try { if (session.getAttribute("user_id") != null)
	 * { // 세션이 null일경우 String 으로 변환 안됨(Exception 발생) String user_id = (String)
	 * session.getAttribute("user_id"); // 세션에 저장한 user_id 가져옴 //
	 * dto.setId(user_id); // dto에 유저아이디를 저장함 userService.saveGo(dto); //
	 * userService 에 saveGo 를 실행함 isSuccess = true; // 결과값 = 성공 }
	 * model.addAttribute("result", isSuccess);
	 * 
	 * } catch (Exception e) { e.printStackTrace(); }
	 * 
	 * return model; }
	 * 
	 * // 퇴근
	 * 
	 * @RequestMapping(value = "outWork.do") public Model outWork(HttpServletRequest
	 * request, Model model) throws Exception { HttpSession session =
	 * request.getSession(); // 세션을 가져옴 UserDTO dto = new UserDTO(); boolean
	 * isSuccess = false; // 성공여부 try { if (session.getAttribute("user_id") != null)
	 * { // 세션이 null일경우 String 으로 변환 안됨.(Exception 발생) String user_id = (String)
	 * session.getAttribute("user_id"); // 세션에 저장한 user_id 가져옴 //
	 * dto.setId(user_id); // dto에 유저아이디를 저장함 userService.saveOut(dto); //
	 * userService 에 saveGo 를 실행함 isSuccess = true; // 결과값 = 성공 }
	 * model.addAttribute("result", isSuccess);
	 * 
	 * } catch (Exception e) { e.printStackTrace(); }
	 * 
	 * return model; }
	 */
}