package com.project.dto;


//쪽지
public class MessageDto {
	
	private int msg_idx;//메세지 인덱스
	private String msg_recivenick;//받는사람 닉네임
	private String msg_sendnick;//보내는사람 닉네임
	private String msg_content;//메세지 내용
	private String msg_date;//메세지 작성일
	private String msg_category;//메세지 분류
	private String msg_check;//읽었는지 확인
	private String msg_display; // 쪽지 사용여부
	private int b_idx; //쪽지 연결 글 인덱스
	private String b_subject; //쪽지 연결 글 제목 DB 저장 X
	private String msg_sfdcheck; //추가, 안전거래 여부 체크
	private int c_idx; //쪽지 c_idx db 저장 X
	private int c_num; //쪽지 c_num db 저장 X
	
	public int getMsg_idx() {
		return msg_idx;
	}
	public void setMsg_idx(int msg_idx) {
		this.msg_idx = msg_idx;
	}
	public String getMsg_recivenick() {
		return msg_recivenick;
	}
	public void setMsg_recivenick(String msg_recivenick) {
		this.msg_recivenick = msg_recivenick;
	}
	public String getMsg_sendnick() {
		return msg_sendnick;
	}
	public void setMsg_sendnick(String msg_sendnick) {
		this.msg_sendnick = msg_sendnick;
	}
	public String getMsg_content() {
		return msg_content;
	}
	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}
	public String getMsg_date() {
		return msg_date;
	}
	public void setMsg_date(String msg_date) {
		this.msg_date = msg_date;
	}
	public String getMsg_category() {
		return msg_category;
	}
	public void setMsg_category(String msg_category) {
		this.msg_category = msg_category;
	}
	public String getMsg_check() {
		return msg_check;
	}
	public void setMsg_check(String msg_check) {
		this.msg_check = msg_check;
	}
	public String getMsg_display() {
		return msg_display;
	}
	public void setMsg_display(String msg_display) {
		this.msg_display = msg_display;
	}
	public int getB_idx() {
		return b_idx;
	}
	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}
	public String getB_subject() {
		return b_subject;
	}
	public void setB_subject(String b_subject) {
		this.b_subject = b_subject;
	}
	public String getMsg_sfdcheck() {
		return msg_sfdcheck;
	}
	public void setMsg_sfdcheck(String msg_sfdcheck) {
		this.msg_sfdcheck = msg_sfdcheck;
	}
	public int getC_idx() {
		return c_idx;
	}
	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}	
	
}
