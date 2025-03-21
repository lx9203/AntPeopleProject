package com.ezen.antpeople.dto.sche;

import java.util.HashSet;
import java.util.Set;

import com.ezen.antpeople.dto.user.UserDetailDTO;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor(access = AccessLevel.PUBLIC)
public class ScheUserDTO {
	private UserDetailDTO user;
	private int schedule_id;
	private String unique;
	private Integer state;
	private String title;
	private String startTime; //근무 시작 시간
	private String endTime; // 근무 종료 시간
	
	public ScheUserDTO(UserDetailDTO user, int schedule_id,String unique, Integer state) {
		this.user = user;
		this.schedule_id = schedule_id;
		this.unique = unique;
		this.state = state;
	}
	
	
	//출근, 퇴근 시간 관련 생성자
	public ScheUserDTO(UserDetailDTO user, int schedule_id,String unique, Integer state, String title) {
		this.user = user;
		this.schedule_id = schedule_id;
		this.unique = unique;
		this.state = state;
		this.title = title;
	}
	
	public void updateScheState(int state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "schedule_id=" + user.getName();
	}
	
	

}
