package fproject.app.fproject.service;

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
}	
