package com.example.auction.service.article;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.auction.model.CommentVO;
import com.example.auction.repository.article.CommentDAO;

@Service
public class CommentServiceImpl implements CommentService {
	@Autowired CommentDAO cDao;
	
	@Override
	public int commentSet(CommentVO cvo) {

		return cDao.commentSet(cvo);
	}

	@Override
	public List<CommentVO> getCommentList(CommentVO cvo) {

		return cDao.getCommentList(cvo);
	}

	@Override
	public int setCommentDelete(CommentVO cvo) {

		return cDao.setCommentDelete(cvo);
	}

	@Override
	public int setCommentUpdate(CommentVO cvo) {

		return cDao.setCommentUpdate(cvo);
	}
}
