package fproject.app.fproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fproject.app.fproject.dao.MemberDao;
import fproject.app.fproject.vo.AccountVo;
import fproject.app.fproject.vo.ProfilesVo;

@Repository
public class MemberService {
	@Autowired
	private MemberDao dao;
	public void setDao(MemberDao dao) {
		this.dao = dao;
	}
	/**
	 * <p>DB Account�� ȸ������ ����<p>
	 * @return <b>0</b> ���� ����<br><b>1</b> ���� ����
	 */
	public int insert(AccountVo vo) {
		return dao.insert(vo);
	}
	
	/**
	 * <p>ȸ����ȣ�� DB profiles �˻�<p>
	 */
	public ProfilesVo getUserProfileInfo(int userNum) {
		return dao.getUserProfileInfo(userNum);
	}
	
	/**
	 * <p>ȸ�����̵�� DB Account �˻�<p>
	 */
	public AccountVo getUserAccountInfo(String userId) {
		return dao.getUserAccountInfo(userId);
	}
}