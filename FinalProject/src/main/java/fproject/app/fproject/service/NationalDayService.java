package fproject.app.fproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fproject.app.fproject.dao.NationalDayDao;
import fproject.app.fproject.vo.NationaldayVo;

@Service
public class NationalDayService {
	@Autowired
	private NationalDayDao dao;
	public List<NationaldayVo> list(){
		return dao.list();
	}
}
