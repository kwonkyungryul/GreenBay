package com.example.auction.repository.article;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.auction.model.ArticleVO;
import com.example.auction.model.BoardVO;

@Repository
public class ArticleDAOImpl implements ArticleDAO {
@Autowired SqlSession session;
	
	final static String NAMESPACE = "mappers.ArticleMapper";
	
	@Override
	public BoardVO getBoardConfig(String boardCode) {

		return session.selectOne(NAMESPACE + ".getBoardConfig", boardCode);
	}

	@Override
	public void setArticle(ArticleVO avo) {

		session.insert(NAMESPACE + ".setArticle", avo);
	}

	@Override
	public int getArticleCount(String searchOpt, String words, String boardCode) {

		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		map.put("boardCode", boardCode);
		return session.selectOne(NAMESPACE + ".getArticleCount", map);
	}

	@Override
	public List<ArticleVO> getArticleList(int start, int end, String searchOpt, String words, String boardCode) {

		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("start", start);
		map.put("end", end);
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		map.put("boardCode", boardCode);
		return session.selectList(NAMESPACE + ".getArticleList", map);
	}
	
	@Override
	public ArticleVO getArticleView(String boardCode, int aseq) {

		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("boardCode", boardCode);
		map.put("aseq", aseq);
		
		return session.selectOne(NAMESPACE + ".getArticleView", map);
	}
	
	@Override
	public void hitUp(String boardCode, int aseq) {

		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("boardCode", boardCode);
		map.put("aseq", aseq);
		
		session.update(NAMESPACE + ".hitUp", map);
	}

	@Override
	public int setArticleDelete(String boardCode, int aseq) {

		Map<String, Object> map = new HashMap<>();
		map.put("boardCode", boardCode);
		map.put("aseq", aseq);
		
		return session.delete(NAMESPACE + ".setArticleDelete", map);
	}

	@Override
	public ArticleVO getArticleReplyInfo(ArticleVO avo) {

		return session.selectOne(NAMESPACE + ".getArticleReplyInfo", avo);
	}

	@Override
	public int setArticleRef(ArticleVO avo) {

		return session.update(NAMESPACE + ".setArticleRef", avo);
	}

	@Override
	public int setArticleReply(ArticleVO avo) {

		return session.insert(NAMESPACE + ".setArticleReply", avo);
	}

	@Override
	public int setArticleModify(ArticleVO avo) {

		return session.update(NAMESPACE + ".setArticleModify", avo);
	}

	@Override
	public ArticleVO getArticleModify(ArticleVO avo) {

		return session.selectOne(NAMESPACE + ".getArticleView", avo);
	}
}
