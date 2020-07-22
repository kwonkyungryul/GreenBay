package com.example.auction.repository.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.auction.model.ItemVO;

@Repository
public class ItemDAOImpl implements ItemDAO {

	@Autowired SqlSession sql;
	
	private final static String NAMESPACE = "mappers.ItemMappers";

	@Override
	public int setItem(ItemVO ivo) {

		return sql.insert(NAMESPACE + ".setItem", ivo);
	}

	@Override
	public List<ItemVO> getItemList(int start, int end, String searchOpt, String words) {

		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("start", start);
		map.put("end", end);
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		
		return sql.selectList(NAMESPACE + ".getItemList", map);
	}

	@Override
	public int getItemCount(String searchOpt, String words) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		
		return sql.selectOne(NAMESPACE + ".getItemCount", map);
	}

	@Override
	public int setItemDelete(int item_seq) {

		return sql.delete(NAMESPACE + ".setItemDelete", item_seq);
	}

	@Override
	public ItemVO getItemView(int item_seq) {

		return sql.selectOne(NAMESPACE + ".getItemView", item_seq);
	}

	@Override
	public List<ItemVO> selectedItemList(String mainCate, String subCate) {

		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("mainCate", mainCate);
		map.put("subCate", subCate);
		
		return sql.selectList(NAMESPACE + ".selectedItemList", map);
	}

	@Override
	public List<ItemVO> getItems(int start, int end) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("start", start);
		map.put("end", end);
		return sql.selectList(NAMESPACE + ".getItems", map);
	}

	@Override
	public void hitUp(int item_seq) {

		sql.update(NAMESPACE + ".hitUp", item_seq);
	}

	@Override
	public void setDeleteBidInfo(int item_seq) {
		String str = "";
		str += "DELETE FROM";
		str += "bidderInfo";
		str += "WHERE";
		str += "item_seq="+item_seq;

		sql.delete(NAMESPACE + ".setDeleteBidInfo", str);
	}
}
