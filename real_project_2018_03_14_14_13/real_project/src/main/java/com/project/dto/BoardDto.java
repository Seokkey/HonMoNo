package com.project.dto;

import java.sql.Date;

public class BoardDto {
	
	/*게시판 공통부분, 공지사항 게시판*/
	private int b_idx;//게시글 번호
	private int c_idx;//카테고리인덱스
	private String b_nick;//닉네임
	private String b_subject;//제목
	private String b_content;//내용
	private int b_hit;//조회수, DEFAULT '0'
	private Date b_date;//작성일
	private int rnum; //추가 : 알넘
	private int rcount; //추가 : 댓글 (수) 
	private int onefilechk;//게시판 메인파일 확인
	private int filechk;//게시판 다중파일 확인.
	private int filechks;//이벤트 , 매장정보 다중파일업로드 체크
	private String b_display; // 게시글 사용여부 DEFAULT 'Y' 
	
	/*견적문의 게시판*/
	private String d_area;//지역
	private Date em_date;//배송희망일
	private String em_brand;//브랜드
	private String em_product;//제품분류
	private String em_choosedid;//채택된 사람, DEFAULT 'N'
	
	/*중고거래 게시판*/
	private String u_area;//지역
	private String u_product;//제품분류
	private String u_brand;//브랜드
	private String u_safety;//안전거래
	private String u_bors;//삽니다/팝니다
	
	/*매장정보 게시판*/
	private String sh_brand;//브랜드
	private String sh_name;//매장명
	private String sh_address;//매장주소
	private String sh_phone;//매장연락처
	private String sh_introduce;//업체소개
	private String sh_officehour;//운영시간
	private String sh_close;//휴무일
	private String sh_prproduct;//주제품군
	private String sh_list;//매장 전시 제품
	
	/*이벤트 게시판*/
	private Date ev_start;//이벤트 시작
	private Date ev_end;//이벤트 종료
	
	/*고객지원 게시판*/
	private String sup_answer;//답변
	private String sup_qanda;//문의유형
	
	public int getB_idx() {
		return b_idx;
	}
	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}
	public int getC_idx() {
		return c_idx;
	}
	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}
	public String getB_nick() {
		return b_nick;
	}
	public void setB_nick(String b_nick) {
		this.b_nick = b_nick;
	}
	public String getB_subject() {
		return b_subject;
	}
	public void setB_subject(String b_subject) {
		this.b_subject = b_subject;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public int getB_hit() {
		return b_hit;
	}
	public void setB_hit(int b_hit) {
		this.b_hit = b_hit;
	}
	public Date getB_date() {
		return b_date;
	}
	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getRcount() {
		return rcount;
	}
	public void setRcount(int rcount) {
		this.rcount = rcount;
	}
	public int getOnefilechk() {
		return onefilechk;
	}
	public void setOnefilechk(int onefilechk) {
		this.onefilechk = onefilechk;
	}
	public int getFilechk() {
		return filechk;
	}
	public void setFilechk(int filechk) {
		this.filechk = filechk;
	}
	public String getB_display() {
		return b_display;
	}
	public void setB_display(String b_display) {
		this.b_display = b_display;
	}
	public String getD_area() {
		return d_area;
	}
	public void setD_area(String d_area) {
		this.d_area = d_area;
	}
	public Date getEm_date() {
		return em_date;
	}
	public void setEm_date(Date em_date) {
		this.em_date = em_date;
	}
	public String getEm_brand() {
		return em_brand;
	}
	public void setEm_brand(String em_brand) {
		this.em_brand = em_brand;
	}
	public String getEm_product() {
		return em_product;
	}
	public void setEm_product(String em_product) {
		this.em_product = em_product;
	}
	public String getEm_choosedid() {
		return em_choosedid;
	}
	public void setEm_choosedid(String em_choosedid) {
		this.em_choosedid = em_choosedid;
	}
	public String getU_area() {
		return u_area;
	}
	public void setU_area(String u_area) {
		this.u_area = u_area;
	}
	public String getU_product() {
		return u_product;
	}
	public void setU_product(String u_product) {
		this.u_product = u_product;
	}
	public String getU_brand() {
		return u_brand;
	}
	public void setU_brand(String u_brand) {
		this.u_brand = u_brand;
	}
	public String getU_safety() {
		return u_safety;
	}
	public void setU_safety(String u_safety) {
		this.u_safety = u_safety;
	}
	public String getU_bors() {
		return u_bors;
	}
	public void setU_bors(String u_bors) {
		this.u_bors = u_bors;
	}
	public String getSh_brand() {
		return sh_brand;
	}
	public void setSh_brand(String sh_brand) {
		this.sh_brand = sh_brand;
	}
	public String getSh_name() {
		return sh_name;
	}
	public void setSh_name(String sh_name) {
		this.sh_name = sh_name;
	}
	public String getSh_address() {
		return sh_address;
	}
	public void setSh_address(String sh_address) {
		this.sh_address = sh_address;
	}
	public String getSh_phone() {
		return sh_phone;
	}
	public void setSh_phone(String sh_phone) {
		this.sh_phone = sh_phone;
	}
	public String getSh_introduce() {
		return sh_introduce;
	}
	public void setSh_introduce(String sh_introduce) {
		this.sh_introduce = sh_introduce;
	}
	public String getSh_officehour() {
		return sh_officehour;
	}
	public void setSh_officehour(String sh_officehour) {
		this.sh_officehour = sh_officehour;
	}
	public String getSh_close() {
		return sh_close;
	}
	public void setSh_close(String sh_close) {
		this.sh_close = sh_close;
	}
	
	public String getSh_list() {
		return sh_list;
	}
	public void setSh_list(String sh_list) {
		this.sh_list = sh_list;
	}
	public Date getEv_start() {
		return ev_start;
	}
	public void setEv_start(Date ev_start) {
		this.ev_start = ev_start;
	}
	public Date getEv_end() {
		return ev_end;
	}
	public void setEv_end(Date ev_end) {
		this.ev_end = ev_end;
	}
	public String getSup_answer() {
		return sup_answer;
	}
	public void setSup_answer(String sup_answer) {
		this.sup_answer = sup_answer;
	}
	public String getSup_qanda() {
		return sup_qanda;
	}
	public void setSup_qanda(String sup_qanda) {
		this.sup_qanda = sup_qanda;
	}

	public void setFilechks(int filechks) {
		this.filechks = filechks;
	}
	public int getFilechks() {
		return filechks;
	}
	public String getSh_prproduct() {
		return sh_prproduct;
	}
	public void setSh_prproduct(String sh_prproduct) {
		this.sh_prproduct = sh_prproduct;
	}
	
}
