package com.example.auction.repository.category;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.auction.model.MainCateVO;

@Repository
public class MainCateDAOImpl implements MainCateDAO {

	@Autowired SqlSession sql;

	private final static String NAMESPACE = "mappers.MainCateMappers";
	
	@Override
	public int setMainCate(MainCateVO mcvo) {

		return sql.insert(NAMESPACE + ".setMainCate", mcvo);
	}

	@Override
	public List<MainCateVO> getMainCateList() {

		return sql.selectList(NAMESPACE + ".getMainCateList");
	}

	@Override
	public void setDeleteMainCate(String mainName) {

		sql.delete(NAMESPACE + ".setDeleteMainCate", mainName);
	}

	@Override
	public int getMainCateCountOne(String mainCode) {

		return sql.selectOne(NAMESPACE + ".getMainCateCountOne", mainCode);
	}

	@Override
	public int getMainCateCountAll() {

		return sql.selectOne(NAMESPACE + ".getMainCateCountAll");
	}
	
	
}
