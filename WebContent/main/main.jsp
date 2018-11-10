<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.*,com.sist.change.*"%>

<%
	request.setCharacterEncoding("EUC-KR");
	String no=request.getParameter("no");
	String log_jsp;
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
%>
<!DOCTYPE html>
<html>

<head>

<meta charset="EUC-KR">

<title>Shop Homepage - Start Bootstrap Template</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/shop-homepage.css" rel="stylesheet">
<link href="css/comment.css" rel="stylesheet">
<link href="css/recommend.css" rel="stylesheet">
<script src="js/recommend.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function() { //jquery
		$('#tabs').tabs();
/* 		$('#accordion').accordion();
		$('#datepicker').datepicker(); */
		initNaver();
		initDaum();
		bookfind();
		bookSendComment();
		bookAllComment();
		booklike();
		recommend();
	});
	/* $.post("http://localhost:8080/BookRecommend/main/main.jsp") */
	function initDaum() {
		$.ajax({
			type : 'post',
			url : 'daum.jsp',
			success : function(response) {
				$('#daum').html(response);
			}
		});
	}
	function initNaver() {
		$.ajax({
			type : 'post',
			url : 'naver.jsp',
			success : function(response) {
				$('#naver').html(response);
			}
		});
	}
	function bookfind() {
		$('#searchBtn').click(function(){
			//$("#dialog").dialog();
			// 아이디와 패스워드가 입력 되었는지 확인해야한다.
			var name=$('#searchInput').val();
			if(name.trim()=="")
			{
				$('#searchInput').focus();
				alert("책 이름 X");
				return;
			}
				var type=$('#type').val();
				var bookFindData={"bookname":name,"type":type};
				// 전송
				$.ajax({
					type:'POST',
					url:'bookfind_ok.jsp',
					data:bookFindData,
					success:function(response)
					{
						$('#print').html(response);
					}
				});
		});
	}
	function bookAllComment(){
		var bookno=$('#bookNo').val();
		var commentData={"bookno":bookno};
		$.ajax({
			type:'POST',
			url:'comment_all.jsp',
			data:commentData,
			success:function(response)
			{
				$('#printComment').html(response);
			}
		});
	};
	
	function bookSendComment(){
		$('#send').click(function(){
			if($('idCheck')==null)
			{
				$('#comment').focus();
				alert("로그인 X");
				return;
			}
			var comment = $('#comment').val();
			if(comment.trim()=="")
			{
				$('#comment').focus();
				alert("댓글 X");
				return;
			}
			var bookno=$('#bookNo').val();
			var commentTotal=$('#commentTotal').val();
			var commentData={"comment":comment,"bookno":bookno,"commenttotal":commentTotal};
			$('#comment').empty();
			$.ajax({
				type:'POST',
				url:'comment_ok.jsp',
				data:commentData,
				success:function(response)
				{
					$('#printComment').html(response);
				}
			});
		});
		/* $('#like-holder').click(function(){
			// alert("눌림"); 
			var bookno=$('#bookNo').val();
			var likeData={"bookno":bookno};
			$.ajax({
				type:'POST',
				url:'bookLike_ok.jsp',
				data:likeData,
				
				
			});
		});  */
	}
	function booklike(){
		$('#like-holder').click(function(){
			/* alert("눌림"); */
			var bookno=$('#bookNo').val();
			var likeData={"bookno":bookno};
			$.ajax({
				type:'POST',
				url:'bookLike_ok.jsp',
				data:likeData
			});
		});
	}

</script>
<style type="text/css">
.my-4 {
	font-size: 11pt;
	font-weight: bold;
}
</style>
</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<jsp:include page="menubar.jsp"></jsp:include>
	</nav>
	<input type="hidden" value=<%=id %> id=idCheck>
	<!-- Page Content -->
	<div class="container" style="min-height:700px; _height:700px; margin-bottom: 30px;">

		<div class="row">
		
			<div class="col-lg-3">

				<!-- side page -->
				
				<!-- 로그인 -->
				
					<jsp:include page="<%=log_jsp %>"></jsp:include>
				
				<!-- 로그인 end-->
				
				<!-- 실시간 검색어 -->
				
					<jsp:include page="currentTopN.jsp"></jsp:include>
				
				<!-- side page end -->

			</div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9">

				

				<!-- content -->

				<jsp:include page="<%=jsp %>"></jsp:include>

				<!-- content end -->
				<!-- /.row -->

			</div>
			<!-- /.col-lg-9 -->

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

</body>

</html>
