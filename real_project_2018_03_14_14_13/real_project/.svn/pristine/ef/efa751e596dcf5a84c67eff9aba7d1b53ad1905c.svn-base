package com.project.honMoNo;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.dto.BoardDto;
import com.project.dto.CategoryDto;
import com.project.service.QnaBoardService;

@Controller
public class QnaController {

	@Autowired	
	private HttpServletRequest request;
	
	@Autowired
	private QnaBoardService qbs;

	

	//1대1 문의 글쓰기
	@RequestMapping(value = "/directQWrite", method = RequestMethod.POST)
	public ModelAndView directQWrite(BoardDto boarddto) {	
		System.out.println("1대1문의하기 글쓰기");
		ModelAndView mav = new ModelAndView();
		
		int c_num= Integer.parseInt(request.getParameter("c_num"));	
		System.out.println("c_num : "+c_num);
		mav=qbs.dircetQWrite(boarddto);
		mav.addObject("c_num",c_num);
		mav.addObject("c_idx",22);
		return mav;
	}
	//1대1 문의 리스트
	@RequestMapping(value = "/directQList", method = RequestMethod.GET)
	public ModelAndView directQList(CategoryDto categorydto) {	
		System.out.println("1대1문의 리스트");
		ModelAndView mav = new ModelAndView();
		mav=qbs.directQList(categorydto);
		
		mav.addObject("c_num",Integer.parseInt(request.getParameter("c_num")));
		mav.addObject("c_idx",Integer.parseInt(request.getParameter("c_idx")));
		mav.addObject("categorydto", categorydto);
		mav.setViewName("QnA/directQList");
		return mav;
	}
	
	//1대1 상세보기
	@RequestMapping(value="/directQDetail",method=RequestMethod.GET)
	public ModelAndView directQDetail(CategoryDto categorydto){
		ModelAndView mav = new ModelAndView();
		System.out.println("1대1 문의 내역  보기 상세보기");
		int c_num = categorydto.getC_num();
		int c_idx= categorydto.getC_idx();
		int b_idx = Integer.parseInt(request.getParameter("b_idx"));
		mav = qbs.directQDetail(b_idx);
		mav.addObject("c_num", c_num);
		mav.addObject("c_idx",c_idx);
		return mav;
	}
	//1대1 답변달기
	@RequestMapping(value="/directQUpdate",method=RequestMethod.GET)
	public ModelAndView directQUpdate(CategoryDto categorydto,BoardDto boarddto){
		ModelAndView mav = new ModelAndView();
		System.out.println("1대1 문의 내역  답변 ");
		int c_num = categorydto.getC_num();
		int c_idx= categorydto.getC_idx();
		mav = qbs.directQUpdate(boarddto);
		mav.addObject("c_num", c_num);
		mav.addObject("c_idx",c_idx);
		mav.addObject("b_idx", boarddto.getB_idx());
		return mav;
		}
	//qna 글쓰기폼
		@RequestMapping(value = "/qnaWriteForm", method = RequestMethod.GET)
		public ModelAndView qnaWriteForm(CategoryDto categorydto) {	
			System.out.println("자주묻는 질문 글쓰기폼");
			ModelAndView mav = new ModelAndView();
		
			mav.addObject("c_num",categorydto.getC_num());
			mav.addObject("c_idx", categorydto.getC_idx());
			mav.addObject("categorydto",categorydto);
			mav.setViewName("QnA/qnaWriteForm");
			return mav;
		}
			
		//qna 문의 글쓰기
		@RequestMapping(value = "/qnaWrite", method = RequestMethod.POST)
		public ModelAndView qnaWrite(BoardDto boarddto) {	
			System.out.println("자주묻는질문 글쓰기");
			ModelAndView mav = new ModelAndView();
			
			int c_idx = Integer.parseInt(request.getParameter("c_idx"));
			int c_num= Integer.parseInt(request.getParameter("c_num"));	
			System.out.println("c_num : "+c_num);
			
			mav=qbs.qnaWrite(boarddto);
			mav.addObject("c_num",c_num);
			mav.addObject("c_idx",c_idx);
			return mav;
		}
}
