package com.project.useClass;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.project.dao.CategoryDao;

@Repository
public class WebSocketHandler extends TextWebSocketHandler {

	@Autowired
	CategoryDao cDao;
	@Autowired
	HttpSession login;
	
	// 웹 소켓 연결이 종료되고 나서 서버단에서 실행해야할 일들을 정의해주는 메소드
	// afterConnectionClosed -> 웹 소켓 연결이 종료되고 나서 서버단에서 실행해야할 일들을 정의해주는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("웹소켓 연결 종료");
	}	


	//afterConnectionEstablished -> 연결이 성사 되고 나서 해야할 일들.
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("웹소켓 연결 성공");
	}


	//handleTextMessage-> 웹소켓 서버단으로 메세지가 도착했을때 해주어야할 일들을 정의하는 메소드 입니다.		  
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		System.out.println("웹소켓 메시지 도착");
		System.out.println(session);
		System.out.println(message);
		System.out.println("웹소켓 메시지"+message.getPayload());
		/*String loginNick = (String)login.getAttribute("loginNick");
			System.out.println(loginNick);				
		int msgCount = cDao.countMsg(loginNick);
		*/
		String loginNick = message.getPayload();
		System.out.println("loginNick에 담긴 아이디 : "+loginNick);
		//현재 수신자에게 몇개의 메세지가 와있는지 디비에서 검색함.
		int msgCount = cDao.countMsg(loginNick);
		
		System.out.println("안읽은 글 수:"+msgCount);
		session.sendMessage(new TextMessage(Integer.toString(msgCount)));
		
		System.out.println("카운트 된 숫자 전송 가즈아!!");
	}

}