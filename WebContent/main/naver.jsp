<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.manager.*,java.util.*"%>
<jsp:useBean id="mgr" class="com.sist.manager.NaverDaumManager"/>
<%
	ArrayList<String> list = mgr.NaverFindDate();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<body>
	<table class="table table-hover">
		<%
			int r=1;
			String color="active";
			for(String s:list)
			{
				if(r%2==0)
				{
					color="active";
				}
				else
				{
					color="";
				}
		%>
			<tr>
				<td class="text-left <%=color%>"><%=r+"위. "+ s %></td>
			</tr>
		<%
			r++;
			}
		%>
	</table>
</body>
</html>