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
		System.out.println(vo.getEmoimgsize());
		System.out.println(vo.getEmoorgimg());
		System.out.println(vo.getEmosaveimg());
		System.out.println(vo.getEmognum());
		System.out.println(vo.getEmonum());
		return sqlSessionTemplate.insert(NAMESPACE + ".emoticonInsert", vo);
	}
	
	public int insertEmoticonGroup(EmoshopVo vo) {
		System.out.println(vo.getCategory());
		System.out.println(vo.getName());
		System.out.println(vo.getPrice());
		return sqlSessionTemplate.insert(NAMESPACE + ".emoticonShopInsert", vo);
	}
	
	public int selectOneEmognum(String name) {
		return sqlSessionTemplate.selectOne(NAMESPACE + ".selectOneEmognum", name);
	}
}