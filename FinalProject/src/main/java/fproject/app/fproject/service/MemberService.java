package fproject.app.fproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fproject.app.fproject.dao.MemberDao;
import fproject.app.fproject.vo.AccountVo;

@Repository
public class MemberService {
	@Autowired
	private MemberDao dao;
	public void setDao(MemberDao dao) {
		this.dao = dao;
	}
	
	public void insert(AccountVo vo) {
		dao.insert(vo);
	}
}
