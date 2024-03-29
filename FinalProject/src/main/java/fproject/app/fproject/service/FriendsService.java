package fproject.app.fproject.service;

import java.util.HashMap;
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
	
	public List<HashMap<String, Object>> list(HashMap<String, Object> map){
		return dao.list(map);
	}
	public List<HashMap<String, Object>> friprofile(HashMap<String, Object> map){
		return dao.friprofile(map);
	}
	public int favo(HashMap<String, Object> map){
		return dao.favo(map);
	}
	public int unfavo(HashMap<String, Object> map){
		return dao.unfavo(map);
	}
	public List<HashMap<String, Object>> searchId(HashMap<String, Object> map){
		return dao.searchId(map);
	}
	public List<HashMap<String, Object>> mempro(int num){
		return dao.mempro(num);
	}
	public int addfri(FriendlistVo vo){
		return dao.addfri(vo);
	}
	public int setnewfri(){
		return dao.setnewfri();
	}
	public List<HashMap<String, Object>> favorfri(int num){
		return dao.favorfri(num);
	}
}	
