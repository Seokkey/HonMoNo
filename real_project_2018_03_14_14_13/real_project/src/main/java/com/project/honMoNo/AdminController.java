package com.project.honMoNo;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.dto.CategoryDto;
import com.project.dto.MemberDto;
import com.project.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService admService;
	
	//rating 3인 가입대기업체 리스트 호출
	@RequestMapping(value = "/mList1",  produces = "application/json; charset=utf8")
	public @ResponseBody Map<String, List<MemberDto>> mList1(MemberDto mDto){
		
		Map<String, List<MemberDto>> mList1Map = null;
		
		mList1Map = admService.mList1(mDto);
		
		return mList1Map;	
	}	
	
	//가입대기업체 rating 3에서 2로 업데이트
	@RequestMapping(value = "/memberRatingUp",  produces = "application/json; charset=utf8")
	public @ResponseBody int memberRatingUp(MemberDto mDto){
		
		int success = admService.memberRatingUp(mDto.getM_nick());
		
		return success;
	}
	
	//rating 1인 소비자 리스트 호출
	@RequestMapping(value = "/mList2",  produces = "application/json; charset=utf8")
	public @ResponseBody Map<String, List<MemberDto>> mList2(MemberDto mDto){
		
		Map<String, List<MemberDto>> mList2Map = null;
		
		mList2Map = admService.mList2(mDto);
		
		return mList2Map;	
	}	
	
	//rating 1인 소비자 정보 삭제
	@RequestMapping(value = "/mDel",  produces = "application/json; charset=utf8")
	public @ResponseBody int mDel(MemberDto mDto){
		
		int success = admService.mDel(mDto.getM_nick());
		
		return success;
	}
	
	//rating 2인 업체 리스트 호출
	@RequestMapping(value = "/mList3",  produces = "application/json; charset=utf8")
	public @ResponseBody Map<String, List<MemberDto>> mList3(MemberDto mDto){
		
		Map<String, List<MemberDto>> mList3Map = null;
		
		mList3Map = admService.mList3(mDto);
		
		return mList3Map;	
	}	
	
	//rating 2인 소비자 정보 삭제
	@RequestMapping(value = "/msDel",  produces = "application/json; charset=utf8")
	public @ResponseBody int msDel(MemberDto mDto){
		
		int success = admService.msDel(mDto.getM_nick());
		
		return success;
	}
	
}