package fproject.app.fproject.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fproject.app.fproject.vo.EmoWishListVo;


@Repository
public class FavorListDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private final String NAMESPACE = "fproject.app.mybatis.mapper.EmoShopMapper";
	
	public int getCount(int userNum) {
		return sqlSessionTemplate.selectOne(NAMESPACE + ".getCount", userNum);
	}
	
	public List<EmoWishListVo> getUserWishList(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectList(NAMESPACE + ".getUserWishList", map);
	}
}
