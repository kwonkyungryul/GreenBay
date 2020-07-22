package com.example.auction;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.auction.model.BidderInfoVO;
import com.example.auction.model.ItemVO;
import com.example.auction.model.MainCateVO;
import com.example.auction.model.SubCateVO;
import com.example.auction.service.category.MainCateService;
import com.example.auction.service.category.SubCateService;
import com.example.auction.service.product.BidderInfoService;
import com.example.auction.service.product.ItemService;
import com.example.auction.service.users.UsersService;

@Controller
public class HomeController {
	
	@Autowired UsersService usersService;
	
	@Autowired MainCateService mcService;
	
	@Autowired SubCateService scService;
	
	@Autowired ItemService itemService;
	
	@Autowired BidderInfoService bidService;
	
	@RequestMapping("")
	public ModelAndView getMain() {
		ModelAndView mav = new ModelAndView();
		
		List<MainCateVO> mainList = mcService.getMainCateList();
		
		List<ItemVO> recList = itemService.getItems(0, 16);
		List<ItemVO> hotList = itemService.getItems(17, 16);
		
		mav.addObject("template", "main");
		mav.addObject("mypage", "view");
		mav.addObject("mainList", mainList);
		mav.addObject("recList", recList);
		mav.addObject("hotList", hotList);
		
		
		mav.setViewName("/home/home");
		
		return mav;
	}
	
	@RequestMapping("/categories")
	public ModelAndView getCategories(
			@RequestParam String mainName,
			@RequestParam String subName) {
		
		List<MainCateVO> mainList = mcService.getMainCateList();
		
		List<SubCateVO> subList = scService.selectedSubCateList(mainName);
		
		List<ItemVO> iList = itemService.selectedItemList(mainName, subName);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("template", "category");
		mav.addObject("mypage", "view");
		mav.addObject("mainList", mainList);
		mav.addObject("subList", subList);
		mav.addObject("iList", iList);
		mav.addObject("mainName", mainName);
		mav.addObject("subName", subName);

		mav.setViewName("/home/home");
		
		return mav;
	}
	
	@RequestMapping("/itemDetail")
	public ModelAndView getproductDetail(
			@RequestParam String mainCate,
			@RequestParam String subCate,
			@RequestParam int item_seq) {
		ItemVO ivo = itemService.getItemView(item_seq);
		itemService.hitUp(item_seq);
		
		List<MainCateVO> mainList = mcService.getMainCateList();
		
		List<SubCateVO> subList = scService.getSubCateList();
		
		BidderInfoVO topBidder = bidService.getTopBidder(item_seq);
		
		ModelAndView mav = new ModelAndView();

		mav.addObject("template", "item");
		mav.addObject("mypage", "view");
		mav.addObject("mainList", mainList);
		mav.addObject("subList", subList);
		mav.addObject("ivo", ivo);
		
		mav.addObject("topBidder", topBidder);
		
		mav.addObject("mainName", mainCate);
		mav.addObject("subName", subCate);

		mav.setViewName("/home/home");
		
		return mav;
	}
	
	@RequestMapping("/login")
	public String getLogin() {
		
		return "/login";
	}
	
	@RequestMapping("/logout")
	public String setLogout(HttpSession session) {
		
		usersService.setLogout(session);
		
		return "redirect:/";
	}
}
