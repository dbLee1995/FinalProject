package fproject.app.fproject.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fproject.app.fproject.vo.AttendinfoVo;
import fproject.app.fproject.vo.ChatVo;
import fproject.app.fproject.vo.ChatlistVo;

@Repository
public class ChatDaoImpl implements ChatDao{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="fproject.app.mybatis.mapper.WebsocketMapper";
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate){
		this.sqlSessionTemplate=sqlSessionTemplate;
	}
	@Override
	public ChatlistVo checkRoom(int clnum){
		return sqlSessionTemplate.selectOne(NAMESPACE+".getRoom", clnum);
	}
	@Override
	public int createChatRoom(ChatlistVo vo) {
		return sqlSessionTemplate.insert(NAMESPACE+".createChatRoom", vo);
	}
	@Override
	public List<ChatlistVo> getRoomList() {
		return sqlSessionTemplate.selectList(NAMESPACE+".getRoomList");
	}
	@Override
	public int addAttendInfo(AttendinfoVo vo) {
		return sqlSessionTemplate.insert(NAMESPACE+".addAttendInfo", vo);
	}
	@Override
	public List<AttendinfoVo> getAttendInfo(int num) {
		return sqlSessionTemplate.selectList(NAMESPACE+".getAttendInfo", num);
	}
	@Override
	public List<AttendinfoVo> getAttendInfotoclnum(int clnum) {
		return sqlSessionTemplate.selectList(NAMESPACE+".getAttendInfotoclnum", clnum);
	}
	@Override
	public List<AttendinfoVo> sameAttendInfo(int clnum) {
		return sqlSessionTemplate.selectList(NAMESPACE+".sameAttendInfo", clnum);
	}
	@Override
	public int getAttendCount(int clnum) {
		return sqlSessionTemplate.selectOne(NAMESPACE+".getAttendCount", clnum);
	}
	@Override
	public int deleteChat(AttendinfoVo vo) {
		return sqlSessionTemplate.delete(NAMESPACE+".deleteRoom", vo);
	}
	@Override
	public List<ChatlistVo> searchRoomList(String name) {
		return sqlSessionTemplate.selectList(NAMESPACE+".searchRoomList", name);
	}
	@Override
	public int addChat(ChatVo cvo) {
		return sqlSessionTemplate.insert(NAMESPACE+".addChat", cvo);
	}
	@Override
	public List<ChatVo> getChat(int clnum) {
		return sqlSessionTemplate.selectList(NAMESPACE+".getChat", clnum);
	}
	@Override
	public List<ChatVo> getChattime(int clnum) {
		return sqlSessionTemplate.selectList(NAMESPACE+".getChattime", clnum);
	}
	@Override
	public String getLastChat(int clnum) {
		return sqlSessionTemplate.selectOne(NAMESPACE+".getLastChat", clnum);
	}
}
