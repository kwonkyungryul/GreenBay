package com.example.auction.controller.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.auction.model.BoardVO;
import com.example.auction.service.board.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired BoardService bService;


	@RequestMapping("")
	public ModelAndView getBoardList(
			@RequestParam(defaultValue = "boardName") String searchOpt,
			@RequestParam(defaultValue = "") String words) {
		List<BoardVO> bList = bService.getBoardList(searchOpt, words);
		int bCount = bService.getBoardCount(searchOpt, words);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("template", "board");
		mav.addObject("mypage", "list");
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("words", words);
		mav.addObject("boardCount", bCount);
		mav.addObject("boardList", bList);
		
		mav.setViewName("/admin/admin");

		return mav;
	}

	@RequestMapping(value = "/setBoard", method = RequestMethod.GET)
	public ModelAndView setBoard() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("template", "board");
		mav.addObject("mypage", "insert");
		mav.setViewName("/admin/admin");
		return mav;
	}

	@RequestMapping(value = "/setBoard", method = RequestMethod.POST)
	public String setBoardWrite(@ModelAttribute BoardVO bvo) {
		int result = bService.setBoard(bvo);
		String url = null;

		if ( result > 0 ) {
			bService.createTblArticle(bvo.getBoardCode());
			bService.createTblComment(bvo.getBoardCode());
			url = "redirect:/board";
		} else {
			url = "redirect:/board";
		}

		return url;
	}

	@RequestMapping("/deleteBoard")
	@ResponseBody
	public String deleteBoard(@RequestParam String boardCode) {
		int result = bService.deleteBoard(boardCode);
		StringBuilder sb = new StringBuilder();
		String msg = null;
		
		if( result > 0 ) {
			msg = "게시판이 정상적으로 삭제되었습니다.";
			bService.dropTblArticle(boardCode);
			bService.dropTblComment(boardCode);
			sb.append("<script>");
			sb.append("alert('" + msg + "');");
			sb.append("location.replace('/board');");
			sb.append("</script>");
		} else {
			msg = "게시판이 삭제되지 않았습니다. 관리자에게 문의하세요.";
			sb.append("<script>");
			sb.append("alert('" + msg + "');");
			sb.append("location.replace('/board');");
			sb.append("</script>");
		}
		
		return sb.toString();
	}
	
	@RequestMapping("/getBoardCodeCheck")
	@ResponseBody
	public String getBoardCheck(@RequestParam String boardCode) {
		int result = bService.getBoardCode(boardCode);
		String data = null;
		
		if ( result > 0 ) {
			data = "NO";
		} else {
			data = "YES";
		}
		
		return data;
	}
}
