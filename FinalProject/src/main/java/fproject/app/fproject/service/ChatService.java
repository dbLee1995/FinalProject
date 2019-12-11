package fproject.app.fproject.service;

import java.util.List;

import fproject.app.fproject.vo.AttendinfoVo;
import fproject.app.fproject.vo.ChatVo;
import fproject.app.fproject.vo.ChatlistVo;
import fproject.app.fproject.vo.ReadinfoVo;

public interface ChatService {
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
	public List<ChatVo> getChattime(int clnum);
	public String getLastChat(int clnum);
	public int updateAttendinfo(AttendinfoVo vo);
	public int addReadInfo(ReadinfoVo vo);
	public int getReadInfo(ReadinfoVo vo);
	public int getCountReadInfo(int cnum);
}
