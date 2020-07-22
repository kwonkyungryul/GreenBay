package com.example.auction.repository.category;

import java.util.List;

import com.example.auction.model.MainCateVO;

public interface MainCateDAO {
	
	public int setMainCate(MainCateVO mcvo);
	
	public List<MainCateVO> getMainCateList();
	
	public int getMainCateCountOne(String mainCode);
	
	public int getMainCateCountAll();

	public void setDeleteMainCate(String mainName);
}
