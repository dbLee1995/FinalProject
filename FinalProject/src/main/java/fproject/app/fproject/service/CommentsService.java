package fproject.app.fproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fproject.app.fproject.dao.CommentsDao;
import fproject.app.fproject.vo.CommentsVo;




@Service
public class CommentsService {
	@Autowired private CommentsDao commentsDao;
	 public void setMembersDao(CommentsDao commentsDao){
		 this.commentsDao=commentsDao;
	 }
	 public List<CommentsVo> list(){
		 return commentsDao.list();
	 }
	 public List<CommentsVo> getNum(){
		 return commentsDao.getNum();
	 }
	 public List<CommentsVo> getReplyA(){
		 return commentsDao.getReplyA();
	 }
	 public int insert(CommentsVo vo){
		 return commentsDao.insert(vo);
	 }
	 public int update(CommentsVo vo){
		 return commentsDao.update(vo);
	 }
	 public CommentsVo infoCommNum(int commnum){
		 return commentsDao.infoCommNum(commnum);
	 }
	 public int insertReply(CommentsVo vo){
		 return commentsDao.insertReply(vo);
	 }
	 public int delete(int commnum){
		 return commentsDao.delete(commnum);
	 }
}