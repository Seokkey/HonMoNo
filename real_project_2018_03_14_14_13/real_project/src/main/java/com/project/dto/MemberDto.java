package com.project.dto;

import java.sql.Date;
//소비자, 업체 가입정보
public class MemberDto {
	
	private String m_nick;//닉네임
	private String m_id;//아이디
	private String m_pass;//비밀번호
	private Date m_date;//가입일
	private String m_name;//가입자 이름
	private int m_address1;//우편번호
	private String m_address2;//기본주소
	private String m_address3;//상세주소
	private String m_phone;//가입자 연락처
	private int m_rating;//회원등급
	private String m_agree;//개인정보 제공 동의
	private String m_key;//이메일 인증번호
	private String m_status;//이메일 인증상태 확인
	
	private String ms_conum;//사업자등록번호
	private String ms_ceoname;//대표자이름
	private String ms_shopname;//매장이름
	private String ms_phone;//매장연락처
	private String ms_brand;//브랜드
	private int rnum;//date 오래된 순으로 부여한 rnum
	
	public String getM_nick() {
		return m_nick;
	}
	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pass() {
		return m_pass;
	}
	public void setM_pass(String m_pass) {
		this.m_pass = m_pass;
	}
	public Date getM_date() {
		return m_date;
	}
	public void setM_date(Date m_date) {
		this.m_date = m_date;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public int getM_address1() {
		return m_address1;
	}
	public void setM_address1(int m_address1) {
		this.m_address1 = m_address1;
	}
	public String getM_address2() {
		return m_address2;
	}
	public void setM_address2(String m_address2) {
		this.m_address2 = m_address2;
	}
	public String getM_address3() {
		return m_address3;
	}
	public void setM_address3(String m_address3) {
		this.m_address3 = m_address3;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public int getM_rating() {
		return m_rating;
	}
	public void setM_rating(int m_rating) {
		this.m_rating = m_rating;
	}
	public String getM_agree() {
		return m_agree;
	}
	public void setM_agree(String m_agree) {
		this.m_agree = m_agree;
	}
	public String getM_key() {
		return m_key;
	}
	public void setM_key(String m_key) {
		this.m_key = m_key;
	}
	public String getM_status() {
		return m_status;
	}
	public void setM_status(String m_status) {
		this.m_status = m_status;
	}
	public String getMs_conum() {
		return ms_conum;
	}
	public void setMs_conum(String ms_conum) {
		this.ms_conum = ms_conum;
	}
	public String getMs_ceoname() {
		return ms_ceoname;
	}
	public void setMs_ceoname(String ms_ceoname) {
		this.ms_ceoname = ms_ceoname;
	}
	public String getMs_shopname() {
		return ms_shopname;
	}
	public void setMs_shopname(String ms_shopname) {
		this.ms_shopname = ms_shopname;
	}
	public String getMs_phone() {
		return ms_phone;
	}
	public void setMs_phone(String ms_phone) {
		this.ms_phone = ms_phone;
	}
	public String getMs_brand() {
		return ms_brand;
	}
	public void setMs_brand(String ms_brand) {
		this.ms_brand = ms_brand;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	
}
