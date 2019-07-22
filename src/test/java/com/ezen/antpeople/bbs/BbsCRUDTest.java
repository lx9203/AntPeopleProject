package com.ezen.antpeople.bbs;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.ezen.antpeople.config.RootConfig;
import com.ezen.antpeople.config.SecurityConfig;
import com.ezen.antpeople.dto.bbs.BbsDetailDTO;
import com.ezen.antpeople.entity.BbsEntity;
import com.ezen.antpeople.repository.BbsRepository;
import com.ezen.antpeople.service.BbsService;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration //서버에서 생성되지만, 테스트에서 생성되지 않는 ServletContext생성 용도
@ContextConfiguration(classes= {RootConfig.class,SecurityConfig.class})
public class BbsCRUDTest {
	
	@Resource
	BbsService bs;
	

	@Resource
	BbsRepository br;
	
	//게시물 업로드 테스트 - 완료
	@Test @Ignore
	public void bbsUploadTest() {
		BbsDetailDTO bbs = new BbsDetailDTO("공지사항 테스트", "공지사항 테스트입니다.",1,6, "다른이름");
		System.out.println(bbs.toString());
		bs.uploadBbs(bbs);
	}
	
	//게시물 업데이트 테스트 - 완료
	@Test @Ignore
	public void bbsUpdateTest() {
		BbsDetailDTO bbs = new BbsDetailDTO(2,"테스트 수정", "수정된 게시물 입니다.",1);
		bs.updateBbs(bbs);
		
	}
	
	//게시물 상세보기 테스트 - 완료
	@Test @Ignore
	public void bbsDetailTest() {
		BbsDetailDTO bbs = bs.findByOne(1);
		System.out.println(bbs.toString());
		assertEquals(bbs.getTitle(), "테스트 게시물");
	}
	
	//게시물 삭제 테스트 - 완료
	@Test @Ignore
	public void bbsDeleteTest() {
		bs.deleteBbs(1);
		assertFalse(br.findById(1).isPresent());
	}
	
	//게시물 리스트 테스트 
	@Test @Ignore
	public void bbsListTest() {
		List<BbsDetailDTO> bbsList = new ArrayList(bs.findByAll());
		for(BbsDetailDTO bbs : bbsList) {
			System.out.println(bbs.toString());
		}
		
	}

}
