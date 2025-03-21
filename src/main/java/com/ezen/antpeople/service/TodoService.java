package com.ezen.antpeople.service;

import java.util.List;

import com.ezen.antpeople.dto.todo.TodoDetailDTO;
import com.ezen.antpeople.dto.todo.TodoUserDTO;
import com.ezen.antpeople.dto.user.UserDetailDTO;

public interface TodoService {
	public void uploadTodo(TodoDetailDTO todo); //할일 생성
	public void deleteTodo(int todo_id); //할일 삭제
	public void deleteSendTodo(int todo_id, int user_id); // 자신이 받은 할일 삭제
	public void checkTodo(int todo_id,int user_id); // 자신이 받은 할 일 확인여부
	public List<TodoDetailDTO> TodoListByUser(UserDetailDTO user); //자신이 보낸 할 일 리스트 받아오기
	public List<TodoUserDTO> TodoListByToUser(UserDetailDTO user); //자신이 받은 할 일 리스트 받아오기
	public List<TodoUserDTO> TodoListByToUserAndState(UserDetailDTO user); //남아있는 할 일 리스트
	public String TodoListAll(UserDetailDTO user); // 자신이 보내고 받은 할 일 리스트 전부 받아오기
}
