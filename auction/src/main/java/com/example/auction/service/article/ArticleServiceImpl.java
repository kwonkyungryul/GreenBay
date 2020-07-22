package com.example.auction.service.article;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.auction.model.ArticleVO;
import com.example.auction.model.BoardVO;
import com.example.auction.repository.article.ArticleDAO;


@Service
public class ArticleServiceImpl implements ArticleService {
	@Autowired ArticleDAO aDao;
	
	@Override
	public BoardVO getBoardConfig(String boardCode) {

		return aDao.getBoardConfig(boardCode);
	}

	@Override
	public void setArticle(ArticleVO avo) {
		
		aDao.setArticle(avo);
	}

	@Override
	public List<ArticleVO> getArticleList(int start, int end, String searchOpt, String words, String boardCode) {

		return aDao.getArticleList(start, end, searchOpt, words, boardCode);
	}
	
	@Override
	public ArticleVO getArticleView(String boardCode, int aseq) {
		
		aDao.hitUp(boardCode, aseq);
		return aDao.getArticleView(boardCode, aseq);
		
	}

	@Override
	public int setArticleDelete(String boardCode, int aseq) {

		return aDao.setArticleDelete(boardCode, aseq);
	}

	@Override
	public int getArticleCount(String searchOpt, String words, String boardCode) {

		return aDao.getArticleCount(searchOpt, words, boardCode);
	}

	@Override
	public ArticleVO getArticleReplyInfo(ArticleVO avo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int setArticleRef(ArticleVO avo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int setArticleReply(ArticleVO avo) {
		ArticleVO dto = aDao.getArticleReplyInfo(avo);
		avo.setRef(dto.getRef());
		avo.setRe_step(dto.getRe_step());
		avo.setRe_level(dto.getRe_level());
		
		int result = 0;
		result += aDao.setArticleRef(avo);
		result += aDao.setArticleReply(avo);
		
		return result;
	}

	@Override
	public int setArticleModify(ArticleVO avo) {

		return aDao.setArticleModify(avo);
	}

	@Override
	public ArticleVO getArticleModify(ArticleVO avo) {

		return aDao.getArticleModify(avo);
	}
}
