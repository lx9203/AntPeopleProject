package com.ezen.antpeople.serviceimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ezen.antpeople.dto.sche.MonthPlanDTO;
import com.ezen.antpeople.dto.sche.MonthPlanListDTO;
import com.ezen.antpeople.dto.user.UserDetailDTO;
import com.ezen.antpeople.entity.MonthPlanEntity;
import com.ezen.antpeople.repository.MonthPlanRepository;
import com.ezen.antpeople.service.MonthPlanService;

@Service
public class MonthPlanServiceImpl implements MonthPlanService {
	
	MonthPlanRepository monthPlanRepository;
	
	public MonthPlanServiceImpl(MonthPlanRepository monthPlanRepository) {
		this.monthPlanRepository = monthPlanRepository;
	}

	//새로운 월별 테이블 등록
	@Override
	public void newMonthPlan(int user_id, String date) {
		MonthPlanDTO monthPlan = new MonthPlanDTO(user_id, date,true);
		MonthPlanEntity entity = new MonthPlanEntity(monthPlan);
		monthPlanRepository.save(entity);
		
	}

	//월별 테이블 수정 가능 여부 조정
	@Override
	public void stateMonthPlan(int user_id, Map<String, Boolean> month) {
		MonthPlanEntity entity = new MonthPlanEntity();
		for(String key : month.keySet()) {
			entity = monthPlanRepository.findByUser_idAndMonthStartingWith(user_id, key);
			entity.updateState(month.get(key));
		}
		monthPlanRepository.save(entity);
	}
	
	//테이블 수정 가능 여부 확인
	@Override
	public MonthPlanDTO monthPlan(UserDetailDTO user, String month) {
		return monthPlanRepository.findByUser_idAndMonthStartingWith(user.getUser_id(), month).buildDTO();
	}
	
	//월별 테이블 수정 가능 여부 확인
	@Override
	public String monthPlanList(UserDetailDTO user) {
		List<MonthPlanDTO> planList = new ArrayList<MonthPlanDTO>();
		List<MonthPlanEntity> entitys = monthPlanRepository.findByUserStoreStore(user.getStore().getStore());
		for(MonthPlanEntity entity: entitys) {
			planList.add(entity.buildDTO());
		}
		MonthPlanListDTO planMap = new MonthPlanListDTO(planList);
		return planMap.toString();
	}


}
