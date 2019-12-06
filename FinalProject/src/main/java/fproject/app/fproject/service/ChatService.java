package fproject.app.fproject.service;

import java.util.List;

import fproject.app.fproject.vo.AttendinfoVo;
import fproject.app.fproject.vo.ChatlistVo;

public interface ChatService {
	public ChatlistVo checkRoom(int clnum);
	public int createChatRoom(ChatlistVo vo);
	public List<ChatlistVo> getRoomList();
	public int addAttendInfo(AttendinfoVo vo);
	public AttendinfoVo getAttendInfo(int num);
	public List<AttendinfoVo> sameAttendInfo(int clnum);
	public int getAttendCount(int clnum);
	public int deleteChat(AttendinfoVo vo);
	public List<ChatlistVo> searchRoomList(String name);
}
