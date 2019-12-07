package fproject.app.fproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fproject.app.fproject.dao.StoryDao;
import fproject.app.fproject.vo.StoryVo;

@Service
public class StoryService {
	 @Autowired private StoryDao storyDao;
	 public void setMembersDao(StoryDao storyDao){
		 this.storyDao=storyDao;
	 }
	 public List<StoryVo> list(int num){
		 return storyDao.list(num);
	 }
	 public StoryVo info(int storynum){
		 return storyDao.info(storynum);
	 }
	 public StoryVo infonum(int num){
		 return storyDao.infonum(num);
	 }
	 public int insert(StoryVo vo){
		 return storyDao.insert(vo);
	 }
	 public int update(StoryVo vo){
		 return storyDao.update(vo);
	 }
	 public int delete(int storynum){
		 return storyDao.delete(storynum);
	 }
	 
}