package com.ezen.antpeople.serviceimpl;

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

	@Override
	public void uploadBbs(BbsDetailDTO bbs) {
		BbsEntity entity = new BbsEntity(bbs);
		bbsRepository.save(entity);
	}

	@Override
	public void deleteBbs(int bbs_id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public BbsDetailDTO findByOne(Integer bbs_id) {
		Optional<BbsEntity> entity = bbsRepository.findById(bbs_id);
		return entity.get().buildDto();
	}

}
