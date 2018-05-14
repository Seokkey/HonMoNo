package com.project.honMoNo;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.dto.BoardDto;
import com.project.dto.CategoryDto;
import com.project.service.ShopBoardService;

@Controller
public class ShopController {

	
	@Autowired
	ShopBoardService sbs;	
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	MultipartHttpServletRequest multi;
	
	//매장정보  글쓰기 폼
		@RequestMapping(value = "/shopWriteForm", method = RequestMethod.GET)
		public ModelAndView shopWriteForm(CategoryDto categorydto) {	
			ModelAndView mav = new ModelAndView();
			
			mav.addObject("c_idx",categorydto.getC_idx());
			mav.addObject("c_num",categorydto.getC_num());
			mav.addObject("categorydto",categorydto);
			mav.setViewName("shop/shopWriteForm");		
			return mav;
		}
		
		//매장정보 글쓰기
		@RequestMapping(value="/shopWrite", method = RequestMethod.POST)
		public ModelAndView useWrite(BoardDto boarddto, MultipartHttpServletRequest multi){
			ModelAndView mav = new ModelAndView();
			System.out.println("매장정보 글쓰기");
			
			int c_num= Integer.parseInt(multi.getParameter("c_num"));	
			System.out.println("c_num : "+c_num);
			System.out.println(boarddto.getFilechk());
			System.out.println(multi);
			
			mav=sbs.shopWrite(boarddto,multi);
			mav.addObject("c_num",c_num);
			mav.addObject("c_idx",Integer.parseInt(multi.getParameter("c_idx")));
			return mav;		
		}
		//매장정보 상세보기
		@RequestMapping(value="/shopDetail",method=RequestMethod.GET)
		public ModelAndView useDetail(CategoryDto categorydto){
			ModelAndView mav = new ModelAndView();
			System.out.println("매장정보 상세보기");
			int c_num = categorydto.getC_num();
			int c_idx= categorydto.getC_idx();
			int b_idx = Integer.parseInt(request.getParameter("b_idx"));
			mav = sbs.shopDetail(b_idx);
			mav.addObject("c_num", c_num);
			mav.addObject("c_idx",c_idx);
			mav.addObject("categorydto", categorydto);
			return mav;
		}
		//매장정보 수정폼이동
		@RequestMapping(value="/shopUpdateForm",method=RequestMethod.GET)
		public ModelAndView shopUpdateForm(CategoryDto categorydto){
			ModelAndView mav = new ModelAndView();
			
			int b_idx = Integer.parseInt(request.getParameter("b_idx"));
			mav = sbs.shopDetail(b_idx);
			mav.addObject("c_idx",categorydto.getC_idx());
			mav.addObject("c_num",categorydto.getC_num());
			mav.addObject("categorydto",categorydto);
			mav.setViewName("shop/shopUpdateForm");		
			return mav;
		}
		//매장정보 업데이트 
			@RequestMapping(value = "/shopUpdate", method = RequestMethod.POST)
			public ModelAndView shopUpdate(BoardDto boarddto, MultipartHttpServletRequest multi,CategoryDto categorydto) {	
				ModelAndView mav = new ModelAndView();
				System.out.println("수정하기");
				int b_idx = Integer.parseInt(request.getParameter("b_idx"));
				mav = sbs.shopUpdate(boarddto,multi);
				mav.addObject("c_idx",categorydto.getC_idx());
				mav.addObject("c_num",categorydto.getC_num());
				mav.addObject("categorydto",categorydto);	
				return mav;
				}
			
			//매장정보 삭제
			@RequestMapping(value="/shopDel", method=RequestMethod.GET)
			public ModelAndView shopDel(CategoryDto categorydto){
				System.out.println("매장정보 삭제");
				ModelAndView mav = new ModelAndView();
				
				mav=sbs.shopDel();
				mav.addObject("c_idx",categorydto.getC_idx());
				mav.addObject("c_num",categorydto.getC_num());
				mav.addObject("categorydto",categorydto);
				return mav;
			}
}











