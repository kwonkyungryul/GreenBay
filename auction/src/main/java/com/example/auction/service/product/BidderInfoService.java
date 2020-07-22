package com.example.auction.service.product;

import com.example.auction.model.BidderInfoVO;

public interface BidderInfoService {

	public int setBid(BidderInfoVO bivo);
	
	public BidderInfoVO getTopBidder(int item_seq);
	
	public int bidCntUp(int item_seq);
}
