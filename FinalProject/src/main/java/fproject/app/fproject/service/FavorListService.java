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
	 * <p>ȸ����ȣ�� �޾� �ش� ȸ���� ������ �׸��� ���� �����ݴϴ�.<p>
	 * @param UserNum - ȸ����ȣ
	 */
	public int getCount(int userNum) {
		return dao.getCount(userNum);
	}
	
	/**
	 * <p>�ش� ȸ���� ������ �׸��� ��ȯ�մϴ�.<p>
	 * @param map - HashMap�̾�� ��
	 * @return List<code>(EmoWishListVo)<code> - �������
	 */
	public List<EmoWishListVo> getUserWishListPaging(HashMap<String, Object> map) {
		return dao.getUserWishListPaging(map);
	}
	
	/**
	 * <p>������ �׸� �ϳ��� DB���� �����մϴ�.
	 * @param map - "userNum":ȸ����ȣ, "emogNum":�̸�Ƽ�ܹ�ȣ 
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