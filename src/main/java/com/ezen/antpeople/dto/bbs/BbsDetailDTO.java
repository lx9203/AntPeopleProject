package com.ezen.antpeople.dto.bbs;

import java.time.LocalDateTime;

import org.hibernate.validator.constraints.NotEmpty;

import com.ezen.antpeople.dto.user.UserDetailDTO;

import lombok.Getter;

@Getter
public class BbsDetailDTO {
	
	@NotEmpty(message = "제목은 필수 입니다.")
	public String title;
	
	public String description;
	public int state;
	protected LocalDateTime createdAt;
	protected LocalDateTime updatedAt;
	public UserDetailDTO user;
	
	public BbsDetailDTO() {}
	
	//화면으로 부터 새로운 게시글을 받아옴 (게시물 업로드)
	public BbsDetailDTO(String title, String description, int user_id, String name) {
		this.title = title;
		this.description = description;
		this.user.setNameId(user_id, name);
	}

	//화면에 출력
	public BbsDetailDTO(String title, String description, int state, LocalDateTime createdAt, LocalDateTime updatedAt,
			UserDetailDTO user) {
		super();
		this.title = title;
		this.description = description;
		this.state = state;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.user = user;
	}
	
	
	
}
