package com.example.auction.controller.article;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.auction.model.CommentVO;
import com.example.auction.service.article.CommentService;

@RequestMapping("/comment")
@Controller
public class ComentController {
	
	@Autowired CommentService cService;
	
	
	@RequestMapping("/commentSet")
	@ResponseBody
	public int setComment(@ModelAttribute CommentVO cvo) {

		return cService.commentSet(cvo);
	}
	
	@RequestMapping("/getCommentList")
	@ResponseBody
	public List<CommentVO> getCommentList(@ModelAttribute CommentVO cvo) {
		
		return cService.getCommentList(cvo);
	}
	
	@RequestMapping("/setCommentDelete")
	@ResponseBody
	public int setCommentDelete(@ModelAttribute CommentVO cvo) {
		cService.setCommentDelete(cvo); 
		return 1;
	}
	
	@RequestMapping("/setCommentUpdate")
	@ResponseBody
	public int setCommentUpdate(@ModelAttribute CommentVO cvo) {
		
		return cService.setCommentUpdate(cvo);
	}
}
