package com.hospital.erp.chat;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.hospital.erp.member.MemberVO;

import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Getter
public class ChatService {
	
	@Autowired
	private ChatDAO chatDAO;
	
	private final ObjectMapper objectMapper = new ObjectMapper();
    private Map<Long, RoomVO> chatRooms = new HashMap<>();//방저장
    private Map<String, Set<String>> memers = new HashMap<>();


    public List<RoomVO> findAllRoom() throws Exception{

    	return new ArrayList<>(chatRooms.values());
    	
    }

    public RoomVO findRoomById(Long roomNum) {
        
    	return chatRooms.get(roomNum);
    }
    
    // 방생성
    public int createRoom(RoomVO roomVO) throws Exception{
 
        return chatDAO.createRoom(roomVO);
    }
    
    public List<MemberVO> getChatList(String memCd)throws Exception{
    	return chatDAO.getChatList(memCd);
    }
    
    public List<MemberVO> getSearch(String memName)throws Exception{
    	return chatDAO.getSearch(memName);
    }
    
    public RoomVO roomCheck(RoomVO roomVO)throws Exception{
    	roomVO = chatDAO.roomCheck(roomVO);
    	if(roomVO!=null) {
    		
    		chatRooms.put(roomVO.getRoomNum(), roomVO);
    	}
    	return roomVO;
    }
    
    public int messageAdd(ChatMessageVO chatMessageVO)throws Exception{
    	return chatDAO.messageAdd(chatMessageVO);
    }
    
    public List<ChatMessageVO> chatMessageList(RoomVO roomVO)throws Exception{
    	return chatDAO.chatMessageList(roomVO);
    }
    
    public MemberVO getSomeone(MemberVO memberVO)throws Exception{
    	return chatDAO.getSomeone(memberVO);
    }

}