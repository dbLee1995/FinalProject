package fproject.app.fproject.vo;

import java.io.Serializable;

/**
 * ?˝???Ź?? ëł? ëŞ¨ë¸ ?´??¤.
 * 
 * @author generated by ERMaster
 * @version $Id$
 */
public class NoticeVo implements Serializable {

	/** serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** ěąí. */
	private ChatVo chat;

	/** ěąíëŚŹě¤?¸. */
	private ChatlistVo chatlist;

	/** ęłě . */
	private AccountVo account;

	/**
	 * ??ą?.
	 */
	public NoticeVo() {
	}

	/**
	 * ěąí? ?¤? ?Š??¤..
	 * 
	 * @param chat
	 *            ěąí
	 */
	public void setChat(ChatVo chat) {
		this.chat = chat;
	}

	/**
	 * ěąí? ę°?? ¸?ľ??¤..
	 * 
	 * @return ěąí
	 */
	public ChatVo getChat() {
		return this.chat;
	}

	/**
	 * ěąíëŚŹě¤?¸? ?¤? ?Š??¤..
	 * 
	 * @param chatlist
	 *            ěąíëŚŹě¤?¸
	 */
	public void setChatlist(ChatlistVo chatlist) {
		this.chatlist = chatlist;
	}

	/**
	 * ěąíëŚŹě¤?¸? ę°?? ¸?ľ??¤..
	 * 
	 * @return ěąíëŚŹě¤?¸
	 */
	public ChatlistVo getChatlist() {
		return this.chatlist;
	}

	/**
	 * ęłě ? ?¤? ?Š??¤..
	 * 
	 * @param account
	 *            ęłě 
	 */
	public void setAccount(AccountVo account) {
		this.account = account;
	}

	/**
	 * ęłě ? ę°?? ¸?ľ??¤..
	 * 
	 * @return ęłě 
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
		result = prime * result + ((chat == null) ? 0 : chat.hashCode());
		result = prime * result + ((account == null) ? 0 : account.hashCode());
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
		NoticeVo other = (NoticeVo) obj;
		if (chat == null) {
			if (other.chat != null) {
				return false;
			}
		} else if (!chat.equals(other.chat)) {
			return false;
		}
		if (account == null) {
			if (other.account != null) {
				return false;
			}
		} else if (!account.equals(other.account)) {
			return false;
		}
		return true;
	}

}
