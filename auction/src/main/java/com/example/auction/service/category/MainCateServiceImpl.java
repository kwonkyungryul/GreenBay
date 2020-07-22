package com.example.auction.service.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.auction.model.MainCateVO;
import com.example.auction.repository.category.MainCateDAO;

@Service
public class MainCateServiceImpl implements MainCateService {

	@Autowired MainCateDAO mainDao;

	@Override
	public int setMainCate(MainCateVO mcvo) {

		return mainDao.setMainCate(mcvo);
	}

	@Override
	public List<MainCateVO> getMainCateList() {

		return mainDao.getMainCateList();
	}

	@Override
	public void setDeleteMainCate(String mainName) {

		mainDao.setDeleteMainCate(mainName);
	}

	@Override
	public int getMainCateCountOne(String mainCode) {

		return mainDao.getMainCateCountOne(mainCode);
	}

	@Override
	public int getMainCateCountAll() {

		return mainDao.getMainCateCountAll();
	}
}
