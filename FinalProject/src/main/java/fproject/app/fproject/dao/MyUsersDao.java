package fproject.app.fproject.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fproject.app.fproject.vo.AccountVo;
@Repository
public class MyUsersDao {
	@Autowired 
	private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="fproject.app.mybatis.mapper.MemberMapper";
	public MyUsersDao(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate=sqlSessionTemplate;
	}
	public HashMap<String,Object> login(HashMap<String,Object> map){
		return 
		sqlSessionTemplate.selectOne("test.mybatis.mapper.MyUsersMapper.login",map);
	}
	public AccountVo isMember(AccountVo vo) {
		return sqlSessionTemplate.selectOne(NAMESPACE+ ".isMember", vo);
	}	
}
