package com.ezen.antpeople.entity;

import java.io.Serializable;

import javax.persistence.AttributeOverride;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.ezen.antpeople.dto.bbs.BbsDetailDTO;

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
		this.state = 0;
		this.user = new UserEntity(bbs.getUser());
	}
	
	//게시글 보기 (Entity -> DTO)
	public BbsDetailDTO buildDto() {
		return new BbsDetailDTO(this.title, this.description, this.state,
				this.createdAt, this.updatedAt, this.user.buildDTO());
	}

}
