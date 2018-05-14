package com.project.dto;

import java.sql.Date;
import java.util.List;

//안전거래
public class SafeDealDto {

	private int sfd_idx;//안전거래 인덱스
	private int b_idx;//게시글 번호
	private String sfd_sellid;//판매자 닉네임
	private String sfd_buyid;//구매자 닉네임
	private String sfd_name;//구매자 이름
	private Date sfd_dvdate;//배송 희망일
	private String sfd_phone1;//연락처1
	private String sfd_phone2;//연락처2
	private int sfd_address1;//우편번호
	private String sfd_address2;//기본주소
	private String sfd_address3;//상세주소	
	private String sfd_sumprice;//총결제금액
	private String sfd_etccontract;//기타특약, DEFAULT 'N'
	private Date sfd_dealdate;//계약일
	private String sfd_mdgroup;//카테고리
	private String sfd_brand;//브랜드
	private String sfd_state;//거래진행상태, DEFAULT '거래요청'
	private String sfd_product;//분류
	
	/*안전거래, 제품정보*/
	private int si_idx;//모델명
	private String si_model;//모델명
	private String si_size;//규격
	private String si_color;//색상
	private String si_amount;//수량
	private String si_price;//금액
	private String si_note;//비고, DEFAULT 'N'
	private List<SafeDealDto> list;
	
	public int getSfd_idx() {
		return sfd_idx;
	}
	public void setSfd_idx(int sfd_idx) {
		this.sfd_idx = sfd_idx;
	}
	public int getB_idx() {
		return b_idx;
	}
	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}
	public String getSfd_sellid() {
		return sfd_sellid;
	}
	public void setSfd_sellid(String sfd_sellid) {
		this.sfd_sellid = sfd_sellid;
	}
	public String getSfd_buyid() {
		return sfd_buyid;
	}
	public void setSfd_buyid(String sfd_buyid) {
		this.sfd_buyid = sfd_buyid;
	}
	public String getSfd_name() {
		return sfd_name;
	}
	public void setSfd_name(String sfd_name) {
		this.sfd_name = sfd_name;
	}
	public Date getSfd_dvdate() {
		return sfd_dvdate;
	}
	public void setSfd_dvdate(Date sfd_dvdate) {
		this.sfd_dvdate = sfd_dvdate;
	}
	public String getSfd_phone1() {
		return sfd_phone1;
	}
	public void setSfd_phone1(String sfd_phone1) {
		this.sfd_phone1 = sfd_phone1;
	}
	public String getSfd_phone2() {
		return sfd_phone2;
	}
	public void setSfd_phone2(String sfd_phone2) {
		this.sfd_phone2 = sfd_phone2;
	}
	public int getSfd_address1() {
		return sfd_address1;
	}
	public void setSfd_address1(int sfd_address1) {
		this.sfd_address1 = sfd_address1;
	}
	public String getSfd_address2() {
		return sfd_address2;
	}
	public void setSfd_address2(String sfd_address2) {
		this.sfd_address2 = sfd_address2;
	}
	public String getSfd_address3() {
		return sfd_address3;
	}
	public void setSfd_address3(String sfd_address3) {
		this.sfd_address3 = sfd_address3;
	}
	public String getSfd_sumprice() {
		return sfd_sumprice;
	}
	public void setSfd_sumprice(String sfd_sumprice) {
		this.sfd_sumprice = sfd_sumprice;
	}
	public String getSfd_etccontract() {
		return sfd_etccontract;
	}
	public void setSfd_etccontract(String sfd_etccontract) {
		this.sfd_etccontract = sfd_etccontract;
	}
	public Date getSfd_dealdate() {
		return sfd_dealdate;
	}
	public void setSfd_dealdate(Date sfd_dealdate) {
		this.sfd_dealdate = sfd_dealdate;
	}
	public String getSfd_mdgroup() {
		return sfd_mdgroup;
	}
	public void setSfd_mdgroup(String sfd_mdgroup) {
		this.sfd_mdgroup = sfd_mdgroup;
	}
	public String getSfd_brand() {
		return sfd_brand;
	}
	public void setSfd_brand(String sfd_brand) {
		this.sfd_brand = sfd_brand;
	}
	public String getSfd_state() {
		return sfd_state;
	}
	public void setSfd_state(String sfd_state) {
		this.sfd_state = sfd_state;
	}
	public String getSfd_product() {
		return sfd_product;
	}
	public void setSfd_product(String sfd_product) {
		this.sfd_product = sfd_product;
	}
	public String getSi_model() {
		return si_model;
	}
	public void setSi_model(String si_model) {
		this.si_model = si_model;
	}
	public String getSi_size() {
		return si_size;
	}
	public void setSi_size(String si_size) {
		this.si_size = si_size;
	}
	public String getSi_color() {
		return si_color;
	}
	public void setSi_color(String si_color) {
		this.si_color = si_color;
	}
	public String getSi_amount() {
		return si_amount;
	}
	public void setSi_amount(String si_amount) {
		this.si_amount = si_amount;
	}
	public String getSi_price() {
		return si_price;
	}
	public void setSi_price(String si_price) {
		this.si_price = si_price;
	}
	public String getSi_note() {
		return si_note;
	}
	public void setSi_note(String si_note) {
		this.si_note = si_note;
	}
	public List<SafeDealDto> getList() {
		return list;
	}
	public void setList(List<SafeDealDto> list) {
		this.list = list;
	}
	public int getSi_idx() {
		return si_idx;
	}
	public void setSi_idx(int si_idx) {
		this.si_idx = si_idx;
	}
	
}
