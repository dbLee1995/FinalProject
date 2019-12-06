package fproject.app.fproject.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fproject.app.fproject.vo.StoryVo;

@Repository
public class StoryDao {
	@Autowired private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="fproject.app.mybatis.mapper.StoryMapper";
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate){
		this.sqlSessionTemplate=sqlSessionTemplate;
	}
	
//	public HashMap<String,StoryVo> list(int num){
//		return sqlSessionTemplate.selectList(NAMESPACE + ".list",num);
//	}
	public List<StoryVo> list(int num){
		return sqlSessionTemplate.selectList(NAMESPACE + ".list",num);
	}
	public StoryVo info(int storynum){
		return sqlSessionTemplate.selectOne(NAMESPACE + ".info",storynum);
	}	
	public int insert(StoryVo vo){
		return sqlSessionTemplate.insert(NAMESPACE + ".insert",vo);
	}
	public int update(StoryVo vo){
		return sqlSessionTemplate.update(NAMESPACE + ".update",vo);
	}
	public int delete(int storynum){
		return sqlSessionTemplate.delete(NAMESPACE + ".delete",storynum);
	}	
}