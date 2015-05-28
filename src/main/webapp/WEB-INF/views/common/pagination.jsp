<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.community.web.Constants" %>
<%
	String pageCountStr = request.getParameter(Constants.PAGE_COUNT);
	int pageCount = Integer.parseInt(pageCountStr);
	String currentPageStr = request.getParameter(Constants.CURRENT_PAGE);
	int currentPage = Integer.parseInt(currentPageStr);
	String pageHref = request.getParameter(Constants.CURRENT_URL);
%>
<%
	if(pageCount > 0 ){
%>
	<div class="pagination pagination-large pagination-right">
		<ul>
			<%
				if(currentPage <= 1){
					out.print("<li class=\"active\"><a href=\""+pageHref + (currentPage-1)+"\">上一页</a>");
				}else {
					out.print("<li><a href=\""+pageHref + (currentPage-1)+"\">上一页</a>");
				}
				
				if(pageCount <= 6){//1 2 3 4 5 6
					for (int i = 1; i <= pageCount; ++i) {
						if(i == currentPage){
							out.print("<li class=\"active\"><a href=\""+pageHref + i+"\">"+i+"</a>");
						}else {
							out.print("<li><a href=\""+pageHref + i+"\">"+i+"</a>");			
						}
	 				}
				}else {//页数大于6
					if(currentPage <= 4){//1 2 3 4 5 6 ... Max
						for (int i = 1; i <= 6; ++i) {
							if(i == currentPage){
								out.print("<li class=\"active\"><a href=\""+pageHref + i+"\">"+i+"</a>");
							}else {
								out.print("<li><a href=\""+pageHref + i+"\">"+i+"</a>");			
							}
						}
						out.print("<li><a href=\"javascript:void(0)\">...</a></li>");	
						out.print("<li><a href=\""+pageHref+pageCount+"\">"+pageCount+"</a></li>");		
					}else if(currentPage >= pageCount - 4){//1...21 22 23 24 25 26
						out.print("<li><a href=\""+pageHref+1+"\">"+1+"</a></li>");
						out.print("<li><a href=\"javascript:void(0)\">...</a></li>");		
						for (int i = pageCount - 5; i <= pageCount; ++i) {
							if(i == currentPage){
								out.print("<li class=\"active\"><a href=\""+pageHref + i+"\">"+i+"</a>");
							}else {
								out.print("<li><a href=\""+pageHref + i+"\">"+i+"</a>");			
							}
						}
					}else {//1...19 20 21 22 23 ... Max
						out.print("<li><a href=\""+pageHref+1+"\">"+1+"</a></li>");
						out.print("<li><a href=\"javascript:void(0)\">...</a></li>");		
						for (int i = currentPage - 2; i <= currentPage + 2; ++i) {
							if(i == currentPage){
								out.print("<li class=\"active\"><a href=\""+pageHref + i+"\">"+i+"</a>");
							}else {
								out.print("<li><a href=\""+pageHref + i+"\">"+i+"</a>");			
							}
						}
						out.print("<li><a href=\"javascript:void(0)\">...</a></li>");
						out.print("<li><a href=\""+pageHref+pageCount+"\">"+pageCount+"</a></li>");	
					}
				}
				if(currentPage >= pageCount){
					out.print("<li class=\"active\"><a href=\""+pageHref + (currentPage + 1)+"\">下一页</a>");
				}else {
					out.print("<li><a href=\""+pageHref + (currentPage + 1)+"\">下一页</a>");
				}
	 		%>	
	 		
		</ul>
		
	</div>
<%
	}
%>