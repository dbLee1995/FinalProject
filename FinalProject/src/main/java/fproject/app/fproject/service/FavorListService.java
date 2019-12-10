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
	 * <p>ȸ����ȣ�� �޾� �ش� ȸ���� ������ �׸��� ���� �����ݴϴ�.<p>
	 * @param UserNum - ȸ����ȣ
	 */
	public int getCount(int UserNum) {
		return dao.getCount(UserNum);
	}
	
	/**
	 * <p>�ش� ȸ���� ������ �׸��� ��ȯ�մϴ�.<p>
	 * @param map - HashMap�̾�� ��
	 * @return list - <EmoWishListVo>
	 */
	public List<EmoWishListVo> getUserWishList(HashMap<String, Object> map) {
		return dao.getUserWishList(map);
	}
}