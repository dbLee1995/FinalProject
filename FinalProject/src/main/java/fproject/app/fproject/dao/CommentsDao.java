package fproject.app.fproject.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fproject.app.fproject.vo.CommentsVo;


@Repository
public class CommentsDao {
	@Autowired private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="fproject.app.mybatis.mapper.CommentsMapper";
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate){
		this.sqlSessionTemplate=sqlSessionTemplate;
	}
	
	public List<CommentsVo> list(){
		return sqlSessionTemplate.selectList(NAMESPACE + ".list");
	}
	public int insert(CommentsVo vo){
		return sqlSessionTemplate.insert(NAMESPACE + ".insert",vo);
	}
	public int update(CommentsVo vo){
		return sqlSessionTemplate.update(NAMESPACE + ".update",vo);
	}
	public int insertReply(CommentsVo vo){
		return sqlSessionTemplate.insert(NAMESPACE + ".insertReply",vo);
	}
	public int delete(int commnum){
		return sqlSessionTemplate.delete(NAMESPACE + ".delete",commnum);
	}
}