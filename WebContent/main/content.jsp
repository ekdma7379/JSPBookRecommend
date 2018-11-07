<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,com.sist.dao.*"%>
<%
	BookDAO dao = new BookDAO();
	ArrayList<BookVO> list = dao.BookinfoAllData(1);
	int size=12;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
				<!-- slider -->
				<jsp:include page="slider.jsp"></jsp:include>
				<!-- slider end -->

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
					<a href="main.jsp?no=5&bookno=<%=vo.getNo()%>">
					<img src="<%=vo.getImage()%>" width=100% height="250" class="img-rounded">
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