<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.sist.member.dao.*"%>
<%-- <jsp:useBean id="dao" class=com.sist.member.dao.BookMemberDAO/> --%>
<%
	BookMemberDAO dao = new BookMemberDAO();
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id"); 
	BookMemberVO vo = dao.memberDetailData(id);
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="container1">

		<!-- <div class="up1">
			<font size="4px" style="font-weight: bold">reddresseson (김유리)</font>
			<br /> <br /> <font color="#888888"> 제주대학교 |
				reddresseson@jejunu.ac.kr </font>
			<button type="button" class="settingbutton1">프로필 관리</button>
		</div> -->


		

		<img class="img2"
			src="https://avatars2.githubusercontent.com/u/26625229?s=400&u=2d80bafdaff8534bac59ea8b879e2e1bfad631ef&v=4"
			width="130px" height="130px" alt="프로필 사진" />

		<table class="about">
			<tr>
				<th class="text-right">NAME:</th>
				<td>&nbsp;<%=vo.getName()%></td>
			</tr>
			<tr>
				<th class="text-right">ID:</th>
				<td>&nbsp;<%=vo.getEmail()%></td>
			</tr>
			<tr>
				<th class="text-right">AGE:</th>
				<td>&nbsp;<%=vo.getAge()%></td>
			</tr>
			<tr>
				<th class="text-right">SEX::</th>
				<td>&nbsp;<%=vo.getSex()%></td>
			</tr>
			<tr>
				<th class="text-right">POSSITIVE</th>
				<td>&nbsp;<%=vo.getPossitive()%></td>
			</tr>
			<tr>
				<th class="text-right">LIVE</th>
				<td>&nbsp;<%=vo.getLive()%></td>
			</tr>
		</table>
		<br>
		<br>
		<hr size="1px" color="#CCCCCC" />
		<table>
			<form action="main.jsp?no=6" method="post">
			<tr colspan="2" class="text-right">
				<td><a href="main.jsp?no=6"><input type="submit" value="수정" class="btn btn-xm btn-primary"></a></td>
			</tr>
			</form>
		</table>
		<br>
	</div>

</body>
</html>