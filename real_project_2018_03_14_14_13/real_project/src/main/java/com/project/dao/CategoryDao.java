package com.project.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.project.dto.CategoryDto;
import com.project.dto.MessageDto;

public interface CategoryDao {

	List<CategoryDto> getMaincategory();
	int noticeIdx(int c_num);
	List<CategoryDto> noticeList(int noticeidx);
	List<CategoryDto> getSubcategory(int cnum);
	int getFavorite(Map<Object, Object> map); //즐겨찾기 인지 확인
	int faAdd(Map<Object, Object> map);	//즐겨찾기 추가
	int faDel(Map<Object, Object> map);	//즐겨찾기 삭제
	CategoryDto myFavoriteBbsCategory(Integer c_idx);
	
	/*메시지 DAO*/
	int sendMsg(MessageDto messageDto); //메시지 등록	
	List<MessageDto> messageNoticeList(HashMap<String, Object> map); //공지 메시지 리스트 불러오기
	List<MessageDto> messageList(HashMap<String, Object> map); //일반 리스트 불러오기 검색	
	List<MessageDto> messageSerchNoticeList(HashMap<String, Object> map); //공지 메시지 검색	
	List<MessageDto> messageSerchList(HashMap<String, Object> map); //일반 메시지 검색
	int messageNoticeCount(HashMap<String, String> map); //공지 메시지 카운트
	int messageListCount(HashMap<String, String> map); //일반 메시지 카운트
	List<MessageDto> messageDetail(MessageDto messageDto); //메시지 상세보기 요청
	int countMsg(String loginNick); //웹소켓 쪽지 확인
	MessageDto messageNoticeDetail(MessageDto messageDto); //공지메시지 상세보기 요청	
	void msgNoticeReadCheck(MessageDto messageDto); //공지 쪽지 읽었는지 확인
	void msgReadCheck(MessageDto messageDto); //일반 쪽지 읽엇는지 확인
	MessageDto getCnum(int b_idx); //쪽지 cnum 가져오기
	List<MessageDto> adminMessageNoticeList(HashMap<String, Object> map); //관리자 메시지 리스트
	/*List<MessageDto> adminMessageList(HashMap<String, Object> map); //관리자 일반 메시지 리스트
*/	List<MessageDto> adminMessageSerchNoticeList(HashMap<String, Object> map); //관리자 메시지 검색 리스트
	/*List<MessageDto> adminMessageSerchList(HashMap<String, Object> map); // 관리자 일반 검색 리스트
*/	int adminMessageNoticeCount(HashMap<String, String> map); // 관리자 메시지 리스트 카운트
	/*int adminMessageListCount(HashMap<String, String> map); //관리자 일반 리스트 카운트
*/	
	/*견적*/
	String getProduct(int c_num);//견적 폼에 입력시 사용할 분류
	String getMdgroup(int c_idx);//견적 폼에 입력시 사용할 카테고리
	String getBrand(int c_idx);//견적 폼에 입력시 사용할 브랜드
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
}
