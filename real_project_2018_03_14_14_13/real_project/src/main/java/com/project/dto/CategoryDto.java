package com.project.dto;

public class CategoryDto {
	private int c_idx;//카테고리 인덱스
	private String c_name;//카테고리 이름
	private String c_group;//대분류 구분
	private int c_num;//카테고리 분류번호
	private String c_mdgroup;//중분류 구분
	private String b_nick;// 닉네임 디비 저장 X
	
	public int getC_idx() {
		return c_idx;
	}
	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_group() {
		return c_group;
	}
	public void setC_group(String c_group) {
		this.c_group = c_group;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public String getC_mdgroup() {
		return c_mdgroup;
	}
	public void setC_mdgroup(String c_mdgroup) {
		this.c_mdgroup = c_mdgroup;
	}
	public String getB_nick() {
		return b_nick;
	}
	public void setB_nick(String b_nick) {
		this.b_nick = b_nick;
	}

	
}
