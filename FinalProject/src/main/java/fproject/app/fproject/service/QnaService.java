package fproject.app.fproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fproject.app.fproject.dao.QnaDao;
import fproject.app.fproject.vo.QnaVo;

@Service
public class QnaService {
	@Autowired private QnaDao qnaDao;
	 public void setProfilesDao(QnaDao qnaDao){
		 this.qnaDao=qnaDao;
	 }
	 public List<QnaVo> select(){
		return qnaDao.select();
	 }	 
	 public QnaVo selectInfo(int qnanum){
		 return qnaDao.selectInfo(qnanum);
	 }
	 public int insert(QnaVo vo){
		 return qnaDao.insert(vo);
	 }
	 public int update(QnaVo vo){
		 return qnaDao.update(vo);
	 }
}