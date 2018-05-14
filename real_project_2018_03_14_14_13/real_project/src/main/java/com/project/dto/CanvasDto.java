package com.project.dto;

import java.sql.Date;

//도면
public class CanvasDto {
	
	private int cv_idx;//도면 인덱스
	private String m_nick;//닉네임
	private Date cv_date;//작성일
	private String cv_subject;//제목
	private String cv_content;//내용
	private String cv_data;//도면저장
	
	public int getCv_idx() {
		return cv_idx;
	}
	public void setCv_idx(int cv_idx) {
		this.cv_idx = cv_idx;
	}
	public String getM_nick() {
		return m_nick;
	}
	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}
	public Date getCv_date() {
		return cv_date;
	}
	public void setCv_date(Date cv_date) {
		this.cv_date = cv_date;
	}
	public String getCv_subject() {
		return cv_subject;
	}
	public void setCv_subject(String cv_subject) {
		this.cv_subject = cv_subject;
	}
	public String getCv_content() {
		return cv_content;
	}
	public void setCv_content(String cv_content) {
		this.cv_content = cv_content;
	}
	public String getCv_data() {
		return cv_data;
	}
	public void setCv_data(String cv_data) {
		this.cv_data = cv_data;
	}
	
}
