<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1 class="my-4">실시간 검색어</h1>
				<div class="list-group">
					<div id="tabs">
						<ul>
							<li><a href="#tab-1">Daum</a></li>
							<li><a href="#tab-2">Naver</a></li>
						</ul>
						<div id="tab-1">
							<%-- <jsp:include page="daum.jsp"></jsp:include> --%>
							<div id="daum">
							</div>
						</div>
						<div id="tab-2">
							<div id="naver">
							</div>
						</div>
					</div>
				</div>
</body>
</html>