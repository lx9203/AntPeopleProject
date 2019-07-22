package com.ezen.antpeople.login;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import javax.annotation.Resource;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.ezen.antpeople.config.RootConfig;
import com.ezen.antpeople.config.SecurityConfig;
import com.ezen.antpeople.dto.user.RoleDTO;
import com.ezen.antpeople.dto.user.StoreDTO;
import com.ezen.antpeople.dto.user.UserDetailDTO;
import com.ezen.antpeople.dto.user.UserLoginDTO;
import com.ezen.antpeople.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration //서버에서 생성되지만, 테스트에서 생성되지 않는 ServletContext생성 용도
@ContextConfiguration(classes= {RootConfig.class,SecurityConfig.class})
public class UserDatabaseTest {
	
	@Resource
	UserService us;
	
	//이메일 검색 테스트 - 완료
	//null 값을 허용하려면 int->Integer로 해야 허용이 가능하다.
	@Test @Ignore
	public void findByEmailTest() {
		UserDetailDTO user1 = us.findByEmail("admin123@gmail.com");
		UserDetailDTO user2 = us.findByEmail("admin1234@gmail.com");
		System.out.println(user1.toString());
		System.out.println(user2.toString());
		assertEquals(user1.getName(),"관리자");
		assertEquals(user2.getName(),"관리자2");
	}
	
	//회원 가입 기능 - 완료
	//@ManyToOne 같은 영속성을 부여할 때, cascade를 허용하면 원래 데이터를 이용하지 않고,
	//중복이 되도 새로 만들게 된다. 이때, DB에서 중복을 허용하지 않았다면 오류가 발생한다.
	
	@Test @Ignore
	public void userSingUpTest() {
		UserDetailDTO user = new UserDetailDTO("test1234@gmail.com","test1234","테스트 사용자", 1, new RoleDTO(100,""),new StoreDTO(101,""));
		us.userSignUp(user);
		user = us.findByEmail("test1234@gmail.com");
		System.out.println(user.toString());
		assertEquals(user.getName(),"테스트 사용자");
	}
	
	//회원 탈퇴 기능 테스트 - 완료
	@Test @Ignore
	public void userDeleteTest() {
		String msg = us.userDelete("test123@gmail.com", "test123");
		assertEquals(msg, "정상적으로 회원 탈퇴가 되었습니다.");
	}
	
	@Test
	public void userVerifiedPasswordTest() {
		UserLoginDTO user = new UserLoginDTO("test1234@gmail.com","test1234");
		assertTrue(us.verifiedPassword(user));
	}
	

}
