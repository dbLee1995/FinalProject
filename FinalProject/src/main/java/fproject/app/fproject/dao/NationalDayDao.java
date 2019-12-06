package fproject.app.fproject.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fproject.app.fproject.vo.NationaldayVo;

@Repository
public class NationalDayDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="fproject.app.mybatis.mapper.NationalDayMapper";
	
	public List<NationaldayVo> list(){
		return sqlSessionTemplate.selectList(NAMESPACE+".list");
	}
}
