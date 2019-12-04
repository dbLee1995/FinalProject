package fproject.app.fproject.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fproject.app.fproject.vo.AccountVo;
import fproject.app.fproject.vo.ProfilesVo;

@Repository
public class MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="fproject.app.mybatis.mapper.MemberMapper";
	
	public int insert(AccountVo vo) {
		return sqlSessionTemplate.insert(NAMESPACE + ".insert", vo);
	}
	
	public ProfilesVo selectOneNum(int num) {
		return sqlSessionTemplate.selectOne(NAMESPACE + ".selectOneNum", num);
	}
	
	public AccountVo selectOneId(String id) {
		return sqlSessionTemplate.selectOne(NAMESPACE + ".selectOneId", id);
	}
}
