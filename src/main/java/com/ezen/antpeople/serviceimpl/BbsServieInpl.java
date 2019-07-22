package com.ezen.antpeople.serviceimpl;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.ezen.antpeople.dto.bbs.BbsDetailDTO;
import com.ezen.antpeople.entity.BbsEntity;
import com.ezen.antpeople.repository.BbsRepository;
import com.ezen.antpeople.service.BbsService;

@Service("bbs")
public class BbsServieInpl implements BbsService {
	
	BbsRepository bbsRepository;
	
	public BbsServieInpl(BbsRepository bbsRepository) {
		this.bbsRepository = bbsRepository;
		
	}

	//게시글 업로드
	@Override
	public void uploadBbs(BbsDetailDTO bbs) {
		BbsEntity entity = new BbsEntity(bbs);
		bbsRepository.save(entity);
	}

	//게시글 삭제
	@Override
	public void deleteBbs(int bbs_id) {
		Optional<BbsEntity> entity = bbsRepository.findById(bbs_id);
		bbsRepository.delete(entity.get());
	}
	
	//게시글 수정
	@Override
	public void updateBbs(BbsDetailDTO bbs) {
		Optional<BbsEntity> entity = bbsRepository.findById(bbs.getBbs_id());
		entity.get().updateEntity(bbs, LocalDateTime.now());
		bbsRepository.save(entity.get());
		
	}
	
	//게시글 상세 보기
	@Override
	public BbsDetailDTO findByOne(Integer bbs_id) {
		Optional<BbsEntity> entity = bbsRepository.findById(bbs_id);
		return entity.get().buildDto();
	}
	
	//게시글 전체 보기
	@Override
	public List<BbsDetailDTO> findByAll() {
		List<BbsDetailDTO> bbsDetailList = new ArrayList();
		List<BbsEntity> bbsList = new ArrayList(bbsRepository.findAll());
		for(BbsEntity bbs : bbsList)
			bbsDetailList.add(bbs.buildDto());
		return bbsDetailList;
	}

}
