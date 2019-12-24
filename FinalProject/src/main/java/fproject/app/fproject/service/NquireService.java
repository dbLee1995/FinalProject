package fproject.app.fproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fproject.app.fproject.dao.NquireDao;
import fproject.app.fproject.vo.QnaVo;

@Service
public class NquireService {
	@Autowired private NquireDao nquireDao;
	 public void setProfilesDao(NquireDao nquireDao){
		 this.nquireDao=nquireDao;
	 }
	 public List<QnaVo> select(){
		return nquireDao.select();
	 }
	 public QnaVo selectInfo(int num){
		 return nquireDao.selectInfo(num);
	 }
	 public int insert(QnaVo vo){
		 return nquireDao.insert(vo);
	 }
}