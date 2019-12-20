package fproject.app.fproject.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fproject.app.fproject.vo.FriendlistVo;



@Repository
public class FriendsDao {
	@Autowired private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="fproject.app.mybatis.mapper.FriendsMapper";
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate){
		this.sqlSessionTemplate=sqlSessionTemplate;
	}
	public List<HashMap<String, Object>> list(HashMap<String, Object> map){
		return sqlSessionTemplate.selectList(NAMESPACE + ".list",map);
	}
	public List<HashMap<String, Object>> friprofile(HashMap<String, Object> map){
		return sqlSessionTemplate.selectList(NAMESPACE + ".friprofile",map);
	}
	public int favo(HashMap<String, Object> map){
		return sqlSessionTemplate.update(NAMESPACE + ".favo",map);
	}
	public int unfavo(HashMap<String, Object> map){
		return sqlSessionTemplate.update(NAMESPACE + ".unfavo",map);
	}
	public List<HashMap<String, Object>> searchId(HashMap<String, Object> map){
		return sqlSessionTemplate.selectList(NAMESPACE + ".searchId",map);
	}
	public List<HashMap<String , Object>> mempro(int num){
		return sqlSessionTemplate.selectList(NAMESPACE+".mempro",num);
	}
	public int addfri(FriendlistVo vo){
		return sqlSessionTemplate.insert(NAMESPACE+".addfri",vo);
	}
}
