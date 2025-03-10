package com.ezen.antpeople.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.persistence.AttributeOverride;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

import com.ezen.antpeople.dto.todo.TodoDetailDTO;
import com.ezen.antpeople.dto.user.UserTodoDTO;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Entity
@Table(name="todo")
@NoArgsConstructor(access = AccessLevel.PUBLIC)
@AttributeOverride(name="id", column=@Column(name="todo_id"))
@AttributeOverride(name = "createdAt", column = @Column(name = "created_time"))
@AttributeOverride(name = "updatedAt", column = @Column(name = "updated_time"))

// todoDB - todo_id, description, created_time, updated_time 
public class TodoEntity extends BaseEntity implements Serializable {
	
	@NotEmpty(message = "*내용을 적어 주세요.")
	private String description;
	
	@Column(name="state")
	private boolean state;
	private int checkPerson;
	
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name="user_todo", joinColumns = @JoinColumn(name="todo_id"), inverseJoinColumns = @JoinColumn(name = "to_id"))
	private List<UserEntity> toUsers;
	
	@ManyToOne
	@JoinColumn(name="from_id")
	private UserEntity fromUser;
	
	//할일 DB저장 - 반드시 userList의 Null값이 없는지 확인 해야 함
	public TodoEntity(TodoDetailDTO todo) {
		List<UserEntity> userList = new ArrayList<UserEntity>();
		Optional<List<UserTodoDTO>>users = Optional.ofNullable(todo.getToUsers());
		if(users.isPresent()) {
			for(UserTodoDTO user: users.get())
				userList.add(new UserEntity(user));
		}
		this.description = todo.getDescription();
		this.fromUser = new UserEntity(todo.getFromUser());
		this.toUsers = userList;
		this.checkPerson = userList.size();
	}
	
	public TodoDetailDTO buildDTO() {
		List<UserTodoDTO> toUsers = new ArrayList<UserTodoDTO>();
		for(UserEntity user : this.toUsers)
			toUsers.add(user.buildTodoDTO());
		return new TodoDetailDTO(this.id, this.description,this.state,this.checkPerson, this.updatedAt, this.fromUser.buildTodoDTO(),toUsers);
	}
	
	public void downCheckPerson() {
		this.checkPerson -= 1;
	}

}
