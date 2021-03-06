package com.project.honMoNo;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.dto.MemberDto;
import com.project.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService mService;
	@Autowired
	HttpServletResponse response;
	@Autowired
	HttpSession session;
	ModelAndView mav;
	
	//로그인 컨트롤러
	@RequestMapping(value = "/login",  produces = "application/json; charset=utf8")
	public @ResponseBody int login(MemberDto mDto){
		
		int success = 0;
		success = mService.login(mDto);
		
		return success;	
	}
	
	//로그아웃 컨트롤러
	@RequestMapping(value = "/logout",  produces = "application/json; charset=utf8")
	public @ResponseBody int logout(){
		System.out.println("로그아웃 컨트롤러 진입");
		
		int success = 0;
		success = mService.logout();
		
		return success;	
	}
	
	//멤버 이용약관 호출
	@RequestMapping(value = "/memberJoinAgree", method = RequestMethod.GET)
	public ModelAndView memberJoinAgree() {	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/memberJoinAgree");
		
		return mav;
	}
	
	//멤버 이용약관 호출
	@RequestMapping(value = "/memberJoinAgree2", method = RequestMethod.GET)
	public ModelAndView memberJoinAgree2() {	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/memberJoinAgree2");
		
		return mav;
	}

	//소비자 회원가입 폼 이동
	@RequestMapping(value = "/memberJoinForm", method = RequestMethod.GET)
	public ModelAndView memberJoinForm() {
		System.out.println("memberJoinForm 도착");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("m_agree", "Y");
		mav.setViewName("member/memberJoinForm");
		
		return mav;
	}
	
	//소비자 회원가입 폼 이동
	@RequestMapping(value = "/memberJoinForm2", method = RequestMethod.GET)
	public ModelAndView memberJoinForm2() {
		System.out.println("memberJoinForm2 도착");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("m_agree", "Y");
		mav.setViewName("member/memberJoinForm2");
		
		return mav;
	}
	
	// 아이디 중복 검사(AJAX)
		@RequestMapping(value = "/idChk", method = RequestMethod.POST)
		public void check_id(@RequestParam("m_id") String m_id, HttpServletResponse response) throws Exception{
			mService.check_id(m_id, response);
		}
		
		// 닉네임 중복 검사(AJAX)
		@RequestMapping(value = "/nickChk", method = RequestMethod.POST)
		public void check_nick(@RequestParam("m_nick") String m_nick, HttpServletResponse response) throws Exception{
			mService.check_nick(m_nick, response);
		}
		
		//사업자 번호 중복검사
		@RequestMapping(value = "/conumChk",  produces = "application/json; charset=utf8")
		public @ResponseBody Integer conumChk(MemberDto memberdto) {
			System.out.println("사업자 번호 중복검사 진입");
			System.out.println("코넘 : "+memberdto.getMs_conum());
			String ms_conum = memberdto.getMs_conum();
			System.out.println("ms_conum : "+ms_conum);
			int success = mService.conumChk(ms_conum);
			System.out.println("success : "+success);
			return success;
		}	
		
		
		// 회원 가입 --소비자
		@RequestMapping(value = "/memberInsert", method = RequestMethod.POST)
		public String join_member(@ModelAttribute MemberDto member, RedirectAttributes rttr, HttpServletResponse response) throws Exception{
			//mav = new ModelAndView();
			rttr.addFlashAttribute("msg", mService.join_member(member, response));
			
			//mav.setViewName("main");
			
			return "redirect:/";
		}
		
		// 회원 인증
			@RequestMapping(value = "/approval_member", method = RequestMethod.POST)
			public void approval_member(@ModelAttribute MemberDto member, HttpServletResponse response) throws Exception{
				System.out.println("approval_member 진입");
				mService.approval_member(member, response);
			}
		
		//아이디 찾기
			@RequestMapping(value = "/find_id", method = RequestMethod.POST)
			public ModelAndView find_id(HttpServletResponse response, @RequestParam("m_phone") String m_phone, Model md) throws Exception{
				System.out.println("find_id 진입");
				md.addAttribute("m_id",mService.find_id(response, m_phone));
				mav = new ModelAndView();
				mav.setViewName("member/memberFind_id");
				
				return mav;
			}
			
			// 비밀번호 찾기
			@RequestMapping(value = "/find_pw", method = RequestMethod.POST)
			public void find_pw(@ModelAttribute MemberDto member, HttpServletResponse response) throws Exception{
				mService.find_pw(response, member);
			}
			
			// 비밀번호 변경
			@RequestMapping(value = "/update_pw", method = RequestMethod.POST)
			public String update_pw(@ModelAttribute MemberDto member, @RequestParam("old_pw") String old_pw, HttpServletResponse response, RedirectAttributes rttr) throws Exception{
				
				mService.update_pw(member, old_pw, response);
				
				rttr.addFlashAttribute("msg", "비밀번호 수정 완료");
				return "redirect:/myInfoPage1";
			}
		
		//ID 찾기
		@RequestMapping(value = "/memberMyIdFind", method = RequestMethod.GET)
		public ModelAndView memberMyIdFind() {
			System.out.println("memberMyIdFind 진입");
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("member/memberMyIdFind");
			
			return mav;
		}
		
		//ID 찾기
		@RequestMapping(value = "/memberMyPwFind", method = RequestMethod.GET)
		public ModelAndView memberMyPwFind() {
			System.out.println("memberMyPwFind 진입");
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("member/memberMyPwFind");
			
			return mav;
		}
		
		//내 정보 수정 페이지1 이동
			@RequestMapping(value = "/myInfoPage1", method = RequestMethod.GET)
			public ModelAndView myInfoPage1() {	
				mav = new ModelAndView();
				
				mav = mService.myInfoPage1();
				
				mav.setViewName("myPage/myInfoPage1");
				
				return mav;
			}
			
			//내 정보 수정 페이지2 이동
			@RequestMapping(value = "/myInfoPage2", method = RequestMethod.GET)
			public ModelAndView myInfoPage2() {	
				mav = new ModelAndView();
				mav = mService.myInfoPage2();
				
				mav.setViewName("myPage/myInfoPage2");
				
				return mav;
			}
			
		// mypage 수정
		@RequestMapping(value = "/update_mypage", method = RequestMethod.POST)
		public String update_mypage(@ModelAttribute MemberDto member, HttpSession session, RedirectAttributes rttr) throws Exception{
			session.setAttribute("member", mService.update_mypage(member));
			System.out.println("asdfasdfasdfasdfa : "+member.getM_rating());
			rttr.addFlashAttribute("msg", "회원정보 수정 완료");
			
			if(session.getAttribute("loginRating").equals("1")){
				return "redirect:./myInfoPage1";
			}else{
				return "redirect:./myInfoPage2";
			}
			
			
		}
	
		//회원 탈퇴
		@RequestMapping(value = "/memberDel", method = RequestMethod.POST)
		public ModelAndView memberDel(MemberDto memberdto) {	
			mav = new ModelAndView();
			
			mav = mService.memberDel(memberdto);
			
			mav.setViewName("main");
			
			return mav;
		}
		
}
