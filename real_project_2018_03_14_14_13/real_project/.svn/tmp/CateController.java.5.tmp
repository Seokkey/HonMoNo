package com.project.honMoNo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.dto.BoardDto;
import com.project.dto.CategoryDto;
import com.project.dto.MessageDto;
import com.project.service.CategoryService;
import com.project.service.EvBoardService;
import com.project.service.QnaBoardService;

@Controller
public class CateController {
	
	@Autowired
	private CategoryService cs;
	@Autowired
	private EvBoardService evbs;
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	private QnaBoardService qbs;

	
	ModelAndView mav;
	Map<String,Object> msgMap;
	
	@RequestMapping(value = "/subcategorylist",  produces = "application/json; charset=utf8")
	public @ResponseBody Map<String,List<CategoryDto>>subcategorylist(CategoryDto categorydto){		
		System.out.println("사이드바 카테고리 : "+categorydto.getC_num());
		int cnum=categorydto.getC_num();
		Map<String,List<CategoryDto>> subMap = cs.getSubCate(cnum);
		System.out.println(subMap);
		return subMap;	
	}	
	
	//중분류 카테고리 리스트
		@RequestMapping(value = "/subCateList", method = RequestMethod.GET)
		public ModelAndView subCateList(CategoryDto categorydto) {	
			System.out.println("c_num : " +categorydto.getC_num());
			System.out.println("c_name : "+categorydto.getC_name());
			String page="";
			
			mav = new ModelAndView();
			
			
			switch (categorydto.getC_num()) {
				case 0:
					System.out.println("공지&이벤트 클릭");
					mav=evbs.noticeBoardList();
					mav.addObject("c_idx", 6);
					System.out.println("mav : "+mav);
					break;
					
				case 1:
					System.out.println("견적문의 클릭");
					mav.addObject("c_idx", 8);
					mav.setViewName("estimate/estimatePage");
					break;
					
				case 2:
					mav.addObject("c_idx", 12);
					mav.setViewName("used/usedGuide");
					break;
					
				case 3:
					mav.addObject("c_idx", 16);
					mav.setViewName("shop/shopGuide");
					break;
	
				case 4://faq
					mav.addObject("c_idx", 20);
					System.out.println("자주묻는질문");
					mav=qbs.qnaList(categorydto);
					mav.setViewName("QnA/qnaList");
					break;
	
				default:					
					break;
			}
			
			mav.addObject("categorydto", categorydto);
			
			return mav;
		}	
	/*@RequestMapping(value = "/lowCateList",  produces = "application/json; charset=utf8")
	public @ResponseBody Map<String,List<CategoryDto>>lowCateList(CategoryDto categorydto){		
		System.out.println("사이드바 하위 카테고리 : "+categorydto.getC_num()+" // "+categorydto.getC_name());				
		Map<String,List<CategoryDto>> lowcateMap = cs.getLowCate(categorydto);
		System.out.println(lowcateMap);
		return lowcateMap;	
	}*/
		//즐겨찾기 추가하기
		@RequestMapping(value = "/faAdd",  produces = "application/json; charset=utf8")
		public @ResponseBody Map<Object, Object> faAdd(CategoryDto categorydto){		
			System.out.println("즐겨 찾기 추가하기");				
			Map<Object, Object> faAddMap = cs.faAdd(categorydto);
			System.out.println("faAddMap : "+faAddMap );
			return faAddMap;	
		}

		
		//즐겨찾기 삭제하기
		@RequestMapping(value = "/faDel", produces = "application/json; charset=utf8")
		public @ResponseBody Map<Object, Object> faDel(CategoryDto categorydto) {
			System.out.println("즐겨 찾기 삭제하기");
			Map<Object, Object> faDelMap= cs.faDel(categorydto);
			return faDelMap;
		}
		
		//메세지 폼 요청
		@RequestMapping(value = "/messageForm", method = RequestMethod.GET)
		public ModelAndView messageForm(MessageDto messageDto, CategoryDto categoryDto) {	
			System.out.println("메시지 폼 요청 nick:"+messageDto.getMsg_sendnick());
			ModelAndView mav = new ModelAndView();		
			mav.addObject("messageDto",messageDto);
			mav.addObject("categoryDto",categoryDto);
			mav.addObject("b_idx", request.getParameter("b_idx"));
			mav.addObject("u_bors", request.getParameter("u_bors"));
			System.out.println("메시지폼에 보내줄 c_num:"+categoryDto.getC_num());
			mav.setViewName("message/messageForm");
			return mav;
		}
		
		//메세지 전송 요청
		@RequestMapping(value = "/sendMsg", produces = "application/json; charset=utf8")
		public @ResponseBody Map<String, Object> sendMsg(MessageDto messageDto) {	
			System.out.println("메시지 전송 요청 sendnick:"+messageDto.getMsg_sendnick());
			System.out.println("메시지 전송 요청 recivenick:"+messageDto.getMsg_recivenick());
			System.out.println("메시지 전송 요청 글 내용:"+messageDto.getMsg_content());
			System.out.println("메시지 전송 요청 글 idx:"+messageDto.getB_idx());
			System.out.println("메시지 전송 요청 글 카테고리 :"+messageDto.getMsg_category());
			msgMap = cs.sendMsg(messageDto);
			return msgMap;
		}
		
		//내 쪽지 페이지 호출 메시지 리스트요청
		@RequestMapping(value = "/messageList", method = RequestMethod.GET)
		public ModelAndView messageList(MessageDto messageDto){
			System.out.println("내 쪽지 리스트 호출 카테고리 : "+messageDto.getMsg_category());		
			mav = new ModelAndView();		
			mav = cs.messageList(messageDto);
			
			System.out.println("쪽지 리스트 리턴 하는지");
			return mav;
		}		
		
		//메시지 디테일 페이지 이동 요청
		@RequestMapping(value = "/messageDetailView", produces = "application/json; charset=utf8")
		public @ResponseBody Map<String, Object> messageDetailView(MessageDto messageDto) {		
			System.out.println("디테일 페이지 이동 아작스 가즈아");
			msgMap = new HashMap<String, Object>();			
			msgMap.put("msg_category", messageDto.getMsg_category());
			msgMap.put("msg_sendnick", messageDto.getMsg_sendnick());
			msgMap.put("msg_recivenick", messageDto.getMsg_recivenick());
			msgMap.put("b_idx", messageDto.getB_idx());
			msgMap.put("msg_idx", messageDto.getMsg_idx());
			msgMap.put("c_num", messageDto.getC_num());
			msgMap.put("c_idx", messageDto.getC_idx());			
			
			return msgMap;
			
		}
		
		//정정요청 메시지 디테일 페이지 이동 요청
		@RequestMapping(value = "/dealModifyMessageDetail", produces = "application/json; charset=utf8")
		public @ResponseBody Map<String, Object> dealModifyMessageDetail(MessageDto messageDto) {		
			System.out.println("정정요청 메시지 디테일 페이지 이동 아작스 가즈아");
			msgMap = new HashMap<String, Object>();
			msgMap.put("msg_category", messageDto.getMsg_category());
			msgMap.put("msg_sendnick", messageDto.getMsg_sendnick());
			msgMap.put("msg_recivenick", messageDto.getMsg_recivenick());
			msgMap.put("b_idx", messageDto.getB_idx());
			
			return msgMap;
			
		}
		
		//메세지 상세보기
		@RequestMapping(value = "/messageDetail", method = RequestMethod.GET)
		public ModelAndView messageDetail(MessageDto messageDto){
			System.out.println("메시지 내용 상세보기"+messageDto.getB_idx()+"/보낸사람//"+messageDto.getMsg_sendnick()+"/받는사람//"+messageDto.getMsg_recivenick());			
			mav = new ModelAndView();		
			mav = cs.messageDetail(messageDto);
			
			System.out.println("쪽지 상세정보 리턴 하는지");
			return mav;
		}
		
		//신고요청
		@RequestMapping(value = "/reportForm", produces = "application/json; charset=utf8")
		public @ResponseBody Map<String, Object> reportForm(BoardDto boardDto, CategoryDto categorydto) {		
			System.out.println("나쁜놈 신고하기, 용달도 신청하기");			
			msgMap = new HashMap<String, Object>();
			
			msgMap.put("b_idx", boardDto.getB_idx());
			msgMap.put("c_idx", categorydto.getC_idx());
			msgMap.put("c_num", categorydto.getC_num());
			
			return msgMap;
		}
		
}
