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
	
	@Override
	public void afterConnectionEstablished(
			WebSocketSession session) throws Exception {
		
		sessionList.add(session);
		
	}
	@Override
	public void afterConnectionClosed(
			WebSocketSession session, CloseStatus status) throws Exception {
		
		sessionList.remove(session);
		
	}
	@Override
	protected void handleTextMessage(
			WebSocketSession session, TextMessage message) throws Exception {
		
		System.out.println(message.getPayload());
		for(WebSocketSession wsSession : sessionList){
			wsSession.sendMessage(new TextMessage(message.getPayload()));
		}
	}
}
