package fproject.app.fproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fproject.app.fproject.dao.AccountDao;
import fproject.app.fproject.vo.AccountVo;



@Service
public class AccountService {
	@Autowired private AccountDao accountDao;
	 public void setAccountDao(AccountDao accountDao){
		 this.accountDao=accountDao;
	 }
	 public AccountVo info(int num){
		 return accountDao.info(num);
	 }
	 public List<AccountVo> list(){
		 return accountDao.list();
	 }
	 public AccountVo ismem(AccountVo vo){
		 return accountDao.ismem(vo);
	 }
	 public List<HashMap<String,Object>> ismemphone(String phone){
		 return accountDao.ismemphone(phone);
	 }
	 public List<HashMap<String,Object>> getid(String email){
		 return accountDao.getid(email);
	 }
	 public List<HashMap<String,Object>> getinfo(HashMap<String, Object> map){
		 return accountDao.getinfo(map);
	 }
}	
