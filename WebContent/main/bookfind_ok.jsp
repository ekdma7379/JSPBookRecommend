<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.sist.dao.*,java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("bookname");
	String type = request.getParameter("type");
	BookDAO dao = new BookDAO();
	
%>
<!-- <script type="text/javascript">
	alert("type:"+type+"name:"+name);
</script> -->
<%
	ArrayList<BookVO> list = dao.BookSearchData(type, name);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<%
				for(BookVO vo:list)
				{
			%>
		<div class="col-sm-3">
			<div class="panel panel-primary">
				<%-- <div class="panel-heading"><%=vo.getTitle().length()>11?vo.getTitle().substring(0,11)+"...":vo.getTitle()%></div> --%>
				<div class="panel-heading"><%=vo.getTitle().length()>11?vo.getTitle().substring(0,11)+"...":vo.getTitle()%></div>
				<div class="panel-body">
					<a href="main.jsp?no=5&bookno=<%=vo.getNo()%>"> <img
						src="<%=vo.getImage()%>" width=100% height="250"
						class="img-rounded">
					</a>
				</div>
			</div>
		</div>
		<%
				}
			%>
	</div>
</body>
</html>