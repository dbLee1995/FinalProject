package fproject.app.fproject.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EmogroupDao {
	@Autowired private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="fproject.app.mybatis.mapper.EmoticonGroupMapper";
	
	public List<HashMap<String, Object>> getmyemo(int num){
		return sqlSessionTemplate.selectList(NAMESPACE+".myemoji",num);
	}
	public List<HashMap<String, Object>> getmyemogro(int num){
		return sqlSessionTemplate.selectList(NAMESPACE+".myemogro",num);
	}
}
