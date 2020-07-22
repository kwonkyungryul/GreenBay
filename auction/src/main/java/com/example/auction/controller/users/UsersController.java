package com.example.auction.controller.users;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.auction.model.UserVO;
import com.example.auction.service.users.UsersService;

@Controller
@RequestMapping("/users")
public class UsersController {
	
	@Autowired UsersService usersService;
	
	
	@RequestMapping("")
	public ModelAndView getUsersList(
			@RequestParam(defaultValue = "1") int num,
			@RequestParam(defaultValue = "user_ID") String searchOpt,
			@RequestParam(defaultValue = "") String words) {
		ModelAndView mav = new ModelAndView();
		
		int cnt = usersService.getUsersCount(searchOpt, words);
		
		int end = 5; // 한 페이지에 보여줄 게시물 수
		int pageNum = (int) Math.ceil( (double) cnt / end ); // 페이지 번호

		int start = (num - 1) * end; // 0에서 부터 10개 자르기

		int pageNum_cnt = 5; // 페이지 개수 번호를 10개씩만 출력

		int endPageNum = (int) (Math.ceil((double) num / (double)pageNum_cnt) * pageNum_cnt);

		int startPageNum = endPageNum - ( pageNum_cnt - 1 );

		int lastPageNum = (int) (Math.ceil((double)cnt / (double) pageNum_cnt));

		if( endPageNum > lastPageNum ) {
			endPageNum = lastPageNum;
		}

		boolean prev = startPageNum == 1 ? false : true;
		boolean next = endPageNum * pageNum_cnt >= cnt ? false : true;
		
		List<UserVO> uvo = usersService.getUsersList(start, end, searchOpt, words);
		
		mav.addObject("template", "user");
		mav.addObject("mypage", "list");
		mav.addObject("uvo", uvo);
		mav.addObject("usersCount", cnt);
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
		
		mav.setViewName("admin/admin");
		
		return mav;
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String getRegister() {

		return "/user/register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	@ResponseBody
	public String setRegister(@ModelAttribute UserVO uvo) {

		int result = usersService.setUser(uvo);

		StringBuilder sb = null;
		String msg = null;

		if( result > 0 ) {
			sb = new StringBuilder();
			msg = "회원가입이 정상적으로 완료되었습니다.";
			sb.append("<script>");
			sb.append("alert('"+msg+"');");
			sb.append("location.replace('/login');");
			sb.append("</script>");
		}

		return sb.toString();
	}

	@RequestMapping("/loginCheck")
	public ModelAndView loginCheck( @ModelAttribute UserVO uvo, HttpSession session) {

		ModelAndView mav = new ModelAndView();

		UserVO vo = usersService.loginCheck(uvo, session);

		if ( vo == null ) {
			mav.addObject("msg", "아이디나 비밀번호를 확인하세요.");
			mav.setViewName("/login");
		} else {
			mav.setViewName("redirect:/");
		}

		return mav;
	}
	
	@RequestMapping("/idCheck")
	@ResponseBody
	public String idCheck(@RequestParam String user_ID) {
		int result = usersService.idCheck(user_ID);
		String str = null;

		if (result > 0 ) {
			str = "NO";
		} else {
			str = "YES";
		}

		return str;
	}
	
	@RequestMapping("/setAuthUpdate")
	@ResponseBody
	public int setAuthUpdate(@ModelAttribute UserVO uvo) {
		usersService.setAuthUpdate(uvo);
		return 1;
	}
	
	@RequestMapping("/userView")
	public ModelAndView getUserView(@RequestParam int useq) {
		ModelAndView mav = new ModelAndView();
		
		UserVO uvo = usersService.getUserView(useq);
		
		mav.addObject("template", "user");
		mav.addObject("mypage", "view");
		mav.addObject("uView", uvo);
		
		mav.setViewName("admin/admin");
		
		return mav;
	}
	
	@RequestMapping(value = "/userModify", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getUserModify(@RequestParam int useq) {
		ModelAndView mav = new ModelAndView();
		
		UserVO uvo = usersService.getUserView(useq);
		
		
		mav.addObject("template", "user");
		mav.addObject("mypage", "modify");
		mav.addObject("uView", uvo);
		
		mav.setViewName("admin/admin");
		
		return mav;
	}
	
	@RequestMapping(value = "/userModify", method = RequestMethod.POST)
	@ResponseBody
	public String setUserModify(@ModelAttribute UserVO uvo) {
		int result = usersService.setUserModify(uvo);
		
		StringBuilder sb = null;
		String msg = null;
		
		if (result > 0) {
			sb = new StringBuilder();
			msg = "회원정보가 정상적으로 수정되었습니다.";
			sb.append("<script>");
			sb.append("alert('"+msg+"');");
			sb.append("location.replace('/users/userView?useq="+uvo.getUseq()+"');");
			sb.append("</script>");
		} else {
			sb = new StringBuilder();
			msg = "회원정보를 수정할 수 없습니다.";
			sb.append("<script>");
			sb.append("alert('"+msg+"');");
			sb.append("location.replace('/users/userView?useq="+uvo.getUseq()+"');");
			sb.append("</script>");
		}
		
		return sb.toString();
	}
	
	@RequestMapping("/userDelete")
	@ResponseBody
	public String setUserDelete(@RequestParam int useq) {

		int result = usersService.setUserDelete(useq);
		
		StringBuilder sb = null;
		String msg = null;
		if(result > 0) {
			sb = new StringBuilder();
			msg = "회원정보가 정상적으로 삭제되었습니다.";
			sb.append("<script>");
			sb.append("alert('" + msg + "');");
			sb.append("window.location.replace('/users');");
			sb.append("</script>");
		}
		
		
		
		return sb.toString();
	}
	
	@RequestMapping("/usersDeleteAll")
	@ResponseBody
	public int setUsersDeleteAll(
			@RequestParam(value = "chkArr[]") List<String> chkArr) {
		
		int useq, result = 0;
		
		for(String list : chkArr) {
			useq = Integer.parseInt(list);
			result = usersService.setUserDelete(useq);
		}
		
		if(result > 0) {
			return 1;
		} else {
			return 0;
		}
	}

}
