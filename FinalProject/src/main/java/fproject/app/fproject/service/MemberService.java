package fproject.app.fproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fproject.app.fproject.dao.MemberDao;
import fproject.app.fproject.vo.AccountVo;
import fproject.app.fproject.vo.ProfilesVo;

@Repository
public class MemberService {
	@Autowired
	private MemberDao dao;
	public void setDao(MemberDao dao) {
		this.dao = dao;
	}
	
	public int insert(AccountVo vo) {
		return dao.insert(vo);
	}
	
	public ProfilesVo selectOneNum(int num) {
		return dao.selectOneNum(num);
	}
	
	public AccountVo selectOneId(String id) {
		return dao.selectOneId(id);
	}
}
