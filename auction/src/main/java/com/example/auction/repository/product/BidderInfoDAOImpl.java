package com.example.auction.repository.product;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.auction.model.BidderInfoVO;

@Repository
public class BidderInfoDAOImpl implements BidderInfoDAO {	
	
	@Autowired SqlSession sql;
	
	private final static String NAMESPACE = "mappers.BidderInfoMappers";

	@Override
	public int setBid(BidderInfoVO bivo) {

		return sql.insert(NAMESPACE + ".setBid", bivo);
	}

	@Override
	public BidderInfoVO getTopBidder(int item_seq) {

		return sql.selectOne(NAMESPACE + ".getTopBidder", item_seq);
	}

	@Override
	public int bidCntUp(int item_seq) {

		return sql.update(NAMESPACE + ".bidCntUp", item_seq);
	}
}
