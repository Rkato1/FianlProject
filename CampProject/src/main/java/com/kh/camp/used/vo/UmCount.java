package com.kh.camp.used.vo;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.camp.used.dao.UsedDao;


@Component("umCount")
public class UmCount extends TextWebSocketHandler{
	@Autowired
	private UsedDao dao;
	
	private HashMap<String, WebSocketSession> connectMembers;
	private HashMap<String, HashMap<String,WebSocketSession>> teamRoom;
	
	public UmCount() {
		super();
		connectMembers = new HashMap<String, WebSocketSession>();
	}
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		System.out.println("클라이언트 접속(DM)");	//내일 DM 가져오기
	}
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		String recMsg = message.getPayload();
		JsonParser parser = new JsonParser();
		JsonObject msg = (JsonObject)parser.parse(recMsg);
		String type = msg.get("type").getAsString();
		String data = msg.get("data").getAsString();
		if(type.equals("register")) {	//type	
			connectMembers.put(data, session);
		}else {
			int count = dao.umCount(data);
			connectMembers.get(data).sendMessage(new TextMessage(String.valueOf(count)));
		}
	}
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		
	}
}
