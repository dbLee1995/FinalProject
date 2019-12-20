package fproject.app.fproject.Websocket;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import fproject.app.fproject.service.ProfilesService;
import fproject.app.fproject.vo.AccountVo;
import fproject.app.fproject.vo.ChatVo;

public class Websocket extends TextWebSocketHandler{
	
	@Autowired ChatService chatService;
	@Autowired AccountService accountService;
	@Autowired ProfilesService profilesService;
	
	private int accountNum;
	
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
		accountNum=(Integer)map.get("num");
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
		
		// 0: 회원번호 / 1: 방번호 / 2: 내용
		String msgArr[]=new String[3];
		msgArr=message.getPayload().split("!%/");
		int usernum=Integer.parseInt(msgArr[0]);
		int clnum=Integer.parseInt(msgArr[1]);
		AccountVo accvo=accountService.info(usernum);
		chatService.addChat(new ChatVo(0, 1, msgArr[2], null, 0, "", "", 0, clnum, usernum));
		int chatnum=chatService.getLastChatNum(clnum);
		String name=profilesService.info(usernum).getName();
		System.out.println(chatnum);
		System.out.println(clnum);
		/*
		for(WebSocketSession wsSession : sessionList){
		}*/
		Date time=new Date();
		SimpleDateFormat format=new SimpleDateFormat("a hh:mm");
		Iterator<WebSocketSession> sessionIds = clMap.keySet().iterator();
		while(sessionIds.hasNext()){
			WebSocketSession wsId=sessionIds.next();
			int accnum=clMap.get(wsId);
			if(accnum==clnum){
				// 내용 + 시간 + 번호 + 채팅번호 + 이름 
				String msg=msgArr[2]+"!%/ ("+format.format(time)+")";
				wsId.sendMessage(new TextMessage(msg+"!%/"+usernum+"!%/"+chatnum+"!%/"+name));
			}else{ // 다른방키워드 + 방번호 + 내용
				String msg="otherroom!%/"+clnum+"!%/"+msgArr[2];
				wsId.sendMessage(new TextMessage(msg));
			}
		}
	}
}
