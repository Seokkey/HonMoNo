package com.project.honMoNo;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.dto.BoardDto;
import com.project.dto.CategoryDto;
import com.project.dto.MessageDto;
import com.project.dto.ReplyDto;
import com.project.service.UsedBoardService;

@Controller
public class usdeBoardController {

	@Autowired
	private UsedBoardService ubs;
	
	@Autowired
	HttpServletRequest request;
		
	@Autowired
	MultipartHttpServletRequest multi;
	
	//중고거래 글쓰기 폼
	@RequestMapping(value = "/usedWriteForm", method = RequestMethod.GET)
	public ModelAndView usedWriteForm(CategoryDto categorydto) {	
		ModelAndView mav = new ModelAndView();
		
		mav = ubs.getProduc(categorydto.getC_idx());
		mav.addObject("c_idx",categorydto.getC_idx());
		mav.addObject("c_num",categorydto.getC_num());
		mav.addObject("categorydto",categorydto);
		mav.setViewName("used/usedWriteForm");		
		return mav;
	}
	
	//중고거래 글쓰기
	@RequestMapping(value="/usedWrite", method = RequestMethod.POST)
	public ModelAndView useWrite(BoardDto boarddto, MultipartHttpServletRequest multi){
		ModelAndView mav = new ModelAndView();
		System.out.println("중고 거래 글쓰기");
		
		int c_num= Integer.parseInt(multi.getParameter("c_num"));	
		System.out.println("c_num : "+c_num);
		System.out.println(boarddto.getFilechk());
		System.out.println(multi);
		
		mav=ubs.useWrite(boarddto,multi);
		mav.addObject("c_num",c_num);
		mav.addObject("c_idx",Integer.parseInt(multi.getParameter("c_idx")));
		return mav;		
	}
	
	//중고거래 상세보기
	@RequestMapping(value="/usedDetail",method=RequestMethod.GET)
	public ModelAndView useDetail(CategoryDto categorydto){
		ModelAndView mav = new ModelAndView();
		System.out.println("중고거래 상세보기");
		int c_num = categorydto.getC_num();
		int c_idx= categorydto.getC_idx();		
		int b_idx = Integer.parseInt(request.getParameter("b_idx"));
		
		System.out.println("중고상세보기요청 c_num"+c_num);
		System.out.println("중고상세보기요청 c_idx"+c_idx);
		System.out.println("중고상세보기요청 b_idx"+b_idx);
		
		mav = ubs.usedDetail(b_idx);
		
		mav.addObject("c_num", c_num);
		mav.addObject("c_idx",c_idx);
		return mav;
	}
	
	//중고거래 댓글 쓰기
	@RequestMapping(value = "/usedReplyWrite",  produces = "application/json; charset=utf8")
	public @ResponseBody Map<String,List<ReplyDto>>usedReplyWrite(CategoryDto categorydto,ReplyDto replydto){		
		System.out.println("중고거래 댓글 쓰기: "+categorydto.getC_num());
	
		System.out.println("r_nick : "+replydto.getR_nick());
		Map<String,List<ReplyDto>> reply = ubs.getReplyList(replydto);
		System.out.println(reply);
		return reply;	
	}	
	
	//중고거래 업데이트 폼으로 이동
	@RequestMapping(value = "/usedUpdateForm", method = RequestMethod.GET)
	public ModelAndView usedUpdateForm(CategoryDto categorydto) {	
		ModelAndView mav = new ModelAndView();
		
		int b_idx = Integer.parseInt(request.getParameter("b_idx"));
		mav = ubs.usedDetail(b_idx);
		mav = ubs.getProduc(categorydto.getC_idx());
		mav.addObject("c_idx",categorydto.getC_idx());
		mav.addObject("c_num",categorydto.getC_num());
		mav.addObject("categorydto",categorydto);
		mav.setViewName("used/usedUpdateForm");		
		return mav;
		}
		//중고거래 업데이트 
		@RequestMapping(value = "/usedUpdate", method = RequestMethod.POST)
		public ModelAndView usedUpdate(BoardDto boarddto, MultipartHttpServletRequest multi,CategoryDto categorydto) {	
			ModelAndView mav = new ModelAndView();
			int b_idx = Integer.parseInt(request.getParameter("b_idx"));
			mav = ubs.usedUpdate(boarddto,multi);
			mav.addObject("c_idx",categorydto.getC_idx());
			mav.addObject("c_num",categorydto.getC_num());
			mav.addObject("categorydto",categorydto);	
			return mav;
		}
		//중고거래 삭제
		@RequestMapping(value = "/usedDel", method = RequestMethod.GET)
		public ModelAndView usedDel(CategoryDto categorydto) {	
			ModelAndView mav = new ModelAndView();
			
			mav=ubs.usedDel();
			mav.addObject("c_idx",categorydto.getC_idx());
			mav.addObject("c_num",categorydto.getC_num());
			mav.addObject("categorydto",categorydto);
			
			return mav;
		}
		//중고거래 댓글 삭제
		@RequestMapping(value = "/replyDel",  produces = "application/json; charset=utf8")
		public @ResponseBody Map<String,List<ReplyDto>>replyDel(CategoryDto categorydto,ReplyDto replydto){		
			System.out.println("중고거래 댓글 삭제: "+replydto.getR_idx());
			int r_idx = replydto.getR_idx();
			
			Map<String,List<ReplyDto>> reply = ubs.replyDel(r_idx);
			System.out.println(reply);
			return reply;
		}
		
		//중고거래 팝니다 거래요청 메시지 보내기
		@RequestMapping(value = "/sendSellmsg", method = RequestMethod.GET)
		public ModelAndView sendSellmsg(MessageDto messageDto) {	
			ModelAndView mav = new ModelAndView();
			
			System.out.println("가져온 b_idx"+messageDto.getB_idx());
			System.out.println("가져온 getC_num"+messageDto.getC_num());
			System.out.println("가져온 getMsg_sendnick"+messageDto.getMsg_sendnick());
			System.out.println("가져온 getC_idx"+messageDto.getC_idx());
			System.out.println("가져온 getMsg_recivenick"+messageDto.getMsg_recivenick());
			
			mav=ubs.sendSellmsg(messageDto);
			System.out.println("메시지 보내기 리턴하니?");
			return mav;
		}
		
		@RequestMapping(value = "/dealFinish", method = RequestMethod.GET)
		public ModelAndView dealFinish(BoardDto boarddto, CategoryDto categorydto) {	
			ModelAndView mav = new ModelAndView();
			int b_idx = Integer.parseInt(request.getParameter("b_idx"));
			mav = ubs.dealFinish(boarddto);
			mav.addObject("b_idx", b_idx);
			mav.addObject("c_idx",categorydto.getC_idx());
			mav.addObject("c_num",categorydto.getC_num());
			mav.addObject("categorydto",categorydto);	
			return mav;
		}
		
}
