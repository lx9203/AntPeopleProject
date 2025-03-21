package com.ezen.antpeople.entity;

import java.io.Serializable;
import java.time.LocalDateTime;

import javax.persistence.AttributeOverride;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.ezen.antpeople.dto.board.BbsDetailDTO;

import lombok.Getter;

@Entity
@Getter
@Table(name="bbs")
@AttributeOverride(name = "id", column = @Column(name = "bbs_id"))
@AttributeOverride(name = "createdAt", column = @Column(name = "created_time"))
@AttributeOverride(name = "updatedAt", column = @Column(name = "updated_time"))
public class BbsEntity extends BaseEntity implements Serializable{
	
	public String title;
	public String description;
	public int state;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	public UserEntity user;
	
	public BbsEntity() {}
	
	//게시글 작성시 (생성시간, 수정시간 자동 생성)
	public BbsEntity(BbsDetailDTO bbs) {
		this.title = bbs.getTitle();
		this.description = bbs.getDescription();
		this.state = bbs.getState();
		this.user = new UserEntity(bbs.getUser());
	}
	
	//게시글 수정시 (수정시간 변경)
	public void updateEntity(BbsDetailDTO bbs,LocalDateTime time) {
		this.title = bbs.getTitle();
		this.description = bbs.getDescription();
		this.updatedAt = time;
	}
	
	//게시글 보기 (Entity -> DTO)
	public BbsDetailDTO buildDto() {
		return new BbsDetailDTO(this.id, this.title, this.description, this.state,
				this.createdAt, this.updatedAt, this.user.buildDTO());
	}

}
