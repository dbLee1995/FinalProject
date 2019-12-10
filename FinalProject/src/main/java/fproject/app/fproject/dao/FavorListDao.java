package fproject.app.fproject.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import fproject.app.fproject.vo.EmoWishListVo;


@Repository
public class FavorListDao {
	private SqlSessionTemplate sqlSessionTemplate;
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	private final String NAMESPACE = "fproject.app.mybatis.mapper.EmoShopMapper";
	
	public int getCount(int userNum) {
		return sqlSessionTemplate.selectOne(NAMESPACE + ".getCount", userNum);
	}
	
	public List<EmoWishListVo> getUserWishList(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectList(NAMESPACE + ".getUserWishList", map);
	}
}
