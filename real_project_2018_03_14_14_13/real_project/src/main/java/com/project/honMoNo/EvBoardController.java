package com.project.honMoNo;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.dto.BoardDto;
import com.project.dto.CategoryDto;
import com.project.service.EvBoardService;

@Controller
public class EvBoardController {
	
	@Autowired
	private EvBoardService evbs;
	@Autowired
	private HttpServletRequest request;	
	
	//공지사항 리스트 요청 안 탈 수도있음.
		@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
		public ModelAndView estiBoardList() {		
			
			System.out.println("공지사항 리스트 요청");
			ModelAndView mav = new ModelAndView();
			mav=evbs.noticeBoardList();
			/*소분류 가져오기*/
			
			return mav;
		}
		
		//공지사항 글쓰기폼 요청
		@RequestMapping(value = "/noticeWriteForm", method = RequestMethod.GET)
		public ModelAndView noticeWriteForm(CategoryDto categorydto) {		
			//세션체크 해야함
			System.out.println("견적문의 글쓰기폼 요청");
			ModelAndView mav = new ModelAndView();
			mav=evbs.noticeWriteForm(categorydto);
			return mav;
		}
		
		//공지사항 상세보기 요청
		@RequestMapping(value = "/noticeDetail", method = RequestMethod.GET)
		public ModelAndView estiDetail(CategoryDto categorydto) {
			System.out.println("공지사항 상세보기 요청");
			System.out.println(request.getParameter("c_name"));
			ModelAndView mav = new ModelAndView();
			mav=evbs.noticeDetail(categorydto);
			
			return mav;
		}
		
		//공지사항 글 등록 요청
		@RequestMapping(value = "/noticeBoardWrite", method = RequestMethod.POST)
		public ModelAndView estiBoardWrite(BoardDto board) throws IOException {		
			//세션체크 해야함
			System.out.println("견적문의 글 등록 요청");
			ModelAndView mav = new ModelAndView();
			mav=evbs.noticeBoardWrite(board);
			int c_idx=Integer.parseInt(request.getParameter("c_idx"));
			mav.addObject("c_idx", c_idx);
			return mav;
		}
		
		
		//공지 업데이트폼 요청
		@RequestMapping(value = "/noticeUpdateForm", method = RequestMethod.GET)
		public ModelAndView noticeUpdateForm(CategoryDto categorydto) {		
			//세션체크 해야함
			System.out.println("공지 업데이트폼 요청");
			ModelAndView mav = new ModelAndView();
			mav=evbs.noticeDetail(categorydto);
			mav.addObject("c_idx",categorydto.getC_idx());
			mav.addObject("c_num",categorydto.getC_num());
			mav.addObject("categorydto",categorydto);
			mav.setViewName("event/noticeUpdateForm");
			return mav;
		}
		
		
		//공지 업데이트
		@RequestMapping(value = "/noticeBoardUpdate", method = RequestMethod.POST)
		public ModelAndView noticeUpdate(CategoryDto categorydto,BoardDto boarddto) {		
			//세션체크 해야함
			System.out.println("공지 업데이트");
			ModelAndView mav = new ModelAndView();
			mav=evbs.noticeUpdate(boarddto);
			mav.addObject("c_idx",categorydto.getC_idx());
			mav.addObject("c_num",categorydto.getC_num());
			mav.addObject("categorydto",categorydto);
			return mav;
		}
		
		//공지 삭제
		@RequestMapping(value="/noticeDel", method=RequestMethod.GET)
		public ModelAndView noticeDel(CategoryDto categorydto){
			System.out.println("공지 삭제");
			ModelAndView mav = new ModelAndView();
			
			mav=evbs.noticeDel();
			mav.addObject("c_idx",categorydto.getC_idx());
			mav.addObject("c_num",categorydto.getC_num());
			mav.addObject("categorydto",categorydto);
			return mav;
		}
		//이벤트 글쓰기폼 요청
		@RequestMapping(value = "/evWriteForm", method = RequestMethod.GET)
		public ModelAndView evWriteForm(CategoryDto categorydto) {		
			//세션체크 해야함
			System.out.println("이벤트 글쓰기폼 요청");
			ModelAndView mav = new ModelAndView();
			mav=evbs.evWriteForm(categorydto);
			return mav;
		}
		
		//이벤트 글쓰기 요청
		@RequestMapping(value = "/evWrite", method = RequestMethod.POST)
		public ModelAndView evWrite(BoardDto boarddto, CategoryDto categorydto, MultipartHttpServletRequest multi) {		
			//세션체크 해야함
			System.out.println("이벤트 글쓰기 요청");
			System.out.println("evWrite : "+categorydto.getC_num());
			System.out.println("evWrite : "+categorydto.getC_idx());
			
			ModelAndView mav = new ModelAndView();
			mav=evbs.evWrite(boarddto, multi);
			mav.addObject("c_idx", categorydto.getC_idx());
			mav.addObject("c_num", categorydto.getC_num());
			return mav;
		}
		//이벤트 상세보기
		@RequestMapping(value="/evDetail",method=RequestMethod.GET)
		public ModelAndView evDetail(CategoryDto categorydto){
			ModelAndView mav = new ModelAndView();
			System.out.println("이벤트 상세보기");
			int c_num = categorydto.getC_num();
			int c_idx= categorydto.getC_idx();
			int b_idx = Integer.parseInt(request.getParameter("b_idx"));
			mav = evbs.evDetail(b_idx);
			mav.addObject("c_num", c_num);
			mav.addObject("c_idx",c_idx);
			return mav;
		}
		//이벤트 수정폼이동
	@RequestMapping(value="/evUpdateForm",method=RequestMethod.GET)
	public ModelAndView evUpdateForm(CategoryDto categorydto){
		ModelAndView mav = new ModelAndView();
		int b_idx = Integer.parseInt(request.getParameter("b_idx"));
		mav = evbs.evDetail(b_idx);
		mav.addObject("c_idx",categorydto.getC_idx());
		mav.addObject("c_num",categorydto.getC_num());
		mav.addObject("categorydto",categorydto);
		mav.setViewName("event/evUpdateForm");		
		return mav;
	}
	//이벤트 업데이트 
	@RequestMapping(value = "/evUpdate", method = RequestMethod.POST)
	public ModelAndView evUpdate(BoardDto boarddto, MultipartHttpServletRequest multi,CategoryDto categorydto) {	
		ModelAndView mav = new ModelAndView();
		System.out.println("수정하기");
		int b_idx = Integer.parseInt(request.getParameter("b_idx"));
		mav = evbs.evUpdate(boarddto,multi);
		mav.addObject("c_idx",categorydto.getC_idx());
		mav.addObject("c_num",categorydto.getC_num());
		mav.addObject("categorydto",categorydto);	
		return mav;
		}
	
	@RequestMapping(value="/evDel", method=RequestMethod.GET)
	public ModelAndView evDel(CategoryDto categorydto){
		System.out.println("이벤트 삭제");
		ModelAndView mav = new ModelAndView();
		
		mav=evbs.evbsDel();
		mav.addObject("c_idx",categorydto.getC_idx());
		mav.addObject("c_num",categorydto.getC_num());
		mav.addObject("categorydto",categorydto);
		return mav;
	}

}
