package fproject.app.fproject.vo;

import java.io.Serializable;

/**
 * 공지 모델 클래스.
 * 
 * @author generated by ERMaster
 * @version $Id$
 */
public class ChatnoticeVo implements Serializable {

	/** serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** 공지번호. */
	private Integer noticenum;

	/** 공지. */
	private String notice;

	/** 채팅리스트. */
	private ChatlistVo chatlist;

	/** 계정. */
	private AccountVo account;

	/**
	 * 생성자.
	 */
	public ChatnoticeVo() {
	}

	/**
	 * 공지번호을 설정합니다..
	 * 
	 * @param noticenum
	 *            공지번호
	 */
	public void setNoticenum(Integer noticenum) {
		this.noticenum = noticenum;
	}

	/**
	 * 공지번호을 가져옵니다..
	 * 
	 * @return 공지번호
	 */
	public Integer getNoticenum() {
		return this.noticenum;
	}

	/**
	 * 공지을 설정합니다..
	 * 
	 * @param notice
	 *            공지
	 */
	public void setNotice(String notice) {
		this.notice = notice;
	}

	/**
	 * 공지을 가져옵니다..
	 * 
	 * @return 공지
	 */
	public String getNotice() {
		return this.notice;
	}

	/**
	 * 채팅리스트을 설정합니다..
	 * 
	 * @param chatlist
	 *            채팅리스트
	 */
	public void setChatlist(ChatlistVo chatlist) {
		this.chatlist = chatlist;
	}

	/**
	 * 채팅리스트을 가져옵니다..
	 * 
	 * @return 채팅리스트
	 */
	public ChatlistVo getChatlist() {
		return this.chatlist;
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
	 * {@inheritDoc}
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((noticenum == null) ? 0 : noticenum.hashCode());
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
		ChatnoticeVo other = (ChatnoticeVo) obj;
		if (noticenum == null) {
			if (other.noticenum != null) {
				return false;
			}
		} else if (!noticenum.equals(other.noticenum)) {
			return false;
		}
		return true;
	}

}
