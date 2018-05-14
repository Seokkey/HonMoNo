package com.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.project.dao.BoardDao;
import com.project.dao.CategoryDao;
import com.project.dto.BoardDto;
import com.project.dto.CategoryDto;



@Service
public class QnaBoardService {

	@Autowired
	private BoardDao bDao;
	@Autowired
	private CategoryDao cDao;

	private ModelAndView mav;

	@Autowired
	HttpServletRequest request;

	//1대1문의 작성
	public ModelAndView dircetQWrite(BoardDto boarddto) {
		mav= new ModelAndView();
		String b_nick=(String) request.getSession().getAttribute("loginNick");
		boarddto.setB_nick(b_nick);
		System.out.println(boarddto.getB_nick());
		String view="";
		int writesu =-1;
		int success = bDao.dircetQWrite(boarddto);
		if(success == 1){
			 writesu=bDao.directQWrites(boarddto);
		}
		if(writesu == 1){
			System.out.println("쿠웨우케ㅜㅋ에ㅜㅋ에ㅜ케우");
			view="redirect:/listCall";
		}else{
			System.out.println("여기타나요?");
			view="QnA/directQWriteForm";
		}
		mav.setViewName(view);
		return mav;
	}

	//1대1문의 리스트
	public ModelAndView directQList(CategoryDto categorydto) {
		Map<Object,Object> map = new HashMap<>();
		
		String page = request.getParameter("page");
		int c_idx = categorydto.getC_idx();
		System.out.println("1대1문의 리스트 c_idx : "+ c_idx);
		
		String nick=(String) request.getSession().getAttribute("loginNick");		
		System.out.println("1대1문의 리스트 ///b_nick : "+nick);
		
		String  rating =(String) request.getSession().getAttribute("loginRating");
		
		if(rating == null){
			mav =  new ModelAndView();
			mav.addObject("c_idx",c_idx);
			mav.setViewName("QnA/directQList");
		}else{
			map.put("rating",rating);
			map.put("c_idx",c_idx);
			map.put("b_nick",nick);
			

			map.put("page",page);
			
			//page는 현재 페이지 , spage는 현재 페이지 번호 만듬
		 	 int spage=1 ;//   
		 	 
			 if(page !=null){
				 spage = Integer.parseInt(page);
			 }
			 int start = spage;
			
			 int listCount = bDao.directlistcount(map);//게시물 총 개수
				System.out.println("usedlistCount : "+listCount);
				
				map.put("start",start);
				System.out.println("map : " + map);
				
				List<BoardDto> directlist=bDao.directlist(map);
				int countPage = 10;//한 화면에 보여질 페이지 개수
			        int maxPage = (int)(listCount/10.0); //마지막 페이지
			        if (listCount % 10 > 0) {
			        	maxPage++;
			        	};
			        if (maxPage < spage) {
			            spage = maxPage;
			        	};
			        //시작 페이지 번호
			        int startPage = (int)((spage - 1) / 10) * 10 + 1;
			        
			        //한 화면에 보여지는 마지막 페이지 번호
			        int endPage = startPage + countPage-1;
			        if(endPage > maxPage) {
			        	endPage = maxPage;
			        };
			        mav =  new ModelAndView();
			        mav.addObject("spage",spage);				
					mav.addObject("maxPage", maxPage);
					mav.addObject("startPage", startPage);
					mav.addObject("endPage", endPage);
					mav.addObject("directlist", directlist);
					mav.addObject("c_num",Integer.parseInt(request.getParameter("c_num")));
					mav.addObject("c_idx",c_idx);
					System.out.println("1대1문의  보내는 리스트 : "+spage+"//"+directlist);
					mav.setViewName("QnA/directQList");
					
		}
		
				return mav;
		
	}

	//1대1문의 상세보기
	public ModelAndView directQDetail(int b_idx) {
		   mav =  new ModelAndView();
		BoardDto boarddto = new BoardDto();
		boarddto=bDao.directQDetail(b_idx);
		
		mav.addObject("boarddto", boarddto);
		System.out.println("boarddto : " + boarddto);
		
		mav.setViewName("QnA/directQDetail");
		return mav;
	}

	//1대1 문의 답변달기
	public ModelAndView directQUpdate(BoardDto boarddto) {
		   mav =  new ModelAndView();
		System.out.println("s체케츠케ㅡ켗 : "+boarddto.getSup_answer());
		int success = bDao.directQUpdate(boarddto);
		String view="redirect:directQDetail";
		if(success != 0){
			mav.addObject("msg","답변달기 성공");
		}else{
			mav.addObject("msg","답변달기 실패");
			
		}
		mav.setViewName(view);
		return mav;
	}

	public ModelAndView qnaList(CategoryDto categorydto) {
		mav= new ModelAndView();
		List<BoardDto> qnaList = bDao.qnaList(categorydto.getC_idx());
		
		mav.addObject("qnaList", qnaList);
		return mav;
	}

	public ModelAndView qnaWrite(BoardDto boarddto) {
	    mav =  new ModelAndView();
	    String view="";
		String b_nick=(String) request.getSession().getAttribute("loginNick");
		boarddto.setB_nick(b_nick);
		System.out.println(boarddto.getB_nick());
		int success=bDao.qnaWrite(boarddto);
		if(success == 1){
			view="redirect:/listCall";
		}else{
			view="redirect:/qnaWriteForm";
		}
		 mav.setViewName(view);
		return mav;
	}
}





















