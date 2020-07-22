package com.example.auction.service.users;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.auction.model.UserVO;
import com.example.auction.repository.users.UsersDAO;

@Service
public class UsersServiceImpl implements UsersService {
	
	@Autowired UsersDAO usersDao;

	@Override
	public int setUser(UserVO uvo) {

		return usersDao.setUser(uvo);
	}

	@Override
	public UserVO loginCheck(UserVO uvo, HttpSession session) {
		
		UserVO vo = usersDao.loginCheck(uvo);
		
		if(vo != null) {
			session.setAttribute("user_ID", vo.getUser_ID());
			session.setAttribute("user_Name", vo.getUser_Name());
			session.setAttribute("user_Auth", vo.getUser_Auth());
		}
		
		
		return vo;
	}

	@Override
	public void setLogout(HttpSession session) {

		session.invalidate();
	}

	@Override
	public List<UserVO> getUsersList(int start, int end, String searchOpt, String words) {

		return usersDao.getUsersList(start, end, searchOpt, words);
	}

	@Override
	public int getUsersCount(String searchOpt, String words) {

		return usersDao.getUsersCount(searchOpt, words);
	}

	@Override
	public void setAuthUpdate(UserVO uvo) {

		usersDao.setAuthUpdate(uvo);
	}

	@Override
	public UserVO getUserView(int useq) {

		return usersDao.getUserView(useq);
	}

	@Override
	public int setUserModify(UserVO uvo) {

		return usersDao.setUserModify(uvo);
	}

	@Override
	public int setUserDelete(int useq) {

		return usersDao.setUserDelete(useq);
	}

	@Override
	public int idCheck(String user_ID) {

		return usersDao.idCheck(user_ID);
	}
	
	
}
