package com.example.auction.service.category;

import java.util.List;

import com.example.auction.model.SubCateVO;

public interface SubCateService {

	public int setSubCate(SubCateVO svo);
	
	public List<SubCateVO> getSubCateList();
	
	public void setDeleteSubCate(SubCateVO svo);
	
	public List<SubCateVO> selectedSubCateList(String mainName);
	
	public int getSubCateCountOne(SubCateVO svo);
}
