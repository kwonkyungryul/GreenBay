package com.example.auction.repository.product;

import com.example.auction.model.BidderInfoVO;

public interface BidderInfoDAO {
	
	public int setBid(BidderInfoVO bivo);
	
	public BidderInfoVO getTopBidder(int item_seq);
	
	public int bidCntUp(int item_seq);
}
