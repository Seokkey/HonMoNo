package com.project.dto;

import java.sql.Date;

//댓글
public class ReplyDto {
	
	private int r_idx;//댓글 인덱스
	private String r_nick;//닉네임
	private int b_idx;//게시글 번호
	private String r_content;//댓글 내용
	private Date r_date;//댓글 작성일
	private String r_display; // 댓글 사용여부
	
	/*대댓글*/
	private int rr_idx;//대댓글 인덱스
	private String rr_content;//댓글 내용
	private Date rr_date;//댓글 작성일
	private String rr_nick;//닉네임
	private String rr_display; // 대댓글 사용여부s
	
	public int getR_idx() {
		return r_idx;
	}
	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}
	public String getR_nick() {
		return r_nick;
	}
	public void setR_nick(String r_nick) {
		this.r_nick = r_nick;
	}
	public int getB_idx() {
		return b_idx;
	}
	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	public int getRr_idx() {
		return rr_idx;
	}
	public void setRr_idx(int rr_idx) {
		this.rr_idx = rr_idx;
	}
	public String getRr_content() {
		return rr_content;
	}
	public void setRr_content(String rr_content) {
		this.rr_content = rr_content;
	}
	public Date getRr_date() {
		return rr_date;
	}
	public void setRr_date(Date rr_date) {
		this.rr_date = rr_date;
	}
	public String getRr_nick() {
		return rr_nick;
	}
	public void setRr_nick(String rr_nick) {
		this.rr_nick = rr_nick;
	}
	public String getR_display() {
		return r_display;
	}
	public void setR_display(String r_display) {
		this.r_display = r_display;
	}
	public String getRr_display() {
		return rr_display;
	}
	public void setRr_display(String rr_display) {
		this.rr_display = rr_display;
	}
	
}
