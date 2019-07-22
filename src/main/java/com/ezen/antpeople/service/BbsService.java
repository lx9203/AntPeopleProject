package com.ezen.antpeople.service;

import com.ezen.antpeople.dto.bbs.BbsDetailDTO;

public interface BbsService {
	public void uploadBbs(BbsDetailDTO bbs); //게시글 작성
	public void deleteBbs(int bbs_id); //게시글 삭제
	public BbsDetailDTO findByOne(Integer bbs_id); // 게시글 상세 보기
	

}
