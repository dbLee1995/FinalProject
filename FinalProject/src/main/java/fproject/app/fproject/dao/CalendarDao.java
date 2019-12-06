package fproject.app.fproject.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fproject.app.fproject.vo.CalenderVo;
import fproject.app.fproject.vo.NationaldayVo;

@Repository
public class CalendarDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="fproject.app.mybatis.mapper.CalendarMapper";
	
	public List<CalenderVo> list(int num){
		return sqlSessionTemplate.selectList(NAMESPACE+".list",num);
	}
	public int insertTrue(CalenderVo vo){
		return sqlSessionTemplate.insert(NAMESPACE+".insertTrue",vo);
	}
	public int insertFalse(CalenderVo vo){
		return sqlSessionTemplate.insert(NAMESPACE+".insertFalse",vo);
	}
	public int updateTrue(CalenderVo vo){
		return sqlSessionTemplate.update(NAMESPACE+".updateTrue",vo);
	}
	public int updateFalse(CalenderVo vo){
		return sqlSessionTemplate.update(NAMESPACE+".updateFalse",vo);
	}
	public int updateDrop(CalenderVo vo){
		return sqlSessionTemplate.update(NAMESPACE+".updateDrop",vo);
	}
	public int delete(int anivernum){
		return sqlSessionTemplate.delete(NAMESPACE+".delete",anivernum);
	}
}
