package com.example.auction.controller.article;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.auction.model.ArticleVO;
import com.example.auction.model.BoardVO;
import com.example.auction.model.MainCateVO;
import com.example.auction.service.article.ArticleService;
import com.example.auction.service.category.MainCateService;

@Controller
@RequestMapping("/article")
public class ArticleController {

	@Autowired ArticleService aService;
	
	@Autowired MainCateService mcService;

	@RequestMapping("")
	public ModelAndView getArticleList(
			@RequestParam String boardCode,
			@RequestParam(defaultValue = "1") int num,
			@RequestParam(defaultValue = "subject") String searchOpt,
			@RequestParam(defaultValue = "") String words) {

		int cnt = aService.getArticleCount(searchOpt, words, boardCode);

		int end = 10; // 한 페이지에 보여줄 게시물 수
		int pageNum = (int) Math.ceil( (double) cnt / end ); // 페이지 번호

		int start = (num - 1) * end; // 0에서 부터 10개 자르기

		int pageNum_cnt = 10; // 페이지 개수 번호를 10개씩만 출력

		int endPageNum = (int) (Math.ceil((double) num / (double)pageNum_cnt) * pageNum_cnt);

		int startPageNum = endPageNum - ( pageNum_cnt - 1 );

		int lastPageNum = (int) (Math.ceil((double)cnt / (double) pageNum_cnt));

		if( endPageNum > lastPageNum ) {
			endPageNum = lastPageNum;
		}

		boolean prev = startPageNum == 1 ? false : true;
		boolean next = endPageNum * pageNum_cnt >= cnt ? false : true;

		List<ArticleVO> list = aService.getArticleList(start, end, searchOpt, words, boardCode);
		BoardVO bvo = aService.getBoardConfig(boardCode);
		ModelAndView mav = new ModelAndView();
		List<MainCateVO> mainList = mcService.getMainCateList();

		mav.addObject("boardConfig", bvo);
		mav.addObject("boardCode", boardCode);
		mav.addObject("articleList", list);
		mav.addObject("articleCount", cnt);
		mav.addObject("mainList", mainList);
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("words", words);
		mav.addObject("prev", prev);
		mav.addObject("next", next);
		mav.addObject("pageNum", pageNum);
		mav.addObject("startPageNum", startPageNum);
		mav.addObject("endPageNum", endPageNum);
		mav.addObject("select", num);
		mav.addObject("num", num);
		mav.addObject("end", end);
		
		mav.addObject("template", "article");
		mav.addObject("mypage", "list");

		mav.setViewName("home/home");

		return mav;
	}

	@RequestMapping(value = "/setArticle", method = RequestMethod.GET)
	public ModelAndView getArticle(@RequestParam String boardCode) {
		BoardVO bvo = aService.getBoardConfig(boardCode);
		List<MainCateVO> mainList = mcService.getMainCateList();
		ModelAndView mav = new ModelAndView();

		mav.addObject("boardConfig", bvo);
		mav.addObject("boardCode", boardCode);
		mav.addObject("mainList", mainList);

		mav.addObject("template", "article");
		mav.addObject("mypage", "insert");

		mav.setViewName("home/home");

		return mav;
	}

	@RequestMapping(value = "/setArticle", method = RequestMethod.POST)
	@ResponseBody
	public String setArticle(
			@ModelAttribute ArticleVO avo,
			@RequestPart MultipartFile files
			) throws IllegalStateException, IOException {
		
		if (files.isEmpty()) {
			aService.setArticle(avo);
		} else {
			/* 첨부파일 저장되는 위치 */
			String fileUrl = "D:\\ex\\sample\\src\\main\\resources\\static\\upload\\";

			/* 파일 이름 변경 */
			String fileName = files.getOriginalFilename();
			String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();

			File destinationFile = null;
			String destinationFileName;

			do {
				destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
				destinationFile = new File(fileUrl + destinationFileName);

			} while (destinationFile.exists());

			destinationFile.getParentFile().mkdirs();
			files.transferTo(destinationFile);

			avo.setFileName(destinationFileName);
			avo.setFileOriName(fileName);
			avo.setFileUrl(fileUrl);

			aService.setArticle(avo);
		}
		

		StringBuilder sb = new StringBuilder();
		String msg = null;

		msg = "게시물이 정상적으로 저장되었습니다";
		sb.append("<script>");
		sb.append("alert('" + msg + "');");
		sb.append("location.replace('/article?boardCode="+avo.getBoardCode()+"');");
		sb.append("</script>");

		return sb.toString();
	}

	@RequestMapping("/setArticleDeleteAll")
	@ResponseBody
	public String setArticleDeleteAll (
			@RequestParam String boardCode,
			@RequestParam(value = "chkArr[]") List<String> chkArr) {

		int aseq = 0;
		String msg = null;

		for(String list : chkArr) {
			aseq = Integer.parseInt(list);
			aService.setArticleDelete(boardCode, aseq);
		}

		msg = "success";

		return msg;
	}

	@RequestMapping("/setArticleDelete")
	@ResponseBody
	public String setUsersDelete(
			@RequestParam String boardCode,
			@RequestParam int aseq) {
		int result = aService.setArticleDelete(boardCode, aseq);
		StringBuilder sb = new StringBuilder();
		String msg = null;

		if( result > 0 ) {
			msg = "삭제가 완료되었습니다.";
			sb.append("<script>");
			sb.append("alert('" + msg + "');");
			sb.append("location.replace('/article?boardCode="+boardCode+"');");
			sb.append("</script>");
		} else {
			msg = "삭제에 실패하였습니다. 관리자에게 문의하세요.";
			sb.append("<script>");
			sb.append("alert('" + msg + "');");
			sb.append("location.replace('/article?boardCode="+boardCode+"');");
			sb.append("</script>");
		}

		return sb.toString();
	}

	@RequestMapping("/getArticleView")
	public ModelAndView getArticleView(
			@RequestParam String boardCode,
			@RequestParam int aseq) {
		ArticleVO avo = aService.getArticleView(boardCode, aseq);
		BoardVO bvo = aService.getBoardConfig(boardCode);
		List<MainCateVO> mainList = mcService.getMainCateList();
		
		ModelAndView mav = new ModelAndView();

		mav.addObject("articleView", avo);
		mav.addObject("boardConfig", bvo);
		mav.addObject("boardCode", boardCode);
		mav.addObject("mainList", mainList);
		
		mav.addObject("template", "article");
		mav.addObject("mypage", "view");

		mav.setViewName("home/home");

		return mav;
	}
	
	@RequestMapping("/getArticleReply")
	public ModelAndView getArticleReply(
			@RequestParam String boardCode,
			@RequestParam int aseq) {
		ArticleVO avo = aService.getArticleView(boardCode, aseq);
		BoardVO bvo = aService.getBoardConfig(boardCode);
		List<MainCateVO> mainList = mcService.getMainCateList();
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("avo", avo);
		mav.addObject("boardConfig", bvo);
		mav.addObject("boardCode", boardCode);
		mav.addObject("mainList", mainList);
		
		mav.addObject("template", "article");
		mav.addObject("mypage", "reply");

		mav.setViewName("home/home");

		return mav;
	}
	
	@RequestMapping("/setArticleReply")
	@ResponseBody
	public String setArticleReply(
			@ModelAttribute ArticleVO avo) {
		
		int result = aService.setArticleReply(avo);
		
		StringBuilder sb = null;
		String msg = null;
		
		if( result > 0 ) {
			sb = new StringBuilder();
			msg = "선택하신 게시물에 답변이 저장되었습니다.";
			sb.append("<script>");
			sb.append("alert('" + msg + "');");
			sb.append("location.replace('/article?boardCode="+avo.getBoardCode()+"')");
			sb.append("</script>");
		} else {
			sb = new StringBuilder();
			msg = "시스템 오류입니다. 관리자에게 문의하세요.";
			sb.append("<script>");
			sb.append("alert('" + msg + "');");
			sb.append("location.replace('/article?boardCode="+avo.getBoardCode()+"');");
			sb.append("</script>");
		}
		
		return sb.toString();
	}
	
	@RequestMapping(value = "/setArticleModify", method = RequestMethod.GET)
	public ModelAndView getArticleModify(ArticleVO avo) {
		BoardVO bvo = aService.getBoardConfig(avo.getBoardCode());
		ArticleVO vo = aService.getArticleModify(avo);
		List<MainCateVO> mainList = mcService.getMainCateList();
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("articleModify", vo);
		mav.addObject("boardConfig", bvo);
		mav.addObject("boardCode", avo.getBoardCode());
		mav.addObject("mainList", mainList);
		
		mav.addObject("template", "article");
		mav.addObject("mypage", "modify");

		mav.setViewName("home/home");

		return mav;
	}
	
	@RequestMapping(value = "/setArticleModify", method = RequestMethod.POST)
	@ResponseBody
	public String setArticleModify(ArticleVO avo) {

		int result = aService.setArticleModify(avo);
		
		StringBuilder sb = null;
		String msg = null;
		
		if( result > 0 ) {
			sb = new StringBuilder();
			msg = "게시물 수정이 완료되었습니다.";
			sb.append("<script>");
			sb.append("alert('" + msg + "');");
			sb.append("location.replace('/article/getArticleView?boardCode="+avo.getBoardCode()+"&aseq="+avo.getAseq()+"')");
			sb.append("</script>");
		} else {
			sb = new StringBuilder();
			msg = "시스템 오류입니다. 관리자에게 문의하세요.";
			sb.append("<script>");
			sb.append("alert('" + msg + "');");
			sb.append("location.replace('/article/getArticleView?boardCode="+avo.getBoardCode()+"&aseq="+avo.getAseq()+"')");
			sb.append("</script>");
		}
		return sb.toString();
	}
	
	@RequestMapping("/fileDown")
	public void fileDown(int aseq, String boardCode, HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		ArticleVO avo = aService.getArticleView(boardCode, aseq);

		try {
			// db 다운로드 파일 주소
			String fileUrl = avo.getFileUrl();
			String fileName = avo.getFileName();
			String fileOriName = avo.getFileOriName();
			String savePath = fileUrl;
			InputStream in = null;
			OutputStream os = null;
			File file = null;
			boolean skip = false;
			String client = "";

			// 파일을 읽어 스트림에 담기
			try {
				file = new File(savePath, fileName);
				in = new FileInputStream(file);
			} catch (FileNotFoundException fe) {
				skip = true;
			}

			client = request.getHeader("User-Agent");

			// 파일 다운로드 헤더 지정
			response.reset();
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Description", "JSP Generated Data");

			if (!skip) {
				// IE
				if (client.indexOf("MSIE") != -1) {
					response.setHeader("Content-Disposition", "attachment; filename=\""
							+ java.net.URLEncoder.encode(fileOriName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
					// IE 11 이상.
				} else if (client.indexOf("Trident") != -1) {
					response.setHeader("Content-Disposition", "attachment; filename=\""
							+ java.net.URLEncoder.encode(fileOriName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
				} else {
					// 한글 파일명 처리
					response.setHeader("Content-Disposition",
							"attachment; filename=\"" + new String(fileOriName.getBytes("UTF-8"), "ISO8859_1") + "\"");
					response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
				}
				response.setHeader("Content-Length", "" + file.length());
				os = response.getOutputStream();
				byte b[] = new byte[(int) file.length()];
				int leng = 0;
				while ((leng = in.read(b)) > 0) {
					os.write(b, 0, leng);
				}
			} else {
				response.setContentType("text/html;charset=UTF-8");
				System.out.println("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");
			}
			in.close();
			os.close();
		} catch (Exception e) {
			System.out.println("ERROR : " + e.getMessage());
		}
	}
}
