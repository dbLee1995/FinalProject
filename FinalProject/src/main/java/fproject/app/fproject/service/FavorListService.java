package fproject.app.fproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import fproject.app.fproject.dao.FavorListDao;
import fproject.app.fproject.vo.EmoWishListVo;

@Repository
public class FavorListService {
	private FavorListDao dao;
	public void setDao(FavorListDao dao) {
		this.dao = dao;
	}
	
	
	/**
	 * <p>회원번호를 받아 해당 회원이 보관한 항목의 수를 돌려줍니다.<p>
	 * @param UserNum - 회원번호
	 */
	public int getCount(int UserNum) {
		return dao.getCount(UserNum);
	}
	
	/**
	 * <p>해당 회원이 보관한 항목을 반환합니다.<p>
	 * @param map - HashMap이어야 함
	 * @return list - <EmoWishListVo>
	 */
	public List<EmoWishListVo> getUserWishList(HashMap<String, Object> map) {
		return dao.getUserWishList(map);
	}
}