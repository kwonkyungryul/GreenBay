package com.example.auction.repository.category;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.auction.model.SubCateVO;

@Repository
public class SubCateDAOImpl implements SubCateDAO {

	@Autowired SqlSession sql;
	
	private final static String NAMESPACE = "mappers.SubCateMappers";

	@Override
	public int setSubCate(SubCateVO svo) {

		return sql.insert(NAMESPACE + ".setSubCate", svo);
	}

	@Override
	public List<SubCateVO> getSubCateList() {

		return sql.selectList(NAMESPACE + ".getSubCateList");
	}

	@Override
	public void setDeleteSubCate(SubCateVO svo) {

		sql.delete(NAMESPACE + ".setDeleteSubCate", svo);
	}

	@Override
	public List<SubCateVO> selectedSubCateList(String mainName) {

		return sql.selectList(NAMESPACE + ".selectedSubCateList", mainName);
	}

	@Override
	public int getSubCateCountOne(SubCateVO svo) {

		return sql.selectOne(NAMESPACE + ".getSubCateCountOne", svo);
	}
}
