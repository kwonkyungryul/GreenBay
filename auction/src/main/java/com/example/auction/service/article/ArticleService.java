package com.example.auction.service.article;

import java.util.List;

import com.example.auction.model.ArticleVO;
import com.example.auction.model.BoardVO;

public interface ArticleService {
	public BoardVO getBoardConfig(String boardCode);
	
	public void setArticle(ArticleVO avo);
	
	public List<ArticleVO> getArticleList(int start, int end, String searchOpt, String words, String boardCode);
	
	public ArticleVO getArticleView(String boardCode, int aseq);
	
	public int getArticleCount(String searchOpt, String words, String boardCode);
	
	public int setArticleDelete(String boardCode, int aseq);
	
	public ArticleVO getArticleReplyInfo(ArticleVO avo);
	
	public int setArticleRef(ArticleVO avo);
	
	public int setArticleReply(ArticleVO avo);
	
	public int setArticleModify(ArticleVO avo);
	
	public ArticleVO getArticleModify(ArticleVO avo);
}
