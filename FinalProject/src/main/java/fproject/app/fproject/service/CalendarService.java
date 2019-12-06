package fproject.app.fproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fproject.app.fproject.dao.CalendarDao;
import fproject.app.fproject.vo.CalenderVo;

@Service
public class CalendarService {
	@Autowired
	private CalendarDao dao;
	public List<CalenderVo> list(int num){
		return dao.list(num);
	};
	public int insertTrue(CalenderVo vo){
		return dao.insertTrue(vo);
	}
	public int insertFalse(CalenderVo vo){
		return dao.insertFalse(vo);
	}
	public int updateTrue(CalenderVo vo){
		return dao.updateTrue(vo);
	}
	public int updateFalse(CalenderVo vo){
		return dao.updateFalse(vo);
	}
	public int updateDrop(CalenderVo vo){
		return dao.updateDrop(vo);
	}
	public int delete(int anivernum){
		return dao.delete(anivernum);
	}
}
