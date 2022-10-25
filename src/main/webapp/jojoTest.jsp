<%@page import="luxe.dto.StyleBookDTO"%>
<%@page import="luxe.service.stylebook.StyleBookServiceImpl"%>
<%@page import="luxe.service.stylebook.StyleBookService"%>
<%@page import="luxe.dto.BidDTO"%>
<%@page import="java.util.List"%>
<%@page import="luxe.service.bid.BidServiceImpl"%>
<%@page import="luxe.service.bid.BidService"%>
<%@page import="luxe.controller.bid.BidController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	//BidService bidService = new BidServiceImpl();
	//bidService.selectAllBid();
	//BidDTO bid = bidService.checkDuplicatedBid(new BidDTO(2, 2, "ID", 0, null, null));

	//bidService.deleteBid(3, "id");
	//bidService.updateBidStatus(14);
	//bidService.updateBidPrice(new BidDTO(0, 1, "ID", 2500000, null, null));
	//bidService.insertBid(new BidDTO(0, 1, "ID", 100000, null, null));
	//BidDTO bid = bidService.getHighestBidPrice(3);
	//out.println(bid.getBidNo() + "|" + bid.getBidPrice() + "|" + bid.getUserId());

	
	StyleBookService stylebook = new StyleBookServiceImpl();
	
	/* List<StyleBookDTO> list = stylebook.selectAllStyleBook(null, 0, "like_no");
	System.out.println(list.size());
	for(StyleBookDTO s : list){
		out.println(s.getBoardContent()+"|"+s.getUserId()+"<br>");
	} */
	//StyleBookDTO s = stylebook.selectStyleBookByBoardRegNo(6, true);
	//out.println(s.getBoardContent()+"|"+s.getUserId()+"<br>");
	//stylebook.increaseStyleBookLikeNo(6);
	//stylebook.insertStyleBook(new StyleBookDTO(0, "id", 2, "멋져요", "test01.jpg", null, 0, 0));
	
	%>
</body>
</html>