<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="logout_ok.jsp">
	<table class="table">
	 <tr>
	 	<td width=10% class="text-left">
	 	<%=session.getAttribute("name")+"님" %>
	 	</td>
	 </tr>
	 <tr>
	 	<td width=10% class="text-left">로그인 중입니다.</td>
	 	
	 </tr>
	 <tr>
	 	<td class="text-right">
	 		<input type=submit value="로그아웃" class="btn btn-xs btn-success">
	 	</td>
	 </tr>
	</table>
	</form>
</body>
</html>