package com.example.auction.controller.product;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.example.auction.model.BidderInfoVO;
import com.example.auction.model.ItemVO;
import com.example.auction.model.MainCateVO;
import com.example.auction.service.category.MainCateService;
import com.example.auction.service.category.SubCateService;
import com.example.auction.service.product.BidderInfoService;
import com.example.auction.service.product.ItemService;

@Controller
@RequestMapping("/items")
public class ItemController {
	
	@Autowired ItemService itemService;
	
	@Autowired MainCateService mainCateService;
	
	@Autowired SubCateService subCateService;
	
	@Autowired BidderInfoService bidderService;
	
	@RequestMapping("")
	public ModelAndView getItemsList(
			@RequestParam(defaultValue = "1") int num,
			@RequestParam(defaultValue = "item_Name") String searchOpt,
			@RequestParam(defaultValue = "") String words) {
		ModelAndView mav = new ModelAndView();
		int itemCount = itemService.getItemCount(searchOpt, words);
		
		int end = 10; // 한 페이지에 보여줄 게시물 수
		int pageNum = (int) Math.ceil( (double) itemCount / end ); // 페이지 번호

		int start = (num - 1) * end; // 0에서 부터 10개 자르기

		int pageNum_cnt = 10; // 페이지 개수 번호를 10개씩만 출력

		int endPageNum = (int) (Math.ceil((double) num / (double)pageNum_cnt) * pageNum_cnt);

		int startPageNum = endPageNum - ( pageNum_cnt - 1 );

		int lastPageNum = (int) (Math.ceil((double)itemCount / (double) pageNum_cnt));

		if( endPageNum > lastPageNum ) {
			endPageNum = lastPageNum;
		}

		boolean prev = startPageNum == 1 ? false : true;
		boolean next = endPageNum * pageNum_cnt >= itemCount ? false : true;
		
		List<ItemVO> ivo = itemService.getItemList(start, end, searchOpt, words);
		
		mav.addObject("template", "item");
		mav.addObject("mypage", "list");
		mav.addObject("iList", ivo);
		mav.addObject("itemCount", itemCount);
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
	
	@RequestMapping(value = "/setItem", method = RequestMethod.GET)
	public ModelAndView getInsertItem() {
		ModelAndView mav = new ModelAndView();
		List<MainCateVO> mainList = mainCateService.getMainCateList();
		
		mav.addObject("template", "item");
		mav.addObject("mypage", "insert");
		mav.addObject("mainList", mainList);
		
		mav.setViewName("home/home");
		
		return mav;
	}
	
	@RequestMapping(value = "/setItem", method = RequestMethod.POST)
	@ResponseBody
	public String setInsertItem(
			@ModelAttribute ItemVO ivo,
			@RequestParam String sDate,
			@RequestParam String sHour,
			@RequestParam String eDate,
			@RequestParam String eHour,
			MultipartHttpServletRequest mhsr) {
		
		List<MultipartFile> fileList =  mhsr.getFiles("item_img");

		String path = "C:\\Users\\user\\Desktop\\auction\\src\\main\\resources\\static\\img\\item\\";
		String originFileName_tmp = "";
		String fileSize_tmp = "";
		String safeFile_tmp = "";

	
		for(MultipartFile mf : fileList) { // 1.jpg -> 20200522100000.jpg

			String originFileName = mf.getOriginalFilename(); // 원본
			long fileSize = mf.getSize(); // 파일 사이즈
			String safeFile = path + System.currentTimeMillis() + originFileName;

			originFileName_tmp += originFileName + ";";
			fileSize_tmp += fileSize + ";";
			safeFile_tmp += System.currentTimeMillis() + originFileName+";";

			try {
				mf.transferTo(new File(safeFile));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}

			ivo.setOriginFileName(originFileName_tmp);
			ivo.setFileSize(fileSize_tmp);
			ivo.setSafeFile(safeFile_tmp);
//			ivo.setOriginFileName("aa");
//			ivo.setSafeFile("bb");
//			ivo.setOriginFileName("bb");
		}
		
		ivo.setItem_StartDate(sDate+" "+sHour);
		ivo.setItem_EndDate(eDate+" "+eHour);

		StringBuilder sb = new StringBuilder();
		String msg = null;

		if( itemService.setItem(ivo) > 0 ) {
			msg = "상품이 정상적으로 등록되었습니다.";
			sb.append("<script>");
			sb.append("alert('" + msg + "');");
			sb.append("location.replace('/');");
			sb.append("</script>");
		} else {
			msg = "상품이 등록되지 않았습니다. 관리자에게 문의하세요.";
			sb.append("<script>");
			sb.append("alert('" + msg + "');");
			sb.append("location.replace('/');");
			sb.append("</script>");
		}
		
		return sb.toString();
	}
	
	@RequestMapping("/setItemDelete")
	@ResponseBody
	public String setItemDelete(@RequestParam int item_seq) {
	
		ItemVO ivo = itemService.getItemView(item_seq);
		
		if( ivo.getSafeFile() != null ) {
			String filePath = "C:\\Users\\user\\Desktop\\auction\\src\\main\\resources\\static\\img\\item\\";
			StringTokenizer st = new StringTokenizer(ivo.getSafeFile(), ";");
			
			File f = null;
			String fileName = null; /* filePath + safeFile */
			while( st.hasMoreTokens() ) {
				fileName = filePath + st.nextToken();
				f = new File(fileName);
				f.delete();
			}
		}
		
		
		
		int result = itemService.setItemDelete(item_seq);
		
		StringBuilder sb = new StringBuilder();
		String msg = null;

		if( result > 0 ) {
			itemService.setDeleteBidInfo(item_seq);
			msg = "상품이 정상적으로 삭제되었습니다.";
			sb.append("<script>");
			sb.append("alert('" + msg + "');");
			sb.append("location.replace('/items');");
			sb.append("</script>");
		} else {
			msg = "상품이 삭제되지 않았습니다. 관리자에게 문의하세요.";
			sb.append("<script>");
			sb.append("alert('" + msg + "');");
			sb.append("location.replace('/items');");
			sb.append("</script>");
		}
		
		return sb.toString();
	}
	
	
	
	@RequestMapping("/setItemDeleteAll")
	@ResponseBody
	public int setItemDeleteAll(
			@RequestParam(value = "chkArr[]") List<String> chkArr) {
		
		int item_seq, result = 0;
		
		for(String list : chkArr) {
			item_seq = Integer.parseInt(list);
			
			ItemVO ivo = itemService.getItemView(item_seq);
			
			if( ivo.getSafeFile() != null ) {
				String filePath = "C:\\Users\\user\\Desktop\\auction\\src\\main\\resources\\static\\img\\item\\";
				StringTokenizer st = new StringTokenizer(ivo.getSafeFile(), ";");
				
				File f = null;
				String fileName = null; /* filePath + safeFile */
				while( st.hasMoreTokens() ) {
					fileName = filePath + st.nextToken();
					f = new File(fileName);
					f.delete();
				}
			}
			result = itemService.setItemDelete(item_seq);
		}
		
		if(result > 0) {
			
			return 1;
		} else {
			
			return 0;
		}
	}
	
	@RequestMapping("/getItemView")
	public ModelAndView getItemView(@RequestParam int item_seq) {
		ItemVO ivo = itemService.getItemView(item_seq);
		
		BidderInfoVO bivo = bidderService.getTopBidder(item_seq);
		
		ModelAndView mav = new ModelAndView();		

		mav.addObject("template", "item");
		mav.addObject("mypage", "view");
		mav.addObject("iView", ivo);
		mav.addObject("topBidder", bivo);
		
		mav.setViewName("admin/admin");
		
		return mav;
	}
	
	
}
