package fproject.app.fproject.dao;

import java.util.List;

import fproject.app.fproject.vo.AttendinfoVo;
import fproject.app.fproject.vo.ChatVo;
import fproject.app.fproject.vo.ChatlistVo;

public interface ChatDao {
	public ChatlistVo checkRoom(int clnum);
	public int createChatRoom(ChatlistVo vo);
	public List<ChatlistVo> getRoomList();
	public int addAttendInfo(AttendinfoVo vo);
	public List<AttendinfoVo> getAttendInfo(int num);
	public List<AttendinfoVo> getAttendInfotoclnum(int clnum);
	public List<AttendinfoVo> sameAttendInfo(int clnum);
	public int getAttendCount(int clnum);
	public int deleteChat(AttendinfoVo vo);
	public List<ChatlistVo> searchRoomList(String name);
	public int addChat(ChatVo cvo);
	public List<ChatVo> getChat(int clnum);
}
