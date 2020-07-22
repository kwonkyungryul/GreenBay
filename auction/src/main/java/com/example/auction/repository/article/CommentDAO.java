package com.example.auction.repository.article;

import java.util.List;

import com.example.auction.model.CommentVO;

public interface CommentDAO {
	public int commentSet(CommentVO cvo);
	
	public List<CommentVO> getCommentList(CommentVO cvo);
	
	public int setCommentDelete(CommentVO cvo);
	
	public int setCommentUpdate(CommentVO cvo);
}
