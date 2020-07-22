package com.example.auction.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.auction.model.BoardVO;
import com.example.auction.repository.board.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired BoardDAO bDao;

	@Override
	public int setBoard(BoardVO bvo) {

		return bDao.setBoard(bvo);
	}

	@Override
	public int createTblArticle(String boardCode) {

		return bDao.createTblArticle(boardCode);
	}

	@Override
	public int createTblComment(String boardCode) {

		return bDao.createTblComment(boardCode);
	}

	@Override
	public List<BoardVO> getBoardList(String searchOpt, String words) {

		return bDao.getBoardList(searchOpt, words);
	}
	
	@Override
	public int getBoardCount(String searchOpt, String words) {

		return bDao.getBoardCount(searchOpt, words);
	}
	
	@Override
	public int deleteBoard(String boardCode) {

		return bDao.deleteBoard(boardCode);
	}

	@Override
	public int dropTblArticle(String boardCode) {

		return bDao.dropTblArticle(boardCode);
	}

	@Override
	public int dropTblComment(String boardCode) {

		return bDao.dropTblComment(boardCode);
	}

	@Override
	public int getBoardCode(String boardCode) {

		return bDao.getBoardCode(boardCode);
	}

}
