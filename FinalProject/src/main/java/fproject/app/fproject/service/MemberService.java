package fproject.app.fproject.service;

import java.sql.Date;
import java.text.SimpleDateFormat;

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
	 * <p>DB Account�� ȸ������ ����<p>
	 * @return <b>0</b> ���� ����<br><b>1</b> ���� ����
	 */
	@Transactional(rollbackFor=Exception.class)
	public void resistering(String email, String id, String pwd, String name, String birthDate, String phone) throws Exception {
		AccountVo accountVo = new AccountVo(0, id, pwd);
		memDao.insert(accountVo);
		int userNum = memDao.getUserAccountInfo(accountVo.getId()).getNum();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		ProfilesVo profilesVo = new ProfilesVo(userNum, name, phone, email, format.format(birthDate), null, null, null);
		profDao.insert(profilesVo);
	}

	/**
	 * <p>ȸ����ȣ�� DB profiles �˻�<p>
	 */
	public ProfilesVo getUserProfileInfo(int userNum) {
		return memDao.getUserProfileInfo(userNum);
	}
	
	/**
	 * <p>ȸ�����̵�� DB Account �˻�<p>
	 */
	public AccountVo getUserAccountInfo(String userId) {
		return memDao.getUserAccountInfo(userId);
	}
}