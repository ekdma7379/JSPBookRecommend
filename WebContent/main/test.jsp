<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.*,com.sist.change.*"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<%
	request.setCharacterEncoding("EUC-KR");
	String no=request.getParameter("no");
	String log_jsp;
	String dno;
	if(no==null)
	{
		no="0";
	}
	String jsp=JspChange.change(Integer.parseInt(no));
	String id=(String)session.getAttribute("id");
	if(id==null)
	{
		log_jsp="login.jsp";
	}
	else
	{
		log_jsp="logout.jsp";
	}
	
	dno = request.getParameter("dno");
	if(dno==null)
	{
		dno="divide";
	}
%>
	
<%
	
%>
<!DOCTYPE html>
<html>

<head>

<meta charset="EUC-KR">

<title><%=dno %></title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/shop-homepage.css" rel="stylesheet">

</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<jsp:include page="menubar.jsp"></jsp:include>
	</nav>

	<!-- Page Content -->
	<div class="container" style="min-height:700px; _height:700px; margin-bottom: 30px;">

		<div class="row">
		<%
			if(dno.equals("notdivide"))
			{
		%>
			<jsp:include page="notdivide.jsp"></jsp:include>
			
		
		<%
			}
			else
			{
		%>
			<div class="col-lg-3">

				<!-- side page -->

				<jsp:include page="<%=log_jsp %>"></jsp:include>

				<!-- side page end -->

			</div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9">

				

				<!-- content -->

				<jsp:include page="<%=jsp %>"></jsp:include>

				<!-- content end -->
				<!-- /.row -->

			</div>
		<%
			}
		%>
		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<jsp:include page="footer.jsp"></jsp:include>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<!-- <script src="vendor/jquery/jquery.min.js"></script> -->
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	

</body>

</html>
