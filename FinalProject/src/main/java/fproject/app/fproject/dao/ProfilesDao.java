package fproject.app.fproject.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fproject.app.fproject.vo.ProfilesVo;


@Repository
public class ProfilesDao {
	@Autowired private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="fproject.app.mybatis.mapper.ProfilesMapper";
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	public ProfilesVo info(int num) {
		return sqlSessionTemplate.selectOne(NAMESPACE + ".info",num);
	}	
	public int insert(ProfilesVo vo) {
		return sqlSessionTemplate.insert(NAMESPACE + ".insert", vo);
	}
	public int updateProfImg(ProfilesVo vo){
		return sqlSessionTemplate.update(NAMESPACE + ".updateProfImg",vo);
	}
	public int updateName(ProfilesVo vo){
		return sqlSessionTemplate.update(NAMESPACE + ".updateName",vo);
	}
	public int update(ProfilesVo vo){
		return sqlSessionTemplate.update(NAMESPACE + ".update",vo);
	}
	public int updateBackimg(ProfilesVo vo){
		return sqlSessionTemplate.update(NAMESPACE + ".updateBackimg",vo);
	}
}