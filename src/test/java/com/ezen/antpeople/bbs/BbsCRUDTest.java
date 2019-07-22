package com.ezen.antpeople.bbs;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.ezen.antpeople.config.RootConfig;
import com.ezen.antpeople.config.SecurityConfig;
import com.ezen.antpeople.dto.bbs.BbsDetailDTO;
import com.ezen.antpeople.service.BbsService;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration //서버에서 생성되지만, 테스트에서 생성되지 않는 ServletContext생성 용도
@ContextConfiguration(classes= {RootConfig.class,SecurityConfig.class})
public class BbsCRUDTest {
	
	@Resource
	BbsService bs;
	
	@Test
	public void bbsUploadTest() {
		BbsDetailDTO bbs = new BbsDetailDTO("테스트 게시물", "테스트입니다.",6, "다른이름");
		bs.uploadBbs(bbs);
	}

}
