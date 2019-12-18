package fproject.app.fproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import fproject.app.fproject.dao.MemberDao;
import fproject.app.fproject.dao.ProfilesDao;
import fproject.app.fproject.vo.AccountVo;
import fproject.app.fproject.vo.ProfilesVo;

@Repository
public class MemberService {
	@Autowired
	private MemberDao memDao;

	@Autowired
	private ProfilesDao profDao;
	/**
	 * <p>DB Account에 회원계정 저장<p>
	 * @return <b>0</b> 저장 실패<br><b>1</b> 저장 성공
	 */
	@Transactional(rollbackFor=Exception.class)
	public void resistering(String email, String id, String pwd, String name, String birthDate, String phone) throws Exception {
		AccountVo accountVo = new AccountVo(0, id, pwd);
		memDao.insert(accountVo);
		int userNum = memDao.getUserAccountInfo(accountVo.getId()).getNum();
        String phoneOne = phone.substring(0, 3);
        String phoneTwo = phone.substring(3, 7);
        String phoneThr = phone.substring(7);
        String convPhone = phoneOne + "-" + phoneTwo + "-" + phoneThr;
		ProfilesVo profilesVo = new ProfilesVo(userNum, name, convPhone, email, birthDate, null, null, null);
		profDao.insert(profilesVo);
	}

	/**
	 * <p>회원번호로 DB profiles 검색<p>
	 */
	public ProfilesVo getUserProfileInfo(int userNum) {
		return memDao.getUserProfileInfo(userNum);
	}
	
	/**
	 * <p>회원아이디로 DB Account 검색<p>
	 */
	public AccountVo getUserAccountInfo(String userId) {
		return memDao.getUserAccountInfo(userId);
	}
}