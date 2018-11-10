<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String id=(String)session.getAttribute("id");
	
%>
<script type="text/javascript">

function recommend(){
	$('.recommend').click(function(){
		var id = $('id').val()
		var json = {"id":id};
		$.ajax({
			type : 'post',
			url : 'recommend_ok.jsp',
			data: json,
			success : function(response) {
				$('#printrecommend').html(response);
			}
		});
	});
};

</script>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" value=<%=id %> id="id">
	<div class="wrapper">
		<i class="ion-ios-heart"></i>
		<p class="recommend">
			Recommend<span class="ed">ed</span>
		</p>
		<span class="counter">1</span>
		<div class="boo"></div>
	</div>
	<div id="printrecommend">
	</div>
</body>
</html>