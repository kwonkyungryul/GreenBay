package com.example.auction.controller.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.auction.model.MainCateVO;
import com.example.auction.model.SubCateVO;
import com.example.auction.service.category.MainCateService;
import com.example.auction.service.category.SubCateService;

@Controller
@RequestMapping("/cate")
public class CategoryController {
	@Autowired MainCateService mcService;
	@Autowired SubCateService subService;

	@RequestMapping("")
	public ModelAndView getCateList() {
		ModelAndView mav = new ModelAndView();
		

		
		mav.addObject("template", "category");
		mav.addObject("mypage", "list");
		
		mav.setViewName("admin/admin");
		
		return mav;
	}
	
	@RequestMapping("/setMainCate")
	@ResponseBody
	public int setMainCate(@ModelAttribute MainCateVO mcvo) {
		int isChecked = mcService.getMainCateCountOne(mcvo.getMainCode());
		int mainCnt = mcService.getMainCateCountAll();
		
		
		if(isChecked == 1) {
			return 2;
		} else if ( mainCnt > 6 ) {
			return 3;
		} else {
			int result = mcService.setMainCate(mcvo);
			if( result > 0 ) {				
				return 1;
			} else {
				return 0;
			}
		}
		
	}
	
	@RequestMapping("/getMainCateList")
	@ResponseBody
	public List<MainCateVO> getMainCateList() {
		
		return mcService.getMainCateList();
	}
	
	
	@RequestMapping("/setDeleteMainCate")
	@ResponseBody
	public void setDeleteMainCate(@RequestParam String mainName) {
		
		mcService.setDeleteMainCate(mainName);
	}
	
	@RequestMapping("/setSubCate")
	@ResponseBody
	public int setSubCate(@ModelAttribute SubCateVO svo) {
		
		int isChecked = subService.getSubCateCountOne(svo);
		
		if( isChecked > 0 ) {
			return 0;
		} else {
			subService.setSubCate(svo);
			return 1;
		}
	}
	
	@RequestMapping("/getSubCateList")
	@ResponseBody
	public List<SubCateVO> getSubCateList() {
		
		return subService.getSubCateList();
	}
	
	@RequestMapping("/setDeleteSubCate")
	@ResponseBody
	public void setDeleteSubCate(@ModelAttribute SubCateVO svo) {
		
		subService.setDeleteSubCate(svo);
	}
	
	@RequestMapping("/selectedSubCateList")
	@ResponseBody
	public List<SubCateVO> selectedSubCateList(@RequestParam String mainName) {
		
		return subService.selectedSubCateList(mainName);
	}
}
