package com.example.auction.repository.users;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.auction.model.UserVO;

@Repository
public class UsersDAOImpl implements UsersDAO {

	@Autowired SqlSession sql;
	
	final static String NAMESPACE = "mappers.UserMappers";
	
	@Override
	public int setUser(UserVO uvo) {

		return sql.insert(NAMESPACE + ".setUser", uvo);
	}

	@Override
	public UserVO loginCheck(UserVO uvo) {

		return sql.selectOne(NAMESPACE + ".loginCheck", uvo);
	}

	@Override
	public List<UserVO> getUsersList(int start, int end, String searchOpt, String words) {

		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("start", start);
		map.put("end", end);
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		
		return sql.selectList(NAMESPACE + ".getUsersList", map);
	}

	@Override
	public int getUsersCount(String searchOpt, String words) {

		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		
		return sql.selectOne(NAMESPACE + ".getUsersCount", map);
	}

	@Override
	public void setAuthUpdate(UserVO uvo) {

		sql.update(NAMESPACE + ".setAuthUpdate", uvo);
	}

	@Override
	public UserVO getUserView(int useq) {

		return sql.selectOne(NAMESPACE + ".getUserView", useq);
	}

	@Override
	public int setUserModify(UserVO uvo) {

		return sql.update(NAMESPACE + ".setUserModify", uvo);
	}

	@Override
	public int setUserDelete(int useq) {

		return sql.delete(NAMESPACE + ".setUserDelete", useq);
	}

	@Override
	public int idCheck(String user_ID) {

		return sql.selectOne(NAMESPACE + ".idCheck", user_ID);
	}

}
