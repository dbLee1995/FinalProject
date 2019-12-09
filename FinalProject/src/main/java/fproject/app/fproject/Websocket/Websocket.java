package fproject.app.fproject.Websocket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import fproject.app.fproject.service.AccountService;
import fproject.app.fproject.service.ChatService;
import fproject.app.fproject.vo.AccountVo;
import fproject.app.fproject.vo.ChatVo;

public class Websocket extends TextWebSocketHandler{
	
	@Autowired ChatService chatService;
	@Autowired AccountService accountService;
	
	private List<WebSocketSession> sessionList=
			new ArrayList<WebSocketSession>();
	private Map<WebSocketSession, Integer> clMap=
			new HashMap<WebSocketSession, Integer>();
	
	@Override
	public void afterConnectionEstablished(
			WebSocketSession session) throws Exception {
		
		sessionList.add(session);
		Map<String, Object> map=session.getAttributes();
		int clnum=(Integer)map.get("clnum");
		clMap.put(session, clnum);
	}
	@Override
	public void afterConnectionClosed(
			WebSocketSession session, CloseStatus status) throws Exception {
		
		sessionList.remove(session);
		clMap.remove(session);
	}
	@Override
	protected void handleTextMessage(
			WebSocketSession session, TextMessage message) throws Exception {
		
		// 0: ȸ����ȣ / 1: ���ȣ / 2: ä�ó���
		String msgArr[]=new String[3];
		msgArr=message.getPayload().split("!%/");
		int usernum=Integer.parseInt(msgArr[0]);
		int clnum=Integer.parseInt(msgArr[1]);
		AccountVo accvo=accountService.info(usernum);
		/*
		for(WebSocketSession wsSession : sessionList){
		}*/
		Iterator<WebSocketSession> sessionIds = clMap.keySet().iterator();
		while(sessionIds.hasNext()){
			WebSocketSession wsId=sessionIds.next();
			int accnum=clMap.get(wsId);
			if(accnum==clnum){
				wsId.sendMessage(new TextMessage(session.getId()+":"+accvo.getId()+":"+msgArr[2]));
			}
		}
		chatService.addChat(new ChatVo(0, 1, msgArr[2], null, 0, "", "", 0, clnum, usernum));
	}
}
