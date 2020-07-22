package com.example.auction.repository.article;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.auction.model.CommentVO;

@Repository
public class CommentDAOImpl implements CommentDAO {
	
	@Autowired SqlSession session;
	
	final static String NAMESPACE = "mappers.CommentMapper";
	
	@Override
	public int commentSet(CommentVO cvo) {

		return session.insert(NAMESPACE + ".commentSet", cvo);
	}

	@Override
	public List<CommentVO> getCommentList(CommentVO cvo) {

		return session.selectList(NAMESPACE + ".getCommentList", cvo);
	}

	@Override
	public int setCommentDelete(CommentVO cvo) {

		return session.delete(NAMESPACE + ".setCommentDelete", cvo);
	}

	@Override
	public int setCommentUpdate(CommentVO cvo) {

		return session.update(NAMESPACE + ".setCommentUpdate", cvo);
	}
}
