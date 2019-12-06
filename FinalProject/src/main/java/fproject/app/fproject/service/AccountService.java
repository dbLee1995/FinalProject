package fproject.app.fproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fproject.app.fproject.dao.AccountDao;
import fproject.app.fproject.vo.AccountVo;



@Service
public class AccountService {
	@Autowired private AccountDao accountDao;
	 public void setMembersDao(AccountDao accountDao){
		 this.accountDao=accountDao;
	 }
	 public AccountVo info(int num){
		 return accountDao.info(num);
	 }
}	
