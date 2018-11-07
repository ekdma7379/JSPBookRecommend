<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.sist.member.dao.*,java.util.*"%>

<%
	request.setCharacterEncoding("EUC-KR");
	BookMemberDAO dao = new BookMemberDAO();
	BookMemberVO vo = new BookMemberVO();
	String repwd = request.getParameter("repwd");
	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String sex = request.getParameter("sex");
	String possitive = request.getParameter("possitive");
	String live = request.getParameter("live");
	
	vo.setEmail(email);
	vo.setPwd(pwd);
	vo.setName(name);
	vo.setAge(Integer.parseInt(age));
	vo.setSex(sex);
	vo.setPossitive(possitive);
	vo.setLive(live);
%>


<%-- <jsp:useBean class="com.sist.member.dao.BookMemberVO" id="memberVo">
	<jsp:setProperty name="memberVo" property="*">
</jsp:useBean> --%>
<%
if(repwd.equals(vo.getPwd()))
{
	dao.insertBookMember(vo);
}
	response.sendRedirect("main.jsp?no=0");
%>
