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

import com.project.dto.CategoryDto;
import com.project.dto.SafeDealDto;
import com.project.service.MypageService;

@Controller
public class MypageController {
	
	@Autowired
	private MypageService mps;
	@Autowired	
	private HttpServletRequest request;
	
	ModelAndView mav = null;
	
	//관심게시판 리스트 호출
	@RequestMapping(value = "/myFavoriteBbsList",  produces = "application/json; charset=utf8")
	public @ResponseBody Map<String, List<CategoryDto>> myFavoriteBbsList() {
		System.out.println("관심게시판 리스트 호출 진입");
		
		Map<String, List<CategoryDto>> cmap = new HashMap<String, List<CategoryDto>>();
		
		List<CategoryDto> clist = mps.myFavoriteBbsList();
		if(clist != null){
			cmap.put("clist", clist);
		}
		
		return cmap;
	}	
	
	//내 견적 리스트 호출
	@RequestMapping(value = "/myTradeList",  produces = "application/json; charset=utf8")
	public @ResponseBody Map<String, List<SafeDealDto>> myTradeList() {
		System.out.println("내 견적 리스트 호출 진입");
		
		Map<String, List<SafeDealDto>> tmap = new HashMap<String, List<SafeDealDto>>();
		List<SafeDealDto> tlist = mps.myTradeList();
		
		tmap.put("tlist", tlist);
		
		return tmap;
	}	
	
	//거래내역 상세보기 팝업
	@RequestMapping(value="/detailPopUp", method = RequestMethod.POST)
	public ModelAndView detailPopUp(SafeDealDto safedealdto, CategoryDto categorydto){
		System.out.println("detailPopUp 컨트롤러 호출");
		
		mav=mps.detailPopUp(safedealdto);
		mav.addObject("categorydto", categorydto);
		
		return mav;
	}
	
	//안전거래 폼 팝업
	@RequestMapping(value="/safeDealFormPopUp", method = RequestMethod.POST)
	public ModelAndView safeDealFormPopUp(SafeDealDto safedealdto){
		System.out.println("safeDealFormPopUp 컨트롤러 호출");
		
		mav=mps.safeDealFormPopUp(safedealdto);
		
		return mav;
	}
	

		//거래요청중 판매자가 정정요청 눌렀을시
		@RequestMapping(value="/dealModifyCall", method = RequestMethod.GET)
		public ModelAndView dealModifyCall(SafeDealDto safedealdto){
			System.out.println("dealModifyCall 컨트롤러 호출");
			
			mav=mps.dealModifyCall(safedealdto);
			
			return mav;
		}
		
		//
		@RequestMapping(value="/dealModifyStart", method = RequestMethod.GET)
		public ModelAndView dealModifyStart(SafeDealDto safedealdto){
			System.out.println("dealModifyStart 컨트롤러 호출");
			
			mav=mps.dealModifyStart(safedealdto);
			
			return mav;
		}
		
		//
		@RequestMapping(value="/dealUpdate", method = RequestMethod.POST)
		public ModelAndView dealUpdate(SafeDealDto safedealdto){
			System.out.println("dealUpdate 컨트롤러 호출");
			System.out.println("safedealdto.getSfd_sumprice() : "+safedealdto.getSfd_sumprice());
			
			mav=mps.dealUpdate(safedealdto);
			
			return mav;
		}
		
		//
		@RequestMapping(value="/dealAgree", method = RequestMethod.GET)
		public ModelAndView dealAgree(SafeDealDto safedealdto){
			System.out.println("dealAgree 컨트롤러 호출");
			
			mav=mps.dealAgree(safedealdto);
			
			
			return mav;
		}
		
		//
		@RequestMapping(value="/dealCancel", method = RequestMethod.GET)
		public ModelAndView dealCancel(SafeDealDto safedealdto){
			System.out.println("dealCancel 컨트롤러 호출");
			
			mav=mps.dealCancel(safedealdto);
			
			return mav;
		}
		
		//
		@RequestMapping(value="/dealCancelAgreeSell", method = RequestMethod.GET)
		public ModelAndView dealCancelAgreeSell(SafeDealDto safedealdto){
			System.out.println("dealCancelAgreeSell 컨트롤러 호출");
			
			mav=mps.dealCancelAgreeSell(safedealdto);
			
			return mav;
		}
		
		//
		@RequestMapping(value="/dealCancelAgreeAdmin", method = RequestMethod.GET)
		public ModelAndView dealCancelAgreeAdmin(SafeDealDto safedealdto){
			System.out.println("dealCancelAgreeAdmin 컨트롤러 호출");
			
			mav=mps.dealCancelAgreeAdmin(safedealdto);
			
			System.out.println("dealCancelAgreeAdmin 완료");
			return mav;
		}
		
		//
		@RequestMapping(value="/payChk", method = RequestMethod.GET)
		public ModelAndView payChk(SafeDealDto safedealdto){
			System.out.println("payChk 컨트롤러 호출");
			
			mav=mps.payChk(safedealdto);
			
			return mav;
		}
		
		//소비자가 환불버튼 눌렀을시 컨트롤러
		@RequestMapping(value="/dealCancelRequest", method = RequestMethod.GET)
		public ModelAndView dealCancelRequest(SafeDealDto safedealdto){
			System.out.println("dealCancelRequest 컨트롤러 호출");
			
			mav=mps.dealCancelRequest(safedealdto);
			
			return mav;
		}
		
		//
		@RequestMapping(value="/dealConfirm", method = RequestMethod.GET)
		public ModelAndView dealConfirm(SafeDealDto safedealdto){
			System.out.println("dealConfirm 컨트롤러 호출");
			
			mav=mps.dealConfirm(safedealdto);
			
			return mav;
		}
		
		//
		@RequestMapping(value="/dealCancelCancel", method = RequestMethod.GET)
		public ModelAndView dealCancelCancel(SafeDealDto safedealdto){
			System.out.println("dealCancelCancel 컨트롤러 호출");
			
			mav=mps.dealCancelCancel(safedealdto);
			
			return mav;
		}
		
		//안전거래 테이블에 데이터 기입
		@RequestMapping(value="/dealInsert", method = RequestMethod.POST)
		public ModelAndView dealInsert(SafeDealDto safedealdto, CategoryDto categorydto){
			System.out.println("dealInsert 컨트롤러 호출");
		
			mav=mps.dealInsert(safedealdto, categorydto);
			
			return mav;
		}
		
		//안전거래 폼 으로 이동
		@RequestMapping(value = "/safeDealFormCall", method = RequestMethod.GET)
		public ModelAndView safeDealFormCall(SafeDealDto safedealdto, CategoryDto categorydto) {	
			System.out.println("safeDealFormCall 진입");
			ModelAndView mav = new ModelAndView();
			mav.addObject("safedealdto", safedealdto);
			mav.addObject("categorydto", categorydto);
			
			System.out.println(safedealdto.getB_idx());
			System.out.println(categorydto.getC_idx());
			System.out.println(categorydto.getC_num());
			
			
		mav.setViewName("myPage/myEstimate");		
			return mav;
		}	
		
}
