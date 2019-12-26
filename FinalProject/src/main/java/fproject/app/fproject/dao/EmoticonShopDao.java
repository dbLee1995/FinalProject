package fproject.app.fproject.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fproject.app.fproject.vo.EmoshopVo;
import fproject.app.fproject.vo.EmoticonVo;
import fproject.app.fproject.vo.EmoticongroupVo;
import fproject.app.fproject.vo.PurchaseVo;

@Repository
public class EmoticonShopDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	private final String EmoticonShopMapper = "fproject.app.mybatis.mapper.EmoShopMapper";
	private final String PurchaseMapper = "fproject.app.mybatis.mapper.PurchaseMapper";
	private final String EmoticonGroupMapper = "fproject.app.mybatis.mapper.EmoticonGroupMapper";
	
	public int insertEmoticonFile(EmoticonVo vo) {
		return sqlSessionTemplate.insert(EmoticonShopMapper + ".emoticonInsert", vo);
	}
	
	public int insertEmoticonShop(EmoshopVo vo) {
		return sqlSessionTemplate.insert(EmoticonShopMapper + ".emoticonShopInsert", vo);
	}
	
	public int selectOneEmognum(String name) {
		return sqlSessionTemplate.selectOne(EmoticonShopMapper + ".selectOneEmognum", name);
	}
	
	public EmoshopVo selectOneEmogInfo(int emognum) {
		return sqlSessionTemplate.selectOne(EmoticonShopMapper + ".selectOneEmogInfo", emognum);
	}
	
	public int insertPurchase(PurchaseVo vo) {
		return sqlSessionTemplate.insert(PurchaseMapper + ".insert", vo);
	}
	
	public int insertEmoticonGroup(EmoticongroupVo vo) {
		return sqlSessionTemplate.insert(EmoticonGroupMapper + ".insert", vo);
	}
	
	public List<EmoshopVo> selectNewEmoList() {
		return sqlSessionTemplate.selectList(EmoticonShopMapper + ".selectNewEmoList");
	}
	
	public List<EmoticongroupVo> selectPopulEmoList() {
		return sqlSessionTemplate.selectList(PurchaseMapper + ".selectPopulEmoList");
	}
	
	public List<EmoshopVo> selectCatogoryEmoList(String emoCategory) {
		return sqlSessionTemplate.selectList(EmoticonShopMapper + ".selectCatogoryEmoList", emoCategory);
	}
	
	public List<EmoticonVo> selectEmoticonList(int emognum) {
		return sqlSessionTemplate.selectList(EmoticonShopMapper + ".selectEmoticonList", emognum);
	}
	
	public int selectNewEmoticonTotalCount() {
		return sqlSessionTemplate.selectOne(EmoticonShopMapper + ".selectNewEmoticonTotalCount");
	}
	
	public List<EmoshopVo> selectNewEmoticonPagingList(HashMap<String, Integer> map) {
		return sqlSessionTemplate.selectList(EmoticonShopMapper + ".selectNewEmoticonPagingList", map);
	}
	
	public List<EmoticongroupVo> selectUserEmoList(int userNum) {
		return sqlSessionTemplate.selectList(EmoticonShopMapper + ".selectUserEmoList", userNum);
	}
	
	public int selectPopulEmoListTotalCount() {
		return sqlSessionTemplate.selectOne(EmoticonShopMapper + ".selectPopulEmoListTotalCount");
	}
	
	public List<EmoticongroupVo> selectPopulEmoPagingList(HashMap<String, Integer> map) {
		return sqlSessionTemplate.selectList(PurchaseMapper + ".selectPopulEmoPagingList", map);
	}
}