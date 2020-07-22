package com.example.auction.controller.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.auction.model.BidderInfoVO;
import com.example.auction.service.product.BidderInfoService;

@Controller
public class BidderInfoController {
	
	@Autowired BidderInfoService bidderService;
	
	@RequestMapping("/getBid")
	public ModelAndView getBid() {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	@RequestMapping("/setBid")
	@ResponseBody
	public int setBid(BidderInfoVO bivo) {

		int result = bidderService.setBid(bivo);
		
		if( result > 0 ) {
			bidderService.bidCntUp(bivo.getItem_seq());
			return 1;
		} else {
			return 0;
		}
	}
}
