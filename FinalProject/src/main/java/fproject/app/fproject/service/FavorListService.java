package fproject.app.fproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fproject.app.fproject.dao.FavorListDao;
import fproject.app.fproject.vo.EmoWishListVo;
import fproject.app.fproject.vo.EmoshopVo;
import fproject.app.fproject.vo.FavorlistVo;

@Repository
public class FavorListService {
	@Autowired
	private FavorListDao dao;

	/**
	 * <p>회원번호를 받아 해당 회원이 보관한 항목의 수를 돌려줍니다.<p>
	 * @param UserNum - 회원번호
	 */
	public int getCount(int userNum) {
		return dao.getCount(userNum);
	}
	
	/**
	 * <p>해당 회원이 보관한 항목을 반환합니다.<p>
	 * @param map - HashMap이어야 함
	 * @return List<code>(EmoWishListVo)<code> - 보관목록
	 */
	public List<EmoWishListVo> getUserWishListPaging(HashMap<String, Object> map) {
		return dao.getUserWishListPaging(map);
	}
	
	/**
	 * <p>보관한 항목 하나를 DB에서 삭제합니다.
	 * @param map - "userNum":회원번호, "emogNum":이모티콘번호 
	 */
	public int delUserWishItem(Map<String, Integer> map) {
		return dao.delUserWishItem(map);
	}
	
	public List<EmoshopVo> getUserWishList(int userNum) {
		return dao.getUserWishList(userNum);
	}
	
	public int addUserWishList(FavorlistVo vo) {
		return dao.insertUserWishList(vo);
	}
}