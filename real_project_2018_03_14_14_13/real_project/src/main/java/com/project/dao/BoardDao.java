package com.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.project.dto.BoardDto;
import com.project.dto.MessageDto;
import com.project.dto.PhotoDto;
import com.project.dto.ReplyDto;
import com.project.dto.SafeDealDto;

public interface BoardDao {	
	/*공통 DAO*/

	int fileInsert(Map<Object, Object> map); //공통 사진 저장

	void updateB_hit(String bidx); //게시글 조회수 올리기
	int boardWrite(BoardDto boarddto);//메인 게시판 테이블에 글넣기
	int boardUpdate(BoardDto boardDto); //메인 게시판 테이블 업데이트
	
	int fileDel(int b_idx);//사진 삭제
	
	/*견적문의 DAO*/
	List<BoardDto> estiBoardList(HashMap<Object, Object> map); //견적문의 리스트 불러오기
	List<BoardDto> estiBoardSerchList(HashMap<Object, Object> map); //견적문의 검색 리스트 불러오기
	BoardDto estiDetail(String bidx); //견적문의 상세보기
	List<ReplyDto> estiReplyList(String bidx); //견적문의 댓글리스트 불러오기
	List<PhotoDto> estiPhotoList(String bidx); //견적문의 사진 불러오기
	int estiBoardCount(HashMap<String, String> map); //견적문의 게시글 카운트
	String estiBoardName(int c_idx);// 견적문의 게시판별 이름 가져오기
	Integer estiReplyWrite(ReplyDto reply); //견적문의 댓글 쓰기
	Integer estiReplyDel(ReplyDto reply); //견적문의 댓글 삭제
	int estiBoardDelete(BoardDto board); //견적문의 게시글 삭제		
	int estiBoardWrite(BoardDto boarddto);// 견적문의 테이블에 내용넣기
	int estiBoardUpdate(BoardDto boardDto); // 견적문의 테이블 수정하기
	Integer estiChoose(BoardDto boardDto); //견적문의 채택하기

	/*중고거래 DAO*/
	int listcount(Map<Object, Object> map);//중고거래 글 개수
	List<BoardDto> usedList(Map<Object, Object> map);//중고거래 리스트
	String getProduc(int c_idx);//중고거래 게시판별 이름 가져오기
	int useWrite(BoardDto boarddto);//게시판 메인테이블에 글넣기
	int usedWrite(BoardDto boarddto);// 중고거래테이블에 내용넣기
	BoardDto usedDetail(int b_idx);// 중고 거래 상세보기
	List<ReplyDto> usedReply(int b_idx);//중고거래 리플리스트
	List<PhotoDto> usedPhoto(int b_idx);//중고거래 사진 리스트
	int useReplyWrite(ReplyDto replydto);//중고거래 댓글 쓰기
	int usedUpdate(BoardDto boarddto);//중고거래 ㅇ업데이트
	int useUpdate(BoardDto boarddto);
	int usedDel(int b_idx);
	int replyDel(int r_idx);
	int sendSellmsg(MessageDto messageDto); //중고거래 팝니다 메시지 보내기
	int dealFinish(BoardDto boarddto);//거래완료로 변경
	
	/*공지&이벤트 DAO*/
	BoardDto noticeDetail(int b_idx);
	List<PhotoDto> noticePhotoList(int b_idx);
	List<BoardDto> noticeBoardList(HashMap<String, Integer> map);
	List<BoardDto> noticeBoardSerchList(HashMap<String, String> map);
	String noticeBoardName(String c_idx);
	int noticeBoardCount(HashMap<String, String> map);	
	List<BoardDto> evBoardList(HashMap<Object, Object> map);
	int evUpdate(BoardDto boarddto);
	int evsUpdate(BoardDto boarddto);
	//임시로
	Object evDetail(int b_idx);
	List<PhotoDto> evPhotoList(int b_idx);
	String evBoardName(String c_idx);
	int evBoardWrite1(BoardDto boarddto);
	int evBoardWrite2(BoardDto boarddto);
	int evDel(int b_idx);
	int noticeUpdate(BoardDto boarddto);//공지사항 업데이트
	int noticeDel(int b_idx);//공지 삭제

	
	/*마이페이지 DAO*/
	int myFavoriteBbsListChk(String m_nick);
	List<Integer> myFavoriteBbsCIdx(String m_nick);

	/*거래내역*/
	List<SafeDealDto> myTradeList1(String m_nick);
	List<SafeDealDto> myTradeList2(String m_nick);
	void myTradeListInfo1(int b_idx);
	SafeDealDto detailPopUp(int sfd_idx);
	List<SafeDealDto> detailPopUpInfo(int sfd_idx);

	int dealUpdate1(SafeDealDto safedealdto);
	int dealUpdate2(SafeDealDto safedealdto);

	//판매자가 정정요청 눌렀을시 상태 정정요청으로 변경
	int dealModifyCall(int sfd_idx);
	//판매자가 수락 눌렀을시 상태 입금대기로 변경
	int dealAgree(int sfd_idx);
	int dealCancel(int sfd_idx);
	int dealBuyCancelMsg1(SafeDealDto safedealdto);
	int dealBuyCancelMsg2(SafeDealDto safedealdto);
	int dealSellCancelMsg1(SafeDealDto safedealdto);
	int dealSellCancelMsg2(SafeDealDto safedealdto);
	int dealCancelAgreeAdmin(int sfd_idx);
	int payChk(int sfd_idx);
	int dealCancelRequest(int sfd_idx);
	int dealConfirm(int sfd_idx);
	List<SafeDealDto> myTradeList3();
	int dealCancelCancel(int sfd_idx);
	int dealInsert(SafeDealDto safedealdto);
	int dealInfoInsert1(SafeDealDto safeDealDto);
	int dealInfoInsert2(SafeDealDto safeDealDto);
	int dealCancelAgreeSell(SafeDealDto safedealdto);
	int dealCancelRequestMsg1(SafeDealDto safedealdto);//소비자가 환불요청시 판매자에게 전해지는 쪽지
	int dealCancelRequestMsg2(SafeDealDto safedealdto);//소비자가 환불요청시 관리자에게 전해지는 쪽지
	int dealAgreeMsg1(SafeDealDto safedealdto);
	int dealAgreeMsg2(SafeDealDto safedealdto);
	int dealModifyCallMsg(SafeDealDto safedealdto);
	int dealUpdateMsg(SafeDealDto safedealdto);
	int payChkMsg(SafeDealDto safedealdto);
	int dealBuyConfirmMsg1(SafeDealDto safedealdto);
	int dealBuyConfirmMsg2(SafeDealDto safedealdto);
	int dealCancelBuyCancelMsg1(SafeDealDto safedealdto);
	int dealCancelBuyCancelMsg2(SafeDealDto safedealdto);
	int dealCancelAdminCancelMsg1(SafeDealDto safedealdto);
	int dealCancelAdminCancelMsg2(SafeDealDto safedealdto);
	
	/*매장소개 DAO*/
	int shopWrite(BoardDto boarddto);//게시판 메인테이블에 글넣기
	int shopsWrite(BoardDto boarddto);// 매장정보테이블에 내용넣기
	int shoplistcount(Map<Object, Object> map);//매장정보 리스트 개수
	List<BoardDto> shopList(Map<Object, Object> map);//매장정보 리스트
	List<PhotoDto> getFile(Map<Object, Object> map);//썸네일 파일 얻어오기
	BoardDto shopDetail(int b_idx);// 매장정보 상세보기
	List<PhotoDto> shopPhoto(int b_idx);//사진 가져오기
	int shopUpdate(BoardDto boarddto);// 메인 게시판 테이블 업데이트
	int shopsUpdate(BoardDto boarddto);//매장게시판 수정
	int fileDelthum(int b_idx);//매장정보 수정시사용(대표이미지삭제)
	int fileDeln(int b_idx);//매장정보 수정사용(매장사진)
	int shopDel(int b_idx);//매장정보 게시글 삭제

		
	/*고객문의 DAO*/
	int dircetQWrite(BoardDto boarddto);//게시판 메인테이블에 글넣기
	int directQWrites(BoardDto boarddto);// qna테이블에 내용넣기
	int directlistcount(Map<Object, Object> map);//게시판 개수 가져오기
	List<BoardDto> directlist(Map<Object, Object> map);//1대1 리스트 가져오기
	BoardDto directQDetail(int b_idx);//1대1 상세보기
	int directQUpdate(BoardDto boarddto);//1대1 수정하기
	List<BoardDto> qnaList(int i);//자주묻는 질문 리스트
	int qnaWrite(BoardDto boarddto);//자주묻는 질문 글쓰기

	

	
	

	/**/

	
}
