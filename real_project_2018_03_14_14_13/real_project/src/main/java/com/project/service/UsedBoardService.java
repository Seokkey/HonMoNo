package com.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.lf5.viewer.categoryexplorer.CategoryExplorerTree;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.dao.BoardDao;
import com.project.dao.CategoryDao;
import com.project.dto.BoardDto;
import com.project.dto.CategoryDto;
import com.project.dto.MessageDto;
import com.project.dto.PhotoDto;
import com.project.dto.ReplyDto;
import com.project.useClass.UploadFile;

@Service
public class UsedBoardService {
	
	@Autowired
	private BoardDao bDao;
	@Autowired
	private CategoryDao cDao;
	
	private ModelAndView mav;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	MultipartHttpServletRequest multi;
	
	@Autowired
	UploadFile upload;

	//중고거래 리스트
	public ModelAndView usedboardList(CategoryDto categorydto) {	
		Map<Object,Object> map = new HashMap<>();
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
		String brand =request.getParameter("brand");
		String area = request.getParameter("area");
			
		map.put("area",area);
		map.put("brand", brand);
		map.put("keyword",keyword);
		map.put("search", search);
		map.put("page",page);
	
		
		System.out.println("c_idx : "+categorydto.getC_idx());
		System.out.println(" 확인 : "+area+"//"+brand+"//"+keyword+"//"+search+"//");
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
		int listCount = bDao.listcount(map);//게시물 총 개수
		System.out.println("usedlistCount : "+listCount);
		
		map.put("start",start);
		System.out.println("map : " + map);
		//리스트가져오기
		List<BoardDto> usedboardList=bDao.usedList(map);
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
		mav.addObject("searchlist", map);		
		mav.addObject("usedboardList", usedboardList);
		mav.addObject("c_num", c_num);
		mav.addObject("maxPage", maxPage);
		mav.addObject("startPage", startPage);
		mav.addObject("endPage", endPage);
		mav.addObject("c_idx",c_idx);
		mav.addObject("faEx", faEx);
		mav.addObject("boardName", bDao.estiBoardName(c_idx)); //게시판 이름 가져오기
		
		System.out.println("중고거래 리스트 보내는 리스트 : "+spage+"//"+usedboardList);
		mav.setViewName("used/usedList");
		return mav;
	}


	//글쓰기 제품 이름 가져오기
	public ModelAndView getProduc(int c_idx) {
		System.out.println("produc c_idx : "+c_idx);
		String produc=bDao.getProduc(c_idx);
		
		System.out.println("produc : "+produc);
		mav.addObject("produc", produc);
		return mav;
	}

	//중고거래 글쓰기
	public ModelAndView useWrite(BoardDto boarddto, MultipartHttpServletRequest multi ) {
		mav= new ModelAndView();
		System.out.println(boarddto.getU_bors());
		System.out.println(boarddto.getU_brand());		
		
		System.out.println("filechk : "+boarddto.getFilechk());
		
		String b_nick=(String) request.getSession().getAttribute("loginNick");
		boarddto.setB_nick(b_nick);
		System.out.println("bDao : "+ bDao);
		int b = bDao.useWrite(boarddto);		
		int u = -1 ;
		int f= -1;
		if(b == 1){
			System.out.println("b_idx : "+boarddto.getB_idx());
			u= bDao.usedWrite(boarddto);
		}	
		String view="";
		String inDate   = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
		System.out.println(inDate);
		if(boarddto.getFilechk() == 1 && u ==1){
			List<MultipartFile> mf = multi.getFiles("imgfile");
			int b_idx = boarddto.getB_idx();
			System.out.println("ㅇ파일 b_idx : "+b_idx);
			f=upload.fileUp(multi,inDate,b_idx,mf);		
			if(f == 1 && u==1){
				view="redirect:/listCall";
				System.out.println("쿠퀘퀘퀘퀘퀘");
			}else{
				view="redirect:/usedWriteForm";
			}
			mav.setViewName(view);
		}else{
			if( u==1){
				view="redirect:/listCall";
				System.out.println("성공시");
			}else{
				view="redirect:/usedWriteFrom";
			}
			mav.setViewName(view);
		}
		return mav;
	}


	//중고거래 상세보기
	public ModelAndView usedDetail(int b_idx) {
		System.out.println("중고상세 메소드 b_idx"+b_idx);
		BoardDto boarddto = new BoardDto();	
		boarddto = bDao.usedDetail(b_idx);
		List<ReplyDto> usedreplylist = bDao.usedReply(b_idx);
		List<PhotoDto> usedpholist = bDao.usedPhoto(b_idx);
		System.out.println("리플 사이즈"+usedreplylist.size());
		System.out.println("사진 사이즈"+usedpholist.size());
		
		mav.addObject("usedreplylist", usedreplylist);
		mav.addObject("usedpholist", usedpholist);
		mav.addObject("boarddto", boarddto);		
		
		mav.setViewName("used/usedDeatil");
		
		return mav;
	}


	//리플 리스트
	public Map<String, List<ReplyDto>> getReplyList(ReplyDto replydto) {
		Map<String, List<ReplyDto>> replyMap = new HashMap<String,List<ReplyDto>>();
		int b_idx = Integer.parseInt(request.getParameter("b_idx"));
		int rsucess = bDao.useReplyWrite(replydto);
		
		List<ReplyDto> usedreplylist = bDao.usedReply(b_idx);
		replyMap.put("reply", usedreplylist);
		return replyMap;
	}

	
	//중고거래 업데이트
	public ModelAndView usedUpdate(BoardDto boarddto, MultipartHttpServletRequest multi ) {
		mav= new ModelAndView();
		System.out.println(boarddto.getU_bors());
		System.out.println(boarddto.getU_brand());		
		
		System.out.println("filechk : "+boarddto.getFilechk());
		
		String b_nick=(String) request.getSession().getAttribute("loginNick");
		boarddto.setB_nick(b_nick);
		System.out.println("bDao : "+ bDao);
		int b = bDao.useUpdate(boarddto);		
		int u = -1 ;
		int f= -1;
		int d = 0;
		if(b == 1){
			System.out.println("b_idx : "+boarddto.getB_idx());
			u= bDao.usedUpdate(boarddto);
		}	
		String view="";
		String inDate   = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
		System.out.println(inDate);
		if(boarddto.getFilechk() == 3 && u ==1){
			int b_idx = boarddto.getB_idx();
			System.out.println("ㅇ파일 b_idx : "+b_idx);
			d=bDao.fileDel(b_idx);	
			List<MultipartFile> mf = multi.getFiles("imgfile");
			f=upload.fileUp(multi,inDate,b_idx,mf);	
			if(f == 1 && u==1){
				view="redirect:/listCall";
				System.out.println("쿠퀘퀘퀘퀘퀘");
			}else{
				view="/usedUpdateForm";
			}
			mav.setViewName(view);
								
		}else if(boarddto.getFilechk() == 0){
			int b_idx = boarddto.getB_idx();
			d=bDao.fileDel(b_idx);	
			if( u==1){
				view="redirect:/listCall";
				System.out.println("쿠퀘퀘퀘퀘퀘");
			}else{
				view="/usedUpdateForm";
			}
			mav.setViewName(view);
		}else{
			if( u==1){
				view="redirect:/listCall";
				System.out.println("쿠퀘퀘퀘퀘퀘");
			}else{
				view="/usedUpdateForm";
			}
			mav.setViewName(view);
		}
	
		
		return mav;
	}
	

	//중고거래 삭제하기
	public ModelAndView usedDel() {
		int b_idx  = Integer.parseInt(request.getParameter("b_idx"));
		String view="";
		int success = bDao.usedDel(b_idx);
		if(success != 0){
			view="redirect:/listCall";
			System.out.println("쿠퀘퀘퀘퀘퀘");
		}else{
			view="used/usedDeatil";
		}
		mav.setViewName(view);
		return mav;
	}

	//댓글삭제
	public Map<String, List<ReplyDto>> replyDel(int r_idx) {
		List<ReplyDto> reply = null;
		int b_idx  = Integer.parseInt(request.getParameter("b_idx"));
		int success=bDao.replyDel(r_idx);
		if(success != 0){
			reply=bDao.usedReply(b_idx);
		}

		Map<String, List<ReplyDto>> replyMap = new HashMap<String,List<ReplyDto>>();
		replyMap.put("reply",reply);
		return replyMap;
		
	}

	//팝니다 메시지 보내기
	public ModelAndView sendSellmsg(MessageDto messageDto) {
		System.out.println("팝니다 메시지 보내기 요청");
		System.out.println("가져온 b_idx"+messageDto.getB_idx());
		System.out.println("가져온 getC_num"+messageDto.getC_num());
		System.out.println("가져온 getMsg_sendnick"+messageDto.getMsg_sendnick());
		System.out.println("가져온 getC_idx"+messageDto.getC_idx());
		System.out.println("가져온 getMsg_recivenick"+messageDto.getMsg_recivenick());
		
		mav = new ModelAndView();
		int sucess = bDao.sendSellmsg(messageDto);
		if(sucess > 0) {
			mav.addObject("sendSellmsg", ""+messageDto.getMsg_recivenick()+"님께 안전거래를 요청하였습니다.");
			CategoryDto categorydto = new CategoryDto();
			categorydto.setC_idx(messageDto.getC_idx());
			categorydto.setC_num(messageDto.getC_num());
			mav.addObject("c_num", messageDto.getC_num());
			mav.addObject("c_idx", messageDto.getC_idx());
			mav.addObject("categorydto", categorydto);
			mav.addObject("b_idx", messageDto.getB_idx());						
		}
		mav.setViewName("redirect:/usedDetail");
		/*?b_idx="+messageDto.getB_idx()+"&c_idx="+messageDto.getC_idx()+"&c_num="+messageDto.getC_num()+""*/
		return mav;
	}


	public ModelAndView dealFinish(BoardDto boarddto) {
		mav = new ModelAndView();
		int success= bDao.dealFinish(boarddto);
		if(success == 1){
			mav.setViewName("redirect:/listCall");
		}else{
			mav.setViewName("redirect:/usedUpdateForm");
		}
		return mav;
	}

}






























