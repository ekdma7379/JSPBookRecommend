<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.member.dao.*"%>
    
<jsp:useBean id="dao" class="com.sist.member.dao.BookMemberDAO"></jsp:useBean>
<%
	ArrayList<LocationVO> locList = dao.LocationDataAll();
	ArrayList<PossitiveVO> postiveList = dao.possitiveDataAll();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="container">

    <div class="col-sm-10 col-sm-offset-3">
			<br>
			<h1>
				<span class="fa fa-sign-in"></span> 회원가입
			</h1>

			<hr>

        <!-- show any messages that come back with authentication -->
        <%-- <% if (message.length > 0) { %>
            <div class="alert alert-danger">
                <%= message %>
            </div>
            <% } %> --%>

                <!-- LOGIN FORM -->
                <form action="signup_ok.jsp" method="post" id="signupForm">
                <input type="hidden" value="1" name="no">
                    <div class="form-group">
                        <label class="control-label">이메일</label>
                        <input type="email" class="form-control" id="email" name="email">
                    </div>
                    <div class="form-group">
                        <label>비밀번호</label>
                        <input type="password" class="form-control" id="pwd" name="pwd">
                    </div>
                    <div class="form-group">
                        <label>비밀번호 확인</label>
                        <input type="password" class="form-control" id="repwd" name="repwd">
                    </div>
                    <div class="form-group">
                        <label>이름</label>
                        <input type="text" class="form-control" id="name" name="name">
                    </div>
                    <div class="form-group">
                        <label>사는 지역</label> 
                        <select class="form-control" id="live" name="live">
						<%-- <%
							for (LocationVO vo : locList) 
							{
						%>
						<option value="<%= vo.getName() %>"><%= vo.getName() %></option>
						<%
							}
						%> --%>

						<option value="서울">서울</option>
						<option value="경기">경기</option>
						<option value="인천">인천</option>
						<option value="강원">강원</option>
						<option value="서울">서울</option>
						<option value="부산">부산</option>
						<option value="경남">경남</option>
						<option value="대구">대구</option>
						<option value="경북">경북</option>
						<option value="울산">울산</option>
						<option value="대전">대전</option>
						<option value="충남">충남</option>
						<option value="충북">충북</option>
						<option value="광주">광주</option>
						<option value="전남">전남</option>
						<option value="전남">전남</option>
						<option value="제주">제주</option>
						
						
						

					</select>
				</div>
                    <div class="form-group">
                        <label>성별</label>
                        <select class="form-control" id="sex" name="sex">
                            <option value="남자">남자</option>
                            <option value="여자">여자</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>나이</label>
                        <input type="number" name="age" id="age" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>선호장르</label>
                        <select class="form-control" id="possitive" name="possitive">
                            	<% for(PossitiveVO vo : postiveList) 
                                	{ 
                                %>
                                    <option value="<%= vo.getName() %>"><%= vo.getName() %></option>
                                <% 
                                	} 
                                %> 
                                <!-- <option value="IT">IT</option> -->
                        </select>
                    </div>
                    <br>
                    <button type="submit" class="btn btn-info btn-lg btn-block">회원가입</button>
                </form>
                <hr>
                <p>
                    <a href="/">처음으로</a></p>
    </div>
</div>
</body>
</html>