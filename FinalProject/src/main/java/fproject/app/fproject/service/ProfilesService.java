package fproject.app.fproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fproject.app.fproject.dao.ProfilesDao;
import fproject.app.fproject.vo.ProfilesVo;
import fproject.app.fproject.vo.QnaVo;

@Service
public class ProfilesService {
	@Autowired private ProfilesDao profilesDao;
	 public void setProfilesDao(ProfilesDao profilesDao){
		 this.profilesDao=profilesDao;
	 }
	 public List<ProfilesVo> select(){
		 return profilesDao.select();
	 }
	 public List<ProfilesVo> selectName(){
		 return profilesDao.selectName();
	 }
	 public List<ProfilesVo> selectQnaName(){
			return profilesDao.selectQnaName();
	 }
	 public ProfilesVo info(int num){
		 return profilesDao.info(num);
	 }
	 public ProfilesVo selectProfName(int qnanum){
		 return profilesDao.selectProfName(qnanum);
	 }
	 public ProfilesVo selectProfImg(String name){
		 return profilesDao.selectProfImg(name);
	 }
	 public int updateBackimg(ProfilesVo vo){
		 return profilesDao.updateBackimg(vo);
	 }
	 public int updateName(ProfilesVo vo){
		 return profilesDao.updateName(vo);
	 }
	 public int updateMsg(ProfilesVo vo){
		 return profilesDao.updateMsg(vo);
	 }
	 public int update(ProfilesVo vo){
		 return profilesDao.update(vo);
	 }
	 public int updateProfImg(ProfilesVo vo){
		 return profilesDao.updateProfImg(vo);
	 }
}