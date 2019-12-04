package fproject.app.fproject.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import fproject.app.fproject.dao.MyUsersDao;
import fproject.app.fproject.vo.AccountVo;


@Repository
public class UsersService {
	@Autowired
	private MyUsersDao dao;
	public void setDao(MyUsersDao dao) {
		this.dao = dao;
	}
	public AccountVo isMember(AccountVo vo) {
		return dao.isMember(vo);
	}
	public HashMap<String,Object> login(HashMap<String,Object> map){
		return dao.login(map);
}
}
