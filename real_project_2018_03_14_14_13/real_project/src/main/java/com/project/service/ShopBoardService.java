package com.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.dao.BoardDao;
import com.project.dao.CategoryDao;
import com.project.dto.BoardDto;
import com.project.dto.CategoryDto;
import com.project.dto.PhotoDto;
import com.project.useClass.UploadFile;

@Service
public class ShopBoardService {

	@Autowired
	private BoardDao bDao;
	@Autowired
	private CategoryDao cDao;
	
	private ModelAndView mav;
	

	@Autowired
	UploadFile upload;
	
	@Autowired
	HttpServletRequest request;

	//매장정보 리스트
	public ModelAndView shopboardList(CategoryDto categorydto) {
		ModelAndView mav = new ModelAndView();
		Map<Object,Object> map = new HashMap<>();
		BoardDto boarddto = new BoardDto();
		
		String page = request.getParameter("page");
		int c_idx = categorydto.getC_idx();
		System.out.println("중고거래 리스트 c_idx : "+ c_idx);
		String nick=(String) request.getSession().getAttribute("loginNick");		
		System.out.println("중고거래 리스트 ///b_nick : "+nick);
		map.put("c_idx",c_idx);
		
		int faEx;		
		if(nick == null){
			faEx =0;
		}else{
			map.put("b_nick",nick);
			faEx= cDao.getFavorite(map);
		}		
		System.out.println("faEx : "+faEx);
		int c_num = categorydto.getC_num();
		String search =request.getParameter("search");
		String keyword = request.getParameter("keyword");	
		
		map.put("keyword",keyword);
		map.put("search", search);
		map.put("page",page);
	
		
		System.out.println("c_idx : "+categorydto.getC_idx());
		System.out.println(" 확인 : "+keyword+"//"+search+"//");
	//page는 현재 페이지 , spage는 현재 페이지 번호 만듬
	 	 int spage=1 ;//   
	 	 
		 if(page !=null){
			 spage = Integer.parseInt(page);
		 }
		 int start = spage;
		
	  //start는 dao에서 set string에 넣어주는데 한 페이지에 보여줄 게시물을 start , start+a 로 표현 

	  // 한 화면에 10개의 게시글을 보여지게함
	  // 페이지 번호는 총 10개, 이후로는 [다음]으로 표시	        
	  // 전체 페이지 수
		 //글개수
		int listCount = bDao.shoplistcount(map);//게시물 총 개수
		System.out.println("usedlistCount : "+listCount);
		
		map.put("start",start);
		System.out.println("map : " + map);
		
		//리스트가져오기
		List<BoardDto> shopList=bDao.shopList(map);
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
	     List<Object> list = new ArrayList<>();
	     int b_idx;
	     for(int i=0; i<shopList.size(); i++){	  
	    	 b_idx=shopList.get(i).getB_idx();
	    	 System.out.println(b_idx);
	    	 list.add(b_idx);	    	 
	     }
	    map.put("list",list);
	    System.out.println("map : "+map.get("list"));
	    List<PhotoDto> photoList = bDao.getFile(map);
	    System.out.println("매장정보 photoList : "+photoList);
		mav =  new ModelAndView();
		mav.addObject("photoList", photoList);
		mav.addObject("spage",spage);
		mav.addObject("searchlist", map);		
		mav.addObject("shopList", shopList);
		mav.addObject("c_num", c_num);
		mav.addObject("maxPage", maxPage);
		mav.addObject("startPage", startPage);
		mav.addObject("endPage", endPage);
		mav.addObject("c_idx",c_idx);
		mav.addObject("faEx", faEx);
		/*mav.addObject("photodto", photodto);*/
		System.out.println("매장정보 보내는 리스트 : "+spage+"//"+shopList);
		mav.setViewName("shop/shopList");
		return mav;
	}

	//매장정보 글쓰기
	public ModelAndView shopWrite(BoardDto boarddto, MultipartHttpServletRequest multi) {
		
		mav= new ModelAndView();
		System.out.println(boarddto.getFilechks());
		System.out.println(boarddto.getSh_brand());		
		
		System.out.println("filechk : "+boarddto.getFilechk());
		
		String b_nick=(String) request.getSession().getAttribute("loginNick");
		boarddto.setB_nick(b_nick);
		System.out.println("bDao : "+ bDao);
		int b = bDao.shopWrite(boarddto);		
		int u = -1 ;
		int f= -1;
		if(b == 1){
			System.out.println("b_idx : "+boarddto.getB_idx());
			u= bDao.shopsWrite(boarddto);
		}	
		
		String inDate   = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
		System.out.println(inDate);
		
		if(boarddto.getFilechk() == 1 && u ==1){
			List<MultipartFile> mf = multi.getFiles("imgfile");
			int b_idx = boarddto.getB_idx();
			System.out.println("ㅇ파일 b_idx : "+b_idx);
			f=upload.fileUp(multi,inDate,b_idx,mf);			
		}
		if(boarddto.getFilechks() == 3 && u ==1){
			List<MultipartFile> mf = multi.getFiles("imgfile1");
			int b_idx = boarddto.getB_idx();
			System.out.println("ㅇ파일 b_idx : "+b_idx);
			f=upload.fileUp(multi,inDate,b_idx,mf);		
		}
		
		String view="";
		if(f == 1 && u==1){
			view="redirect:/listCall";
			System.out.println("쿠퀘퀘퀘퀘퀘");
		}else{
			view="/shopWriteForm";
		}
		mav.setViewName(view);
		return mav;
	}

	//매장정보 상세보기
	public ModelAndView shopDetail(int b_idx) {
		BoardDto boarddto = new BoardDto();
		boarddto=bDao.shopDetail(b_idx);
		List<PhotoDto> shopPhotoList = bDao.shopPhoto(b_idx);
		mav=new ModelAndView();
		mav.addObject("boarddto", boarddto);
		mav.addObject("shopPhotoList", shopPhotoList);
		mav.setViewName("shop/shopDeatil");
		return mav;
	}

	//매장정보 수정하기
	public ModelAndView shopUpdate(BoardDto boarddto, MultipartHttpServletRequest multi) {
		String view="";
		mav= new ModelAndView();
		System.out.println(boarddto.getFilechks());
		System.out.println(boarddto.getSh_brand());		
		
		System.out.println("filechk : "+boarddto.getFilechk());
		System.out.println("filechks : "+boarddto.getFilechks());
		
		String b_nick=(String) request.getSession().getAttribute("loginNick");
		boarddto.setB_nick(b_nick);
		System.out.println("bDao : "+ bDao);
		int b = bDao.shopUpdate(boarddto);		
		int u = -1 ;
		int f= -1;
		int d = 0;
		if(b == 1){
			System.out.println("b_idx : "+boarddto.getB_idx());
			u= bDao.shopsUpdate(boarddto);
		}	
		
		String inDate   = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
		System.out.println(inDate);
		System.out.println(boarddto.getFilechk()+"//////"+boarddto.getFilechks());
		int b_idx = boarddto.getB_idx();
		if(boarddto.getFilechk() == 4 && boarddto.getFilechks() == 5){
			System.out.println("둘다");
			d=bDao.fileDel(b_idx);
			if(boarddto.getFilechk() == 4){
				System.out.println("둘다밑에 대표");
				if(d!=0){
					List<MultipartFile> mf = multi.getFiles("imgfile");			
					System.out.println("ㅇ파일 b_idx : "+b_idx);
					f=upload.fileUp(multi,inDate,b_idx,mf);						
				}	
			}
			if(boarddto.getFilechks() == 5){
				System.out.println("둘다밑에 매장");
				if(d!=0){
					List<MultipartFile> mf = multi.getFiles("imgfile1");			
					System.out.println("ㅇ파일 b_idx : "+b_idx);
					f=upload.fileUp(multi,inDate,b_idx,mf);	
				}
			}
			if(f == 1 && u==1){
				view="redirect:/shopDetail";
				System.out.println("쿠퀘퀘퀘퀘퀘");
			}else{
				view="redirect/shopUpdateForm";
			}
		}
		else if(boarddto.getFilechk() == 1 && boarddto.getFilechks() == 5){
			System.out.println("매장만");
			d=bDao.fileDeln(b_idx);
			if(d!=0){
				List<MultipartFile> mf = multi.getFiles("imgfile1");			
				System.out.println("ㅇ파일 b_idx : "+b_idx);
				f=upload.fileUp(multi,inDate,b_idx,mf);	
			}	
			if(f == 1 && u==1){
				view="redirect:/shopDetail";
				System.out.println("쿠퀘퀘퀘퀘퀘");
			}else{
				view="redirect/shopUpdateForm";
			}
		}
		else if(boarddto.getFilechk() == 4  && boarddto.getFilechks() == 3){
			System.out.println("대표만");
			d=bDao.fileDelthum(b_idx);
			if(d!=0){
				List<MultipartFile> mf = multi.getFiles("imgfile");			
				System.out.println("ㅇ파일 b_idx : "+b_idx);
				f=upload.fileUp(multi,inDate,b_idx,mf);						
			}	
			if(f == 1 && u==1){
				view="redirect:/shopDetail";
				System.out.println("쿠퀘퀘퀘퀘퀘");
			}else{
				view="redirect/shopUpdateForm";
			}
		}
		else{
			System.out.println("둘다 안바 꿔");			
			if( u==1){
				view="redirect:/shopDetail";
				System.out.println("쿠퀘퀘퀘퀘퀘");
			}else{
				view="redirect/shopUpdateForm";
			}
		}
						
		
		mav.addObject("b_idx",b_idx);
		mav.setViewName(view);
		return mav;
	}

	public ModelAndView shopDel() {
		int b_idx  = Integer.parseInt(request.getParameter("b_idx"));
		
		String view="";
		int success = bDao.shopDel(b_idx);
		if(success != 0){
			view="redirect:/listCall";
			System.out.println("쿠퀘퀘퀘퀘퀘");
		}else{
			view="shop/shopDeatil";
		}
		mav.setViewName(view);
		return mav;
	}



	
}
