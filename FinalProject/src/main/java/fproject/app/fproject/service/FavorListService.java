package fproject.app.fproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fproject.app.fproject.dao.FavorListDao;
import fproject.app.fproject.vo.EmoWishListVo;

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
	 * @return list - <EmoWishListVo>
	 */
	public List<EmoWishListVo> getUserWishList(HashMap<String, Object> map) {
		return dao.getUserWishList(map);
	}
	
	public int delUserWishItem(Map<String, Integer> map) {
		return dao.delUserWishItem(map);
	}
}