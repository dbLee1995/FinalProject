package fproject.app.fproject.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fproject.app.fproject.vo.AccountVo;


@Repository
public class AccountDao {
	@Autowired private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="fproject.app.mybatis.mapper.AccountMapper";
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate){
		this.sqlSessionTemplate=sqlSessionTemplate;
	}
	public AccountVo info(int num){
		return sqlSessionTemplate.selectOne(NAMESPACE + ".info",num);
	}
	public List<AccountVo> list(){
		return sqlSessionTemplate.selectList(NAMESPACE + ".list");
	}
	public AccountVo ismem(AccountVo vo){
		return sqlSessionTemplate.selectOne(NAMESPACE + ".ismem",vo);
	}
	public List<HashMap<String, Object>> ismemphone(String phone){
		return sqlSessionTemplate.selectList(NAMESPACE+".ismemphone",phone);
	}
	public List<HashMap<String, Object>> getid(String email){
		return sqlSessionTemplate.selectList(NAMESPACE+".getid",email);
	}
	public List<HashMap<String, Object>> getinfo(HashMap<String, Object> map){
		return sqlSessionTemplate.selectList(NAMESPACE+".getinfo",map);
	}
	public AccountVo ismemid(String id){
		return sqlSessionTemplate.selectOne(NAMESPACE+".ismemid",id);
	}
}
