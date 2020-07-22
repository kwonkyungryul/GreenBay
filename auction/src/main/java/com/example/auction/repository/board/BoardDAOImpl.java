package com.example.auction.repository.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.auction.model.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Autowired SqlSession session;

	final static String NAMESPACE = "mappers.BoardMapper";
	
	
	@Override
	public int setBoard(BoardVO bvo) {

		return session.insert(NAMESPACE + ".setBoard", bvo);
	}


	@Override
	public int createTblArticle(String boardCode) {
		String str = "";
		str += "CREATE TABLE gb_article_" + boardCode + "(";
		str += "aseq int not null auto_increment primary key,";
		str += "subject varchar(255) not null,";
		str += "writer varchar(20) not null,";
		str += "content text not null,";
		str += "regdate datetime,";
		str += "hit int default 0,";
		str += "fileName varchar(255),";
		str += "fileOriName varchar(255),";
		str += "fileUrl varchar(500),";
		str += "ref int,";
		str += "re_step int,";
		str += "re_level int";
		str += ");";
		return session.update(NAMESPACE + ".createTblArticle", str);
	}


	@Override
	public int createTblComment(String boardCode) {
		String str = "";
		str += "CREATE TABLE gb_comment_" + boardCode + "(";
		str += "cseq int not null auto_increment primary key,";
		str += "aseq int not null,";
		str += "comment text not null,";
		str += "who varchar(20),";
		str += "regdate datetime";
		str += ");";
		return session.update(NAMESPACE + ".createTblComment", str);
	}


	@Override
	public List<BoardVO> getBoardList(String searchOpt, String words) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		
		return session.selectList(NAMESPACE + ".getBoardList", map);
	}
	
	
	@Override
	public int getBoardCount(String searchOpt, String words) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		
		return session.selectOne(NAMESPACE + ".getBoardCount", map);
	}
	

	@Override
	public int deleteBoard(String boardCode) {

		return session.delete(NAMESPACE + ".deleteBoard", boardCode);
	}


	@Override
	public int dropTblArticle(String boardCode) {
		String str = "DROP TABLE gb_article_" + boardCode;
		
		return session.update(NAMESPACE + ".dropTblArticle", str);
	}


	@Override
	public int dropTblComment(String boardCode) {
		String str = "DROP TABLE gb_comment_" + boardCode;
		
		return session.update(NAMESPACE + ".dropTblComment", str);
	}


	@Override
	public int getBoardCode(String boardCode) {

		return session.selectOne(NAMESPACE + ".getBoardCode", boardCode);
	}
}
