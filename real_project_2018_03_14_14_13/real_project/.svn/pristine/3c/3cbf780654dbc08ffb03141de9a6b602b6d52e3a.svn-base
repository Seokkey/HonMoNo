package com.project.useClass;

public class MessagePaging {
	private int maxNum; 		// 전체 글의 개수
	private int pageNum; 		// 현재 페이지 번호
	private int listCount; //10		// 페이지당 나타낼 글의 갯수
	private int pageCount; //5		// 페이지그룹당 페이지 갯수
	private String boardUrl; 	// 게시판의 종류별 url
	private String category; //검색조건
	private String keyword; //검색조건
	private String searchtxt;	//검색조건
	private String msg_category; //쪽지 분류
	private String msg_recivenick; //공지 분류
	
	public MessagePaging(int maxNum, int pageNum, int listCount, int pageCount, String boardUrl, String category, String keyword, String searchtxt, String msg_category, String msg_recivenick) {
		this.maxNum = maxNum;
		this.pageNum = pageNum;
		this.listCount = listCount;
		this.pageCount = pageCount;
		this.boardUrl = boardUrl;
		this.category = category;
		this.keyword = keyword;
		this.searchtxt = searchtxt;
		this.msg_category = msg_category;
		this.msg_recivenick = msg_recivenick;
		
		
		System.out.println("페이징에서 받아온 maxNum:"+maxNum);
	}

	//if(area==null  && furnitureCategory==null && keyword==null   && searchtxt==null)
	//심각한 에러가 아니면 다 무시
	@SuppressWarnings("unused")
	public String makeHtmlPaging() {
		// 전체 페이지 갯수
		int totalPage = (maxNum % listCount > 0)
				?maxNum/listCount+1 : maxNum/listCount;
		// 전체 페이지 그룹 갯수
		int totalGroup = (totalPage % pageCount > 0)
				? totalPage/pageCount+1 : totalPage/pageCount;
		// 현재 페이지가 속해 있는 그룹 번호
		int currentGroup = (pageNum % pageCount > 0)
				? pageNum/pageCount+1 : pageNum/pageCount;
		return makeHtml(currentGroup, totalPage, boardUrl);
	}

	private String makeHtml(int currentGroup, int totalPage, String boardUrl) {
		StringBuffer sb = new StringBuffer();
		//현재그룹의 시작 페이지 번호
		int start = (currentGroup * pageCount) 
				    - (pageCount - 1);
		//현재그룹의 끝 페이지 번호
		int end = (currentGroup * pageCount >= totalPage)
				? totalPage
				: currentGroup * pageCount;
		
		if(category==null  && keyword==null  && searchtxt==null) { //검색이 아닐 경우
			System.out.println("검색이 아닌 페이징");
			if (start != 1) {
				sb.append("<a href='"+boardUrl+"?pageNum=" + (start -1) + "&msg_category="+msg_category+"&msg_recivenick="+msg_recivenick+"'>");
				sb.append("[이전]");
				sb.append("</a>");
			}
			
			for (int i = start; i <= end; i++) {
				if (pageNum != i) { //현재 페이지가 아닌 경우 링크처리
					sb.append("<a href='"+boardUrl+"?pageNum=" + i +  "&msg_category="+msg_category+"&msg_recivenick="+msg_recivenick+"'>");
					sb.append(" [ ");
					sb.append(i);
					sb.append(" ] ");
					sb.append("</a>");
				} else { //현재 페이지인 경우 링크 해제
					sb.append("<font style='color:red;'>");
					sb.append(" [ ");
					sb.append(i);
					sb.append(" ] ");
					sb.append("</font>");
				}
			}
			if (end != totalPage) {
				sb.append("<a href='"+boardUrl+"?pageNum=" + (end + 1) +  "&msg_category="+msg_category+"&msg_recivenick="+msg_recivenick+"'>");
				sb.append("[다음]");
				sb.append("</a>");
			}
		}else { //검색일 경우
			System.out.println("검색일 경우 페이징");
			if (start != 1) {
				sb.append("<a href='"+boardUrl+"?pageNum=" + (start -1) +  "&msg_category="+msg_category+"&msg_recivenick="+msg_recivenick+"&category="+category+"&keyword="+keyword+"&searchtxt="+searchtxt+"'>");
				sb.append("[이전]");
				sb.append("</a>");
			}
			
			for (int i = start; i <= end; i++) {
				if (pageNum != i) { //현재 페이지가 아닌 경우 링크처리""
					sb.append("<a href='"+boardUrl+"?pageNum="+i+"&msg_category="+msg_category+"&msg_recivenick="+msg_recivenick+"&category="+category+"&keyword="+keyword+"&searchtxt="+searchtxt+"'>");
					sb.append(" [ ");
					sb.append(i);
					sb.append(" ] ");
					sb.append("</a>");
				} else { //현재 페이지인 경우 링크 해제
					sb.append("<font style='color:red;'>");
					sb.append(" [ ");
					sb.append(i);
					sb.append(" ] ");
					sb.append("</font>");
				}
			}
			if (end != totalPage) {
				sb.append("<a href='"+boardUrl+"?pageNum=" + (end + 1) + "&msg_category="+msg_category+"&msg_recivenick="+msg_recivenick+"&category="+category+"&keyword="+keyword+"&searchtxt="+searchtxt+"'>");
				sb.append("[다음]");
				sb.append("</a>");
			}
			
		}
			
			
		return sb.toString();
	}
}
