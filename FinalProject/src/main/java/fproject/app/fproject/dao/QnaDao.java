package fproject.app.fproject.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fproject.app.fproject.vo.QnaVo;


@Repository
public class QnaDao {
	@Autowired private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="fproject.app.mybatis.mapper.QnaMapper";
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	public List<QnaVo> select() {
		return sqlSessionTemplate.selectList(NAMESPACE + ".select");
	}
	public QnaVo selectInfo(int num) {
		return sqlSessionTemplate.selectOne(NAMESPACE + ".selectInfo",num);
	}
	public int insert(QnaVo vo) {
		return sqlSessionTemplate.insert(NAMESPACE + ".insert", vo);
	}
}