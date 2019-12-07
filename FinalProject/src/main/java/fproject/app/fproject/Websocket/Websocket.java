package fproject.app.fproject.Websocket;

import java.io.StringWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import fproject.app.fproject.Util.ChatUtil;
import fproject.app.fproject.service.ChatService;
import fproject.app.fproject.vo.AccountVo;
import fproject.app.fproject.vo.AttendinfoVo;

public class Websocket extends TextWebSocketHandler{
	
	@Autowired ChatService chatService;
	
	private List<WebSocketSession> sessionList=
			new ArrayList<WebSocketSession>();
	private Map<WebSocketSession, String> mapList=
			new HashMap<WebSocketSession, String>();
	private Map<WebSocketSession, Integer> chatList=
			new HashMap<WebSocketSession, Integer>();
	
	private List<String> accountList=new ArrayList<String>();
	
	@Override
	public void afterConnectionEstablished(
			WebSocketSession session) throws Exception {
		
		/*Map<String, Object> map=session.getAttributes();
		AccountVo avo=(AccountVo)map.get("login");
		String accountId=avo.getId();
		
		AttendinfoVo attinfo=(AttendinfoVo)map.get("selectAttendinfo");
		chatList.put(session, attinfo.getClnum());
		System.out.println(accountId+"����"+attinfo.getClnum()+"�� �濡 ���Խ��ϴ�!");
		
		mapList.put(session, accountId);*/
		sessionList.add(session);
		/*
		for(int i=0;i<sessionList.size();++i){
			int chatlistNum=chatList.get(sessionList.get(i));
			if(attinfo.getClnum()==chatlistNum){
				sessionList.get(i).sendMessage(
						new TextMessage(JsonDataOpen(avo.getNum(), avo.getId())));
			}
			accountList=informAccount(mapList, chatlistNum);
			System.out.println("���� �濡 �������� �ο� ��:"+accountList.size());
			ChatUtil chatUtil=new ChatUtil();
			String AccountListMessage=chatUtil.split(accountList);
			
			sessionList.get(i).sendMessage(
					new TextMessage(JsonUser(AccountListMessage)));
		}*/
	}
	@Override
	public void afterConnectionClosed(
			WebSocketSession session, CloseStatus status) throws Exception {
		
		Map<String, Object> map=session.getAttributes();
		AccountVo accvo=(AccountVo)map.get("login");
		int accountNum=accvo.getNum();
		
		AttendinfoVo attinfo=(AttendinfoVo)map.get("selectAttendinfo");
		chatList.remove(session);
		mapList.remove(session);
		sessionList.remove(session);
		
		chatService.deleteChat(attinfo);
		
	}
	@Override
	protected void handleTextMessage(
			WebSocketSession session, TextMessage message) throws Exception {
		/*
		Map<String, Object> map=session.getAttributes();
		AccountVo accvo=(AccountVo)map.get("login");
		int accountNum=accvo.getNum();
		*/
		System.out.println(message.getPayload());
	/*	
		String msgArr[]=new String[2]; // 0:content 1:clnum
		msgArr=message.getPayload().split("!%/");
		
		for(WebSocketSession webSocketSession : sessionList){
			if(msgArr[1].equals(chatList.get(webSocketSession))){
				if(!session.getId().equals(webSocketSession.getId())){ // id? num?
					webSocketSession.sendMessage(
							new TextMessage(JsonData(accountNum, msgArr[0])));
				}
			}
		}*/
	}
}
