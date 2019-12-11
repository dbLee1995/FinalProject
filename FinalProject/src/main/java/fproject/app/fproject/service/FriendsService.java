package fproject.app.fproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fproject.app.fproject.dao.AccountDao;
import fproject.app.fproject.dao.FriendsDao;
import fproject.app.fproject.vo.AccountVo;
import fproject.app.fproject.vo.FriendlistVo;



@Service
public class FriendsService {
	@Autowired private FriendsDao dao;
	
	public List<FriendlistVo> list(int num){
		return dao.list(num);
	}
}	
