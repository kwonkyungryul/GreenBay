package com.example.auction.service.product;

import java.util.List;

import com.example.auction.model.ItemVO;

public interface ItemService {

	public int setItem(ItemVO ivo);
	
	public List<ItemVO> getItemList(int start, int end, String searchOpt, String words);
	
	public ItemVO getItemView(int item_seq);
	
	public int getItemCount(String searchOpt, String words);
	
	public int setItemDelete(int item_seq);
	
	public List<ItemVO> selectedItemList(String mainCate, String subCate);
	
	public List<ItemVO> getItems(int start, int end);
	
	public void hitUp(int item_seq);
	
	public void setDeleteBidInfo(int item_seq);
}
