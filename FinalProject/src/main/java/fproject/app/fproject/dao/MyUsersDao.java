package fproject.app.fproject.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fproject.app.fproject.vo.AccountVo;
import fproject.app.fproject.vo.ProfilesVo;
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
	public String find_id(String email) throws Exception{
		return sqlSessionTemplate.selectOne("fproject.app.mybatis.mapper.MemberMapper.find_id", email);
	}
	public int update_pwd(AccountVo vo) throws Exception{
		return sqlSessionTemplate.update(NAMESPACE+ ".update_pwd",vo);						
	}
	public ProfilesVo check_id(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectOne(NAMESPACE+ ".check_id", map);	
	}
	public int update_pwdOK(HashMap<String, String> map) {
		return sqlSessionTemplate.update(NAMESPACE+ ".update_pwdOK", map);	
	}
}
