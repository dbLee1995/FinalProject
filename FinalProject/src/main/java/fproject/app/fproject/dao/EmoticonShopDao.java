package fproject.app.fproject.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fproject.app.fproject.vo.EmoshopVo;
import fproject.app.fproject.vo.EmoticonVo;

@Repository
public class EmoticonShopDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	private final String NAMESPACE = "fproject.app.mybatis.mapper.EmoticonShopMapper";
	
	public int insertEmoticonFile(EmoticonVo vo) {
		return sqlSessionTemplate.insert(NAMESPACE + ".emoticonInsert", vo);
	}
	
	public int insertEmoticonGroup(EmoshopVo vo) {
		return sqlSessionTemplate.insert(NAMESPACE + ".emoticonShopInsert", vo);
	}
	
	public int selectOneEmognum(String name) {
		return sqlSessionTemplate.selectOne(NAMESPACE + ".selectOneEmognum", name);
	}
}