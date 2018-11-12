<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
 <div class="container">
 <a class="navbar-brand" href="#">Book Recommend</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="main.jsp?no=1&dno=notdivide">회원가입
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="main.jsp?no=0&dno=divide">홈</a>
            </li>
             <li class="nav-item">
              <a class="nav-link" href="main.jsp?no=4&dno=divide">마이페이지</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="main.jsp?no=2&dno=divide">책 찾기</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="main.jsp?no=3&dno=divide">추천</a>
            </li>
          </ul>
        </div>
  </div>
</body>
</html>