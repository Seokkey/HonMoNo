package com.project.honMoNo;

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
import com.project.service.EstiBoardService;
import com.project.service.EvBoardService;
import com.project.service.QnaBoardService;
import com.project.service.ShopBoardService;
import com.project.service.UsedBoardService;


@Controller
public class MoveController {
	
	@Autowired
	private CategoryService cs;
	@Autowired
	private EvBoardService evbs;
	@Autowired
	private EstiBoardService ebs;
	@Autowired
	private UsedBoardService ubs;

	@Autowired
	private QnaBoardService qbs;

	
	@Autowired
	ShopBoardService sbs;

	@Autowired	
	private HttpServletRequest request;
	
	
	//메인페이지 호출
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		
		return mav;
	}
	
	//메인 메뉴바 불러오기
	@RequestMapping(value = "/maincategory",  produces = "application/json; charset=utf8")
	public @ResponseBody Map<String,List<CategoryDto>> rcontents(CategoryDto categorydto ) {
		System.out.println("ㅇ,ㅇ?");
		Map<String,List<CategoryDto>> cMap=cs.getMainCate();
		System.out.println(cMap);
		return cMap;
	}
	
	//내 견적 페이지 호출
	@RequestMapping(value = "/myEstimate", method = RequestMethod.GET)
	public ModelAndView myEstimate() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myPage/myEstimate");
		
		return mav;
	}
	
	//내 중고 페이지 호출
	@RequestMapping(value = "/myUsed", method = RequestMethod.GET)
	public ModelAndView myUsed() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("used/usedList");
		
		return mav;
	}	
	
	
	//내 도면 페이지 호출
	@RequestMapping(value = "/planDrawingList", method = RequestMethod.GET)
	public ModelAndView planDrawingList() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("canvas/canvasList");
		
		return mav;
	}
	
	//도면 그리기 호출
	@RequestMapping(value = "/planDrawingWrite", method = RequestMethod.GET)
	public ModelAndView planDrawingWrite() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("canvas/canvasWrite");
		
		return mav;
	}
	
	/*
	//아이디 찾기1 호출
	@RequestMapping(value = "/myIdFind", method = RequestMethod.GET)
	public ModelAndView myIdFind() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myIdFind");
		
		return mav;
	}
	
	//아이디 찾기2 호출
	@RequestMapping(value = "/myIdFind2", method = RequestMethod.GET)
	public ModelAndView myIdFind2() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myIdFind2");
		
		return mav;
	}
	
	//비밀번호 찾기 호출
	@RequestMapping(value = "/myPwFind", method = RequestMethod.GET)
	public ModelAndView myPwFind() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myPwFind");
		
		return mav;
	}
	*/
	
	//관리자 1:1대화 페이지 호출
	@RequestMapping(value = "/noteSendAdmin", method = RequestMethod.GET)
	public ModelAndView noteSendAdmin() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("noteSendAdmin");
		
		return mav;
	}
	
	//관리자 1:1대화 페이지 호출
	@RequestMapping(value = "/noteListAdmin", method = RequestMethod.GET)
	public ModelAndView noteListAdmin() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("noteListAdmin");
		
		return mav;
	}
	
	//가입대기 업체리스트 호출
	@RequestMapping(value = "/adminUserList1", method = RequestMethod.GET)
	public ModelAndView userList1() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/adminUserList1");
		
		return mav;
	}
	
	//소비자 회원 리스트 호출
	@RequestMapping(value = "/adminUserList2", method = RequestMethod.GET)
	public ModelAndView userList2() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/adminUserList2");
		
		return mav;
	}
	
	//업체 회원 리스트 호출
	@RequestMapping(value = "/adminUserList3", method = RequestMethod.GET)
	public ModelAndView userList3() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/adminUserList3");
		
		return mav;
	}
	
	//용달 리스트 페이지 호출
	@RequestMapping(value = "/deliveryList", method = RequestMethod.GET)
	public ModelAndView deliveryList() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/adminDeliveryList");
		
		return mav;
	}
	
	//게시판 카테고리 수정 페이지 호출
	@RequestMapping(value = "/boardCategory", method = RequestMethod.GET)
	public ModelAndView boardCategory() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/adminCategoryUpdate");
		
		return mav;
	}
	
	//도면 그리기 호출
	@RequestMapping(value = "/a", method = RequestMethod.GET)
	public ModelAndView aaa() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("noteView");
		
		return mav;
	}
	
	//관심게시판 이동
	@RequestMapping(value = "/myFavoriteMove", method = RequestMethod.GET)
	public ModelAndView myFavoriteMove() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("myPage/myFavoriteBbsList");
		
		return mav;
	}
	
	//회원가입 선택 폼 이동
	@RequestMapping(value = "/memberJoinChoice", method = RequestMethod.GET)
	public ModelAndView memberJoinChoice() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("member/memberJoinChoice");
		
		return mav;
	}
	
	//리스트 페이지 호출
	@RequestMapping(value = "/listCall", method = RequestMethod.GET)
	public ModelAndView listCall(CategoryDto cdto) {	
		ModelAndView mav = new ModelAndView();
		BoardDto boarddto = new BoardDto();
		switch (cdto.getC_num()) {
		
		case 0:
			if(cdto.getC_idx()==6){
				mav=evbs.noticeBoardList();
				mav.setViewName("event/noticeView");
			}else{
				
				System.out.println("listCall idx:"+cdto.getC_idx());
				System.out.println("listCall c_num:"+cdto.getC_num());	
				
				mav=evbs.evBoardList();
			}
			break;
			
		case 1:
			if(cdto.getC_idx()==8){
				mav.setViewName("estimate/estimatePage");
			}else{
				System.out.println("견적문의 리스트 요청");
				mav=ebs.estiBoardList();
				/*소분류 가져오기*/
			}
			break;
			
		case 2:
			if(cdto.getC_idx()==12){
				mav.setViewName("used/usedGuide");
			}else{								
				mav=ubs.usedboardList(cdto);
			}
			break;
			
		case 3:
			if(cdto.getC_idx()==16){
				mav.setViewName("shop/shopGuide");
			}else{
				mav=sbs.shopboardList(cdto);
			}
			break;
			
		case 4:
			if(cdto.getC_idx()==20){
				System.out.println("자주묻는질문");
				mav=qbs.qnaList(cdto);
				mav.addObject("cdto", cdto);
				mav.setViewName("QnA/qnaList");
			}else if(cdto.getC_idx()==21){
				System.out.println("1대1 문의작성");
				mav.addObject("cdto", cdto);
				mav.setViewName("QnA/directQWriteForm");
			}else{
				System.out.println("1대1 문의리스트");
				mav=qbs.directQList(cdto);
				mav.addObject("cdto", cdto);
				mav.setViewName("QnA/directQList");
			}
			break;

		default:
			break;
		}
		
		mav.addObject("categorydto", cdto);
		mav.addObject("c_idx", cdto.getC_idx());
		return mav;
	}
	/*
	//메세지 폼 요청
	@RequestMapping(value = "/messageForm", method = RequestMethod.GET)
	public ModelAndView messageForm(MessageDto messageDto, CategoryDto categoryDto) {	
		System.out.println("메시지 폼 요청 nick:"+messageDto.getMsg_sendnick());
		ModelAndView mav = new ModelAndView();		
		mav.addObject("messageDto",messageDto);
		mav.addObject("categoryDto",categoryDto);
		mav.addObject("b_idx", request.getParameter("b_idx"));
		System.out.println("메시지폼에 보내줄 c_num:"+categoryDto.getC_num());
		mav.setViewName("message/messageForm");		
		return mav;
	}*/	
	
}
