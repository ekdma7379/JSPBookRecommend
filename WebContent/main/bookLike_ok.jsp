<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.dao.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	BookDAO dao = new BookDAO();
	String bookno = request.getParameter("bookno");
	String mem_id = (String)session.getAttribute("id");
	bookIsReadVO vo = new bookIsReadVO();
	vo.setBook_no(Integer.parseInt(bookno));
	vo.setMem_no(mem_id);
	String result=dao.BookLikeInsert(vo);
%>
<%-- <%=result %> --%>
