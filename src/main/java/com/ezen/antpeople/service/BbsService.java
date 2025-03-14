package com.ezen.antpeople.service;

import java.util.List;

import com.ezen.antpeople.dto.board.BbsDetailDTO;

public interface BbsService {
	public void uploadBbs(BbsDetailDTO bbs); //게시글 작성
	public void updateBbs(BbsDetailDTO bbs); //게시글 수정 
	public void deleteBbs(int bbs_id); //게시글 삭제
	public BbsDetailDTO findByOne(Integer bbs_id); // 게시글 상세 보기
	public List<BbsDetailDTO> findByAll(); // 게시글 리스트
	public List<BbsDetailDTO> findTopFive(); // 메인 - 게시글 보기 (5개만)
}
