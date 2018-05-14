package com.project.service;

import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.project.dao.MemberDao;
import com.project.dto.MemberDto;

@Service
public class MemberService {
	
	@Autowired
	HttpSession session;
	@Autowired
	MemberDao mDao;
	@Autowired
	HttpServletRequest request;
	private ModelAndView mav;
	
	//로그인 서비스
	public int login(MemberDto mdto) {
		System.out.println("로그인 서비스 진입");
		int success = 0;
		MemberDto userLoginInfo = mDao.login(mdto);
		
		if(userLoginInfo.getM_nick() != null && userLoginInfo.getM_rating() != 3){
			
			System.out.println("로그인 성공");
			
			System.out.println("userLoginInfo.getM_nick() : "+userLoginInfo.getM_nick());
			System.out.println("userLoginInfo.getM_rating() : "+userLoginInfo.getM_rating());
			session.setAttribute("loginNick", userLoginInfo.getM_nick());
			session.setAttribute("loginRating", Integer.toString(userLoginInfo.getM_rating()));
			success = 1;
			
		}else{
			System.out.println("로그인 실패");
		}
		
		return success;
	}
	
	//로그아웃 서비스
	public int logout() {
		System.out.println("로그아웃 서비스 진입");
		
		int success = 0;
		
		System.out.println(session.getAttribute("loginNick"));
		System.out.println(session.getAttribute("loginRating"));
		
		session.removeAttribute("loginNick");
		session.removeAttribute("loginRating");
		success = 1;
		
		return success;
	}
	
	//회원 가입
		public String join_member(MemberDto member, HttpServletResponse response) throws Exception{
		
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			
			if(mDao.check_id(member.getM_id())==1) {
				out.println("<script>");
				out.println("alert('동일한 아이디가 있습니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return "";	
				
			}else if(mDao.check_nick(member.getM_nick()) ==1) {
				out.println("<script>");
				out.println("alert('동일한 닉네임이 있습니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return "";
			
			}else {
				
				// 인증키 set
				member.setM_key(create_key());
				
				//rating 소비자 =1 사업자 =2 
				int success=mDao.join_member(member);
				String m_rating =request.getParameter("m_rating");
				System.out.println("m_Rati : "+m_rating);
				System.out.println(success);
				if(success == 1 && m_rating.equals("3")) {
					System.out.println("success");
					member.setM_rating(Integer.parseInt(m_rating));
					int success2=mDao.join_member2(member);
					System.out.println(success2);
				}
				
				//인증 메일 발송하기
				send_mail(member);
				
				String content ="<script>alert('지정하신 메일주소로 인증메일을 발송했습니다. 메일을 확인해 주세요.');</script>";
				
				return content;
			}
			
			
		}
		
		//이메일 발송 
		private void send_mail(MemberDto member) throws Exception {
			// TODO Auto-generated method stub
			// Mail Server 설정
					String charSet = "utf-8";
					String hostSMTP = "smtp.naver.com";
					String hostSMTPid = "keepout99@naver.com";
					String hostSMTPpwd = "@gkrwns47811";

					// 보내는 사람 EMail, 제목, 내용
					String fromEmail = "keepout99@naver.com";
					String fromName = "혼수상태 홈페이지";
					String subject = "";
					String msg = "";

					// 회원가입 메일 내용
					subject = "혼수 상태  회원가입 인증 메일입니다.";
					msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
					msg += "<h3 style='color: black;'>";
					msg += member.getM_id() + "님 회원가입을 환영합니다.</h3>";
					msg += "<div style='font-size: 130%'>";
					msg += "하단의 인증 버튼 클릭 시 정상적으로 회원가입이 완료됩니다.</div><br/>";
					msg += "<form method='post' action='http://192.168.0.151/honMoNo/approval_member'>";
					msg += "<input type='hidden' name='m_id' value='" + member.getM_id() + "'>";
					msg += "<input type='hidden' name='m_key' value='" + member.getM_key() + "'>";
					msg += "<input type='submit' value='인증'></form><br/></div>";

					// 받는 사람 E-Mail 주소
					String mail = member.getM_id();
					try {
						HtmlEmail email = new HtmlEmail();
						email.setDebug(true);
						email.setCharset(charSet);
						email.setSSL(true);
						email.setHostName(hostSMTP);
						email.setSmtpPort(587);

						email.setAuthentication(hostSMTPid, hostSMTPpwd);
						email.setTLS(true);
						email.addTo(mail, charSet);
						email.setFrom(fromEmail, fromName, charSet);
						email.setSubject(subject);
						email.setHtmlMsg(msg);
						email.send();
					} catch (Exception e) {
						System.out.println("메일발송 실패 : " + e);
					}
			
		}


		//인증키 생성하기
		private String create_key() throws Exception{
			
			String key ="";
			Random rd = new Random();
			
			for(int i =0; i<8; i++) {
				
				key += rd.nextInt(10);
			}
			
			return key;
		}



		//id 중복 확인
		public void check_id(String m_id, HttpServletResponse response) throws Exception{
			
			PrintWriter out = response.getWriter();
			out.println(mDao.check_id(m_id));
			out.close();
		}



		//닉네임 중복 확인
		public void check_nick(String m_nick, HttpServletResponse response) throws Exception {
			PrintWriter out = response.getWriter();
			out.println(mDao.check_nick(m_nick));
			out.close();
			
			
		}

		//사업자 번호 중복 확인
		public void check_conum(String ms_conum, HttpServletResponse response) throws Exception {
			// TODO Auto-generated method stub
			PrintWriter out = response.getWriter();
			out.println(mDao.check_conum(ms_conum));
			out.close();
		}
		


		//회원 인증
		public void approval_member(MemberDto member, HttpServletResponse response) throws Exception {
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			
			if(mDao.approval_member(member)== 0) { //이메일 인증에 실패 할 경우
				
				out.println("<script>");
				out.println("alert('잘못된 접근입니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
			}else { // 이메일 인증을 성공하였을 경우
				out.println("<script>");
				out.println("alert('인증이 완료되었습니다. 로그인 후 이용하세요. ※단, 사업자 회원은 관리자의 인증을 받아야 로그인 가능합니다.');");
				out.println("history.go(-1);");
				out.println("window.open('./','about:blank')");
				out.println("</script>");
				out.close();
			}
			
		}

		//아이디 찾기
		public String find_id(HttpServletResponse response, String m_phone) throws Exception {
			// TODO Auto-generated method stub
			response.setContentType("'text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			String m_id = mDao.find_id(m_phone);
			
			if(m_id == null) {
				out.println("<script>");
				out.println("alert('가입된 아이디가 없습니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return null;
				
			}else {
				
				return m_id;
			}
			
		}
		//비밀번호 찾기
		public void find_pw(HttpServletResponse response, MemberDto member) throws Exception {
			// TODO Auto-generated method stub
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			
			//아이디가 없으면
			if(mDao.check_id(member.getM_id()) ==0) {
				out.print("가입되지 않은 아이디 입니다. 다시 입력해주세요.");
				out.close();
			}else {
				
				//임시 비밀번호 생성
				
				String m_pass = "";
				for( int i=0; i<12; i++) {
					
					m_pass+=(char) ((Math.random()*26)+97);
				}
				member.setM_pass(m_pass);
				//비밀번호 변경
				mDao.update_pw(member);
				//비밀번호 변경 메일 발송
				send_mail(member, "find_pw");
				
				out.print("이메일로 임시 비밀번호를 발송하였습니다.");
				out.close();
			}
			
			
		}

		//임시 비밀번호 받는 이메일 발송 내용
		private void send_mail(MemberDto member, String div) throws Exception {
			// TODO Auto-generated method stub
			
			//Mail Server 설정
			String charSet = "utf-8";
			String hostSMTP = "smtp.naver.com";
			String hostSMTPid = "keepout99@naver.com";
			String hostSMTPpwd = "@gkrwns47811";
			
			// 보내는 사람 EMail, 제목, 내용
			String fromEmail = "keepout99@naver.com";
			String fromName = "혼수상태 홈페이지 임시비밀번호 입니다";
			String subject = "";
			String msg = "";
			
			if(div.equals("join")) {
				// 회원가입 메일 내용
				subject = "혼수상태 홈페이지 회원가입 인증 메일입니다.";
				msg += "<div align='center' style='border:1px solid pink; font-family:verdana'>";
				msg += "<h3 style='color: blue;'>";
				msg += member.getM_id() + "님 회원가입을 환영합니다.</h3>";
				msg += "<div style='font-size: 130%'>";
				msg += "하단의 인증 버튼 클릭 시 정상적으로 회원가입이 완료됩니다.</div><br/>";
				msg += "<form method='post' action='http://192.168.0.154/real_project/approval_member'>";
				msg += "<input type='hidden' name='email' value='" + member.getM_id() + "'>";
				msg += "<input type='hidden' name='approval_key' value='" + member.getM_key() + "'>";
				msg += "<input type='submit' value='인증'></form><br/></div>";
			}else if(div.equals("find_pw")) {
				subject = "혼수상태 홈페이지 임시 비밀번호 입니다.";
				msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
				msg += "<h3 style='color: blue;'>";
				msg += member.getM_id() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
				msg += "<p>임시 비밀번호 : ";
				msg += member.getM_pass()+ "</p></div>";
			}
			// 받는 사람 E-Mail 주소
			String mail = member.getM_id();
			try {
				HtmlEmail email = new HtmlEmail();
				email.setDebug(true);
				email.setCharset(charSet);
				email.setSSL(true);
				email.setHostName(hostSMTP);
				email.setSmtpPort(587);

				email.setAuthentication(hostSMTPid, hostSMTPpwd);
				email.setTLS(true);
				email.addTo(mail, charSet);
				email.setFrom(fromEmail, fromName, charSet);
				email.setSubject(subject);
				email.setHtmlMsg(msg);
				email.send();
			} catch (Exception e) {
				System.out.println("메일발송 실패 : " + e);
			}
		}

		public ModelAndView myInfoPage1() {
			
			mav = new ModelAndView();
			String m_nick = (String) session.getAttribute("loginNick");
			
			MemberDto member = mDao.myInfoPage1(m_nick);
			mav.addObject("member", member);
			
			return mav;
		}

		public ModelAndView myInfoPage2() {
			
			mav = new ModelAndView();
			String m_nick = (String) session.getAttribute("loginNick");
			
			MemberDto member = mDao.myInfoPage2(m_nick);
			mav.addObject("member", member);
			
			return mav;
		}
		
		//마이페이지 정보수정하기 (회원 리스트 수정)
		public MemberDto update_mypage(MemberDto member) throws Exception{
			// TODO Auto-generated method stub
			
			mDao.update_mypage(member);
			
			if(session.getAttribute("loginRating").equals("2")){
				mDao.update_mypage2(member);
			}
		
			
			return mDao.login(member.getM_nick());
		}
		
		//비밀번호 변경하기
		public Object update_pw(MemberDto member, String old_pw, HttpServletResponse response) throws Exception {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			int success = 0;
			String m_nick = (String)session.getAttribute("loginNick");
			String pwChk = mDao.pwChk(m_nick);
			System.out.println(pwChk);
			member.setM_nick(m_nick);
			
			if(!old_pw.equals(pwChk)) {
				out.println("<script>");
				out.println("alert('기존 비밀번호가 다릅니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return null;
			}else {
				success = mDao.update_pass(member);
				return m_nick;
			}
			
		}
		
		//회원탈퇴
		public ModelAndView memberDel(MemberDto memberdto) {
			int success = 0;
			
			if(mDao.passChk(memberdto)==1){
				success = mDao.mDel(memberdto.getM_nick());
				String loginRating = (String) session.getAttribute("loginRating");
				
				if(loginRating.equals("1")){
					
				}else{
					success = mDao.msDel(memberdto.getM_nick());
				}
				
			}
			
			logout();
			
			return mav;
		}

		public int conumChk(String ms_conum) {
			
			System.out.println("ms_conum 서비스 : "+ms_conum);
			int success = mDao.conumChk(Integer.parseInt(ms_conum));
			
			System.out.println("conumChk 서비스 : "+success);
			
			return success;
		}
		
	
}
