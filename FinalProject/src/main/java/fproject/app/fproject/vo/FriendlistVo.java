package fproject.app.fproject.vo;

import java.io.Serializable;

/**
 * 친구목록 모델 클래스.
 * 
 * @author generated by ERMaster
 * @version $Id$
 */
public class FriendlistVo implements Serializable {

	/** serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** 계정. */
	private AccountVo account;

	/** 친구번호. */
	private Integer fnum;

	/** 즐겨찾기. */
	private Integer favo;

	/** 차단여부. */
	private Integer spam;

	/** 승인여부. */
	private Integer approv;

	/**
	 * 생성자.
	 */
	public FriendlistVo() {
	}

	/**
	 * 계정을 설정합니다..
	 * 
	 * @param account
	 *            계정
	 */
	public void setAccount(AccountVo account) {
		this.account = account;
	}

	/**
	 * 계정을 가져옵니다..
	 * 
	 * @return 계정
	 */
	public AccountVo getAccount() {
		return this.account;
	}

	/**
	 * 친구번호을 설정합니다..
	 * 
	 * @param fnum
	 *            친구번호
	 */
	public void setFnum(Integer fnum) {
		this.fnum = fnum;
	}

	/**
	 * 친구번호을 가져옵니다..
	 * 
	 * @return 친구번호
	 */
	public Integer getFnum() {
		return this.fnum;
	}

	/**
	 * 즐겨찾기을 설정합니다..
	 * 
	 * @param favo
	 *            즐겨찾기
	 */
	public void setFavo(Integer favo) {
		this.favo = favo;
	}

	/**
	 * 즐겨찾기을 가져옵니다..
	 * 
	 * @return 즐겨찾기
	 */
	public Integer getFavo() {
		return this.favo;
	}

	/**
	 * 차단여부을 설정합니다..
	 * 
	 * @param spam
	 *            차단여부
	 */
	public void setSpam(Integer spam) {
		this.spam = spam;
	}

	/**
	 * 차단여부을 가져옵니다..
	 * 
	 * @return 차단여부
	 */
	public Integer getSpam() {
		return this.spam;
	}

	/**
	 * 승인여부을 설정합니다..
	 * 
	 * @param approv
	 *            승인여부
	 */
	public void setApprov(Integer approv) {
		this.approv = approv;
	}

	/**
	 * 승인여부을 가져옵니다..
	 * 
	 * @return 승인여부
	 */
	public Integer getApprov() {
		return this.approv;
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((account == null) ? 0 : account.hashCode());
		result = prime * result + ((fnum == null) ? 0 : fnum.hashCode());
		return result;
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		FriendlistVo other = (FriendlistVo) obj;
		if (account == null) {
			if (other.account != null) {
				return false;
			}
		} else if (!account.equals(other.account)) {
			return false;
		}
		if (fnum == null) {
			if (other.fnum != null) {
				return false;
			}
		} else if (!fnum.equals(other.fnum)) {
			return false;
		}
		return true;
	}

}
