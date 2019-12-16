package fproject.app.fproject.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fproject.app.fproject.vo.EmoWishListVo;
import fproject.app.fproject.vo.EmoshopVo;
import fproject.app.fproject.vo.FavorlistVo;


@Repository
public class FavorListDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private final String EmoShopMapper = "fproject.app.mybatis.mapper.EmoShopMapper";
	
	public int getCount(int userNum) {
		return sqlSessionTemplate.selectOne(EmoShopMapper + ".getCount", userNum);
	}
	
	public List<EmoWishListVo> getUserWishListPaging(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectList(EmoShopMapper + ".getUserWishListPaging", map);
	}
	
	public int delUserWishItem(Map<String, Integer> map) {
		return sqlSessionTemplate.delete(EmoShopMapper + ".delUserWishItem", map);
	}
	
	public List<EmoshopVo> getUserWishList(int userNum) {
		return sqlSessionTemplate.selectList(EmoShopMapper + ".getUserWishList", userNum);
	}
	
	public int insertUserWishList(FavorlistVo vo) {
		return sqlSessionTemplate.insert(EmoShopMapper + ".insertUserWishList", vo);
	}
}
