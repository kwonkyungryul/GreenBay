package com.example.auction.service.category;

import java.util.List;

import com.example.auction.model.MainCateVO;

public interface MainCateService {
	
	public int setMainCate(MainCateVO mcvo);
	
	public List<MainCateVO> getMainCateList();
	
	public int getMainCateCountOne(String mainCode);
	
	public int getMainCateCountAll();
	
	public void setDeleteMainCate(String mainName);
}
