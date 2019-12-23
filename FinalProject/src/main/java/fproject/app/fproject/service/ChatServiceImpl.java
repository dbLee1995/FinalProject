package fproject.app.fproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fproject.app.fproject.dao.ChatDao;
import fproject.app.fproject.vo.AttendinfoVo;
import fproject.app.fproject.vo.ChatVo;
import fproject.app.fproject.vo.ChatlistVo;
import fproject.app.fproject.vo.ReadinfoVo;

@Service
public class ChatServiceImpl implements ChatService{
	@Autowired private ChatDao dao;
	@Override
	public ChatlistVo checkRoom(int clnum) {
		return dao.checkRoom(clnum);
	}
	@Override
	public int createChatRoom(String name) {
		return dao.createChatRoom(name);
	}
	@Override
	public List<ChatlistVo> getRoomList() {
		return dao.getRoomList();
	}
	@Override
	public int getRoomforName(String name) {
		return dao.getRoomforName(name);
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
	public int deleteRoom(AttendinfoVo vo) {
		return dao.deleteRoom(vo);
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
	@Override
	public String getLastChat(int clnum) {
		return dao.getLastChat(clnum);
	}
	@Override
	public int getLastChatNum(int clnum){
		return dao.getLastChatNum(clnum);
	}
	@Override
	public int updateAttendinfo(AttendinfoVo vo) {
		return dao.updateAttendinfo(vo);
	}
	@Override
	public int addReadInfo(ReadinfoVo vo) {
		return dao.addReadInfo(vo);
	}
	@Override
	public int getReadInfo(ReadinfoVo vo) {
		return dao.getReadInfo(vo);
	}
	@Override
	public int getCountReadInfo(int cnum) {
		return dao.getCountReadInfo(cnum);
	}
	@Override
	public int updateChatName(ChatlistVo clvo) {
		return dao.updateChatName(clvo);
	}
	@Override
	public List<ChatVo> searchChatContent(ChatVo cvo) {
		return dao.searchChatContent(cvo);
	}
	@Override
	public int getChatReadCount(ReadinfoVo rvo) {
		return dao.getChatReadCount(rvo);
	}
	@Override
	public int getChatCount(int clnum) {
		return dao.getChatCount(clnum);
	}
	@Override
	public int deleteChat(int clnum) {
		return dao.deleteChat(clnum);
	}
	@Override
	public int deleteReadInfo(int clnum) {
		return dao.deleteReadInfo(clnum);
	}
}
