package com.example.auction.service.users;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.example.auction.model.UserVO;

public interface UsersService {

	public int setUser(UserVO uvo);
	
	public List<UserVO> getUsersList(int start, int end, String searchOpt, String words);
	
	public int getUsersCount(String searchOpt, String words);
	
	public UserVO loginCheck(UserVO uvo, HttpSession session);
	
	public void setLogout(HttpSession session);
	
	public void setAuthUpdate(UserVO uvo);
	
	public UserVO getUserView(int useq);
	
	public int setUserModify(UserVO uvo);
	
	public int setUserDelete(int useq);
	
	public int idCheck(String user_ID);
}
