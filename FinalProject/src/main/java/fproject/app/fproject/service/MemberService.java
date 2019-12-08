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
	 * <p>DB Account에 회원계정 저장<p>
	 * @return <b>0</b> 저장 실패<br><b>1</b> 저장 성공
	 */
	public int insert(AccountVo vo) {
		return dao.insert(vo);
	}
	
	/**
	 * <p>회원번호로 DB profiles 검색<p>
	 */
	public ProfilesVo getUserProfileInfo(int userNum) {
		return dao.getUserProfileInfo(userNum);
	}
	
	/**
	 * <p>회원아이디로 DB Account 검색<p>
	 */
	public AccountVo getUserAccountInfo(String userId) {
		return dao.getUserAccountInfo(userId);
	}
}