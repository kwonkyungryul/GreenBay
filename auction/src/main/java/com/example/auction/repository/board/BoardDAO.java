package com.example.auction.repository.board;

import java.util.List;

import com.example.auction.model.BoardVO;

public interface BoardDAO {
	public int setBoard(BoardVO bvo);
	
	public int createTblArticle(String boardCode);
	
	public int createTblComment(String boardCode);
	
	public List<BoardVO> getBoardList(String searchOpt, String words);
	
	public int getBoardCount(String searchOpt, String words);
	
	public int deleteBoard(String boardCode);
	
	public int dropTblArticle(String boardCode);
	
	public int dropTblComment(String boardCode);
	
	public int getBoardCode(String boardCode);
}
