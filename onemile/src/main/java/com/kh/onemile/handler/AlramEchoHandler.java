package com.kh.onemile.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.onemile.entity.noti.NotiDTO;
import com.kh.onemile.service.noti.NotiService;

import lombok.extern.slf4j.Slf4j;
@Component
@Slf4j
public class AlramEchoHandler extends TextWebSocketHandler{
	@Autowired
	private NotiService notiService;
	//로그인한 전체 회원
	List<WebSocketSession> sessions = new ArrayList<>();
	
	//회원 한 명의 세션
	Map<String, WebSocketSession> userSessions = new HashMap<>();
	
	//서버와 연결이 되면 실행
	@Override
	public void afterConnectionEstablished(WebSocketSession session)throws Exception {
		sessions.add(session);
		
		String sender = getNick(session); //센더 정보를 가져온다
		userSessions.put(sender, session);
		log.info("연결 성공");
	}
	
	//메세지를 보내는 기능
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		
		//알림이 오는 상황, 보내는 사람, 받는 사람, 시퀀스 번호
		String msg = message.getPayload();
		if(!msg.isEmpty()) {
			String[] strs = msg.split(","); //payload로 넣은 것을 ',' 기준으로 잘라 배열에 넣는다.
			
			if(strs != null && strs.length == 4) {
				String type = strs[0];
				String giver = strs[1];
				String receiver = strs[2];
				String seq = strs[3];
				
				//받는 사람이 로그인한 상태라면
				WebSocketSession receiverSession = userSessions.get(receiver);
				NotiDTO notiDTO =new NotiDTO();
				if("memberReject".contentEquals(type)&& receiverSession != null) { //type이 댓글이라면
				 //	notiDTO.setSender(giver);
					notiDTO.setMsg("님이 게시글에 댓글을 남겼습니다");
					TextMessage tmpMsg = new TextMessage(giver+"님이 게시글에 댓글을 남겼습니다.");
					receiverSession.sendMessage(tmpMsg);
				}
				if("miles".contentEquals(type)&& receiverSession != null) {
					TextMessage tmpMsg = new TextMessage(giver+"님이 마일즈에 참가하셨습니다.");
					receiverSession.sendMessage(tmpMsg);
				}
				
			}
		}
	}
	
	//httpSession에서 nick가져오는 메소드
	private String getNick(WebSocketSession session) {
		Map<String, Object> httpSessions = session.getAttributes();
		String loginNick = (String)httpSessions.get("nick");
		
		if(loginNick != null) {
			return loginNick;
		}
		else {
			return session.getId();
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//사용자가 있을 때 
		if(getNick(session)!=null) {
			userSessions.remove(session.getId()); //맵에서 삭제
			sessions.remove(session); //로그인 목록에서 삭제
			
		}
		log.info("연결 해제");
	}
}
