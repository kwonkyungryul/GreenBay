package com.example.auction.service.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.auction.model.SubCateVO;
import com.example.auction.repository.category.SubCateDAO;

@Service
public class SubCateServiceImpl implements SubCateService {

	@Autowired SubCateDAO subDao;

	@Override
	public int setSubCate(SubCateVO svo) {

		return subDao.setSubCate(svo);
	}

	@Override
	public List<SubCateVO> getSubCateList() {

		return subDao.getSubCateList();
	}

	@Override
	public void setDeleteSubCate(SubCateVO svo) {

		subDao.setDeleteSubCate(svo);
	}

	@Override
	public List<SubCateVO> selectedSubCateList(String mainName) {

		return subDao.selectedSubCateList(mainName);
	}

	@Override
	public int getSubCateCountOne(SubCateVO svo) {

		return subDao.getSubCateCountOne(svo);
	}
	
}
