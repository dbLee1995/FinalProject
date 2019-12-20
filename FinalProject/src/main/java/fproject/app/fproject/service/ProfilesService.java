package fproject.app.fproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fproject.app.fproject.dao.ProfilesDao;
import fproject.app.fproject.vo.ProfilesVo;

@Service
public class ProfilesService {
	@Autowired private ProfilesDao profilesDao;
	 public void setProfilesDao(ProfilesDao profilesDao){
		 this.profilesDao=profilesDao;
	 }
	 public ProfilesVo info(int num){
		 return profilesDao.info(num);
	 }
	 public int updateBackimg(ProfilesVo vo){
		 return profilesDao.updateBackimg(vo);
	 }
	 public int updateBirth(ProfilesVo vo){
		 return profilesDao.updateBirth(vo);
	 }
}