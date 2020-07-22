package com.example.auction.service.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.auction.model.BidderInfoVO;
import com.example.auction.repository.product.BidderInfoDAO;

@Service
public class BidderInfoServiceImpl implements BidderInfoService {
	
	@Autowired BidderInfoDAO bidderDao;

	@Override
	public int setBid(BidderInfoVO bivo) {

		return bidderDao.setBid(bivo);
	}

	@Override
	public BidderInfoVO getTopBidder(int item_seq) {

		return bidderDao.getTopBidder(item_seq);
	}

	@Override
	public int bidCntUp(int item_seq) {

		return bidderDao.bidCntUp(item_seq);
	}
}
