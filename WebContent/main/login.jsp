<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</style>
</head>
<body>
<form method="post" action="login_ok.jsp">
	<table class="table">
	 <tr>
	 	<td width=10% class="text-left">ID</td>
	 	<td width=90% class="text-left">
	 		<input type="text" name=id size=12>
	 	</td>
	 </tr>
	 <tr>
	 	<td width=10% class="text-left">PWD</td>
	 	<td width=90% class="text-left">
	 		<input type="password" name=pwd size=12>
	 	</td>
	 </tr>
	 <tr>
	 	<td colspan="2" class="text-left">
	 		<input type=submit value="로그인" class="btn btn-xs btn-success" id="loginBtn">
	 	</td>
	 </tr>
	</table>
</form>
</body>
</html>