package com.project.service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.project.dao.CategoryDao;
import com.project.dto.CategoryDto;
import com.project.dto.MessageDto;
import com.project.useClass.MessagePaging;

@Service
public class CategoryService {

	@Autowired
	private CategoryDao cDao;	
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpSession session;
	
	List<MessageDto> msglist=null;
	ModelAndView mav;
	HashMap<String, Object> msgMap;
	List<CategoryDto> clist = null;
	
	public Map<String, List<CategoryDto>> getMainCate() {
		clist = cDao.getMaincategory();

		Map<String, List<CategoryDto>>cMap=new HashMap<String ,List<CategoryDto>>();
		cMap.put("clist",clist);
		System.out.println("cMap : "+ cMap);
		return cMap;
	}
	
	
	public Map<String, List<CategoryDto>> getSubCate(int cnum) {
		clist = cDao.getSubcategory(cnum);
		
		Map<String,List<CategoryDto>> subMap = new HashMap<String,List<CategoryDto>>();
		subMap.put("subList",clist);
		System.out.println("subList : "+ clist);
		return subMap;
	}


	public Map<Object, Object> faAdd(CategoryDto categorydto) {
		Map<Object,Object> map = new HashMap<Object, Object>();
		String nick = (String) request.getSession().getAttribute("loginNick") ;
		int c_idx = Integer.parseInt(request.getParameter("c_idx"));
		System.out.println("nick : "+categorydto.getB_nick()+"// c_idx : "+categorydto.getC_idx());
		map.put("c_idx",c_idx);
		map.put("b_nick",nick);
		int addSuc = cDao.faAdd(map);
		System.err.println("addSuc : "+addSuc);
		String msg="";
		if(addSuc == 1){
			msg="즐겨찾기에 등록 하셧습니다.";
		}else{
			msg="즐겨찾기 등록에 실패 하셧습니다.";
		}
		
		map.put("msg", msg);
		return map;
	}


	public Map<Object, Object> faDel(CategoryDto categorydto) {
		Map<Object,Object> map = new HashMap<Object, Object>();
		String nick = (String) request.getSession().getAttribute("loginNick") ;
		int c_idx = Integer.parseInt(request.getParameter("c_idx"));
		System.out.println("nick : "+categorydto.getB_nick()+"// c_idx : "+categorydto.getC_idx());
		map.put("c_idx",c_idx);
		map.put("b_nick",nick);
		
		int delSuc = cDao.faDel(map);
		String msg="";
		if(delSuc == 1){
			msg="즐겨찾기에서 삭제 했습니다.";
		}else{
			msg="즐겨찾기 삭제에 실패 했습니다.";
			}
		map.put("msg", msg);
		return map;
	}

/*	public Map<String, List<CategoryDto>> getLowCate(CategoryDto categorydto) {
		
		List<CategoryDto> lowList = cDao.getLowcategory(categorydto);
		
		Map<String,List<CategoryDto>> lowcateMap = new HashMap<String,List<CategoryDto>>();
		System.out.println("lowCate : "+ lowList);
		lowcateMap.put("lowList", lowList);
		return lowcateMap;
	}*/


	
	//메시지 전송 메소드
		public Map<String, Object> sendMsg(MessageDto messageDto) {
			System.out.println("메시지 전송 메소드");
			mav = new ModelAndView();
			msgMap= new HashMap<String,Object>();						
					
			int sucess = cDao.sendMsg(messageDto);
			
			if(sucess > 0) {			
				msgMap.put("sucess", sucess);
			}else{
				//jsonStr=null;
				msgMap=null;
			}
			return msgMap;		
		}
	
	
	//메시지 리스트 불러오기 메소드.
	public ModelAndView messageList(MessageDto messageDto) {
		System.out.println("메시지 리스트 불러오기 메소드");
		mav = new ModelAndView();				
		HashMap<String, Object> map = new HashMap<String, Object>();
		messageDto.setMsg_recivenick((String)session.getAttribute("loginNick"));
		int rating =  Integer.parseInt((String)session.getAttribute("loginRating"));
		
		String keyword = request.getParameter("keyword");
		String searchtxt = request.getParameter("searchtxt");
		String category = request.getParameter("category");
		String msg_category = messageDto.getMsg_category(); //뷰페이지에서 가져온 msg_category		
		String msg_recivenick = messageDto.getMsg_recivenick();
		System.out.println("세팅한 리시브 닉"+msg_recivenick);
		System.out.println("메시지 리스트 카테고리"+messageDto.getMsg_category());
		
		int pageNum=(request.getParameter("pageNum")!=null) 
				? Integer.parseInt(request.getParameter("pageNum")) : 1;
				System.out.println("pageNum="+pageNum);
		
			/*분기 - 관리자0, 견적문의1, 중고문의2*/
			if(category==null && keyword==null && searchtxt==null) {
				System.out.println("검색 아닐 시 쪽지 리스트 category:"+msg_category);	
				
				map.put("messageDto", messageDto);
				map.put("pageNum", pageNum);
				
				if(msg_category.equals("0")) {
					System.out.println("공지 쪽지 리스트");
					if(rating == 9 ) {
						msglist=cDao.adminMessageNoticeList(map);
						if(msglist.size() != 0) {
							for(int i=0; i < msglist.size(); i++) {
								if(msglist.get(i).getB_idx() != 0) {
									messageDto = cDao.getCnum(msglist.get(i).getB_idx());
									msglist.get(i).setC_idx(messageDto.getC_idx());
									msglist.get(i).setC_num(messageDto.getC_num());
									
									System.out.println(msglist.get(i).getC_idx());
									System.out.println(msglist.get(i).getC_num());
								}								
							}
						}
					}else {
						msglist=cDao.messageNoticeList(map);
					}
				}else{
					System.out.println("일반 쪽지 리스트");
					msglist=cDao.messageList(map);
					
					System.out.println(msglist.size());
					if(msglist.size() != 0) {
						for(int i=0; i < msglist.size(); i++) {
							System.out.println("msglist.get(i).getB_idx() 123 : "+msglist.get(i).getB_idx());
							messageDto = cDao.getCnum(msglist.get(i).getB_idx());
							System.out.println("messageDto.getC_idx() : "+messageDto.getC_idx());
							msglist.get(i).setC_idx(messageDto.getC_idx());
							msglist.get(i).setC_num(messageDto.getC_num());
							
							System.out.println("msglist.get(i).getC_idx() : "+msglist.get(i).getC_idx());
							System.out.println("msglist.get(i).getC_num() : "+msglist.get(i).getC_num());
						}
					}										
					System.out.println("그냥 카테고리"+msg_category);										
				}
				
				mav.addObject("msglist", msglist);
				mav.addObject("paging",getPaging(pageNum,keyword,searchtxt,category,msg_category,msg_recivenick));				
					
			}else { //검색일 때
				System.out.println("검색 중");
				System.out.println(pageNum);			
				System.out.println("키워드 :"+keyword);
				System.out.println("텍스트 :"+searchtxt);
				System.out.println("텍스트 :"+category);				
				
			    map.put("pageNum", Integer.toString(pageNum)); // 페이지 번호*/			
			    map.put("keyword", keyword); //검색 키워드 = writer / sub / subcon
			    map.put("searchtxt", searchtxt); //String 검색글씨
			    map.put("category", category); //String 검색글씨
			    map.put("msg_category", messageDto.getMsg_category());
			    map.put("msg_recivenick", messageDto.getMsg_recivenick());
			    map.put("msg_sendnick", messageDto.getMsg_sendnick());
			    
			    System.out.println(map.size());
			    System.out.println("페이지번호:"+map.get("pageNum"));
			    System.out.println("검색키워드 : "+map.get("keyword"));
			    System.out.println("검색내용 : "+map.get("searchtxt"));		    
			    
			    if(msg_category.equals("0")) {
			    	if(rating == 9) {
			    		msglist=cDao.adminMessageSerchNoticeList(map);
			    		if(msglist.size() != 0) {
							for(int i=0; i < msglist.size(); i++) {
								if(msglist.get(i).getB_idx() != 0) {
									messageDto = cDao.getCnum(msglist.get(i).getB_idx());
									msglist.get(i).setC_idx(messageDto.getC_idx());
									msglist.get(i).setC_num(messageDto.getC_num());
									
									System.out.println(msglist.get(i).getC_idx());
									System.out.println(msglist.get(i).getC_num());
								}
							}
						}
			    	}else {
			    		msglist=cDao.messageSerchNoticeList(map);
			    	}
				}else {
						msglist=cDao.messageSerchList(map);
						if(msglist.size() != 0) {
							for(int i=0; i < msglist.size(); i++) {
								if(msglist.get(i).getB_idx() != 0) {
									messageDto = cDao.getCnum(msglist.get(i).getB_idx());
									msglist.get(i).setC_idx(messageDto.getC_idx());
									msglist.get(i).setC_num(messageDto.getC_num());
									
									System.out.println(msglist.get(i).getC_idx());
									System.out.println(msglist.get(i).getC_num());
								}
							}
						}
				}				
			   			    
				mav.addObject("msglist", msglist);
				mav.addObject("paging",getPaging(pageNum,keyword,searchtxt,category,msg_category,msg_recivenick));
			}			
			
			mav.addObject("msg_category", msg_category);
			
			if(rating == 9 ) {//관리자일때 페이지 분기
				mav.setViewName("admin/adminMessageList");
			}else {
				mav.setViewName("message/messageList");
			}			
			
			return mav;		
	}	
	
	// 페이징
	private String getPaging(int pageNum, String keyword, String searchtxt, String category, String msg_category, String msg_recivenick) { //현재 페이지 번호
		System.out.println("페이징 메소드 실행 받는 닉네임"+msg_recivenick);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("pageNum", Integer.toString(pageNum)); // 페이지 번호*/		
		map.put("msg_category", msg_category); // 쪽지 분류  		   
		map.put("msg_recivenick", msg_recivenick); // 받는사람
		map.put("category", category); // 공지 쪽지 검색 분류    
	    map.put("keyword", keyword); //검색 키워드 = writer / content
	    map.put("searchtxt", searchtxt); //String 검색글씨	
	    int rating =  Integer.parseInt((String)session.getAttribute("loginRating"));
	    
	    int maxNum = 0;
	    if(msg_category.equals("0")) { /*공지일때*/
	    	System.out.println("공지일때 페이지 카운트 분류"+msg_category);
	    	if(rating == 9) {
	    		maxNum=cDao.adminMessageNoticeCount(map);
	    	}else {
	    		maxNum=cDao.messageNoticeCount(map);
	    	}	    	
		}else {
			System.out.println("일반일때 페이지 카운트 분류"+msg_category);
			maxNum=cDao.messageListCount(map);
		}	
	    
	    
		int listCount=10; //한페이지의 글의 개수
		int pageCount=5;  //한 그룹당 페이지 수
		String boardUrl="messageList"; //페이징 처리해서 보낼 URL
		MessagePaging paging = new MessagePaging(maxNum,pageNum,listCount,pageCount,boardUrl,category,keyword,searchtxt,msg_category,msg_recivenick);
		return paging.makeHtmlPaging();
	}
	
	//메세지 상세보기 페이지 요청 메소드
	public ModelAndView messageDetail(MessageDto messageDto) {
		mav = new ModelAndView();
		
		System.out.println("메세지 상세보기 페이지 요청 메소드 bidx"+messageDto.getB_idx()+"//상대방닉네임/"+messageDto.getMsg_sendnick()+"//내 닉네임/"+messageDto.getMsg_recivenick());
		 if(messageDto.getMsg_category().equals("0")) {
			 System.out.println("공지 쪽지 상세보기 메소드");
			 cDao.msgNoticeReadCheck(messageDto);
			 messageDto = cDao.messageNoticeDetail(messageDto);
			 mav.addObject("messageDto", messageDto);
		 }else {
			System.out.println("일반 쪽지 상세보기 메소드");			
			cDao.msgReadCheck(messageDto);
			msglist = cDao.messageDetail(messageDto);
			Collections.reverse(msglist); //배열 순서 뒤집기	
				
			
			mav.addObject("msgDlist", msglist);
			mav.addObject("msg_b_idx", messageDto.getB_idx());
			mav.addObject("msg_recivenick", messageDto.getMsg_recivenick());
			mav.addObject("msg_sendnick", messageDto.getMsg_sendnick());		
			mav.addObject("msg_category", messageDto.getMsg_category());
		 }
		
		System.out.println("msg_recivenick 받아가냐"+messageDto.getMsg_sendnick());
		System.out.println("msg_sendnick 받아가라~~"+messageDto.getMsg_sendnick());
		
		mav.setViewName("message/messageDetail");		
		return mav;
	}	
	

	


	
	
	
}
