package fproject.app.fproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fproject.app.fproject.dao.ChatDao;
import fproject.app.fproject.vo.AttendinfoVo;
import fproject.app.fproject.vo.ChatVo;
import fproject.app.fproject.vo.ChatlistVo;

@Service
public class ChatServiceImpl implements ChatService{
	@Autowired private ChatDao dao;
	@Override
	public ChatlistVo checkRoom(int clnum) {
		return dao.checkRoom(clnum);
	}
	@Override
	public int createChatRoom(ChatlistVo vo) {
		return dao.createChatRoom(vo);
	}
	@Override
	public List<ChatlistVo> getRoomList() {
		return dao.getRoomList();
	}
	@Override
	public int addAttendInfo(AttendinfoVo vo) {
		return dao.addAttendInfo(vo);
	}
	@Override
	public List<AttendinfoVo> getAttendInfo(int num) {
		return dao.getAttendInfo(num);
	}
	@Override
	public List<AttendinfoVo> getAttendInfotoclnum(int clnum) {
		return dao.getAttendInfotoclnum(clnum);
	}
	@Override
	public List<AttendinfoVo> sameAttendInfo(int clnum) {
		return dao.sameAttendInfo(clnum);
	}
	@Override
	public int getAttendCount(int clnum) {
		return dao.getAttendCount(clnum);
	}
	@Override
	public int deleteChat(AttendinfoVo vo) {
		return dao.deleteChat(vo);
	}
	@Override
	public List<ChatlistVo> searchRoomList(String name) {
		return dao.searchRoomList(name);
	}
	@Override
	public int addChat(ChatVo cvo) {
		return dao.addChat(cvo);
	}
	@Override
	public List<ChatVo> getChat(int clnum) {
		return dao.getChat(clnum);
	}
	@Override
	public List<ChatVo> getChattime(int clnum) {
		return dao.getChattime(clnum);
	}
}
