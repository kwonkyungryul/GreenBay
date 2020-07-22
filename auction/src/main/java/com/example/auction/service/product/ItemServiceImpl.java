package com.example.auction.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.auction.model.ItemVO;
import com.example.auction.repository.product.ItemDAO;

@Service
public class ItemServiceImpl implements ItemService {

	@Autowired ItemDAO itemDao;

	@Override
	public int setItem(ItemVO ivo) {

		return itemDao.setItem(ivo);
	}

	@Override
	public List<ItemVO> getItemList(int start, int end, String searchOpt, String words) {

		return itemDao.getItemList(start, end, searchOpt, words);
	}

	@Override
	public int getItemCount(String searchOpt, String words) {

		return itemDao.getItemCount(searchOpt, words);
	}

	@Override
	public int setItemDelete(int item_seq) {

		return itemDao.setItemDelete(item_seq);
	}

	@Override
	public ItemVO getItemView(int item_seq) {

		return itemDao.getItemView(item_seq);
	}

	@Override
	public List<ItemVO> selectedItemList(String mainCate, String subCate) {

		return itemDao.selectedItemList(mainCate, subCate);
	}

	@Override
	public List<ItemVO> getItems(int start, int end) {

		return itemDao.getItems(start, end);
	}

	@Override
	public void hitUp(int item_seq) {

		itemDao.hitUp(item_seq);
	}

	@Override
	public void setDeleteBidInfo(int item_seq) {

		itemDao.setDeleteBidInfo(item_seq);
	}
}
