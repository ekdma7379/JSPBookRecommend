<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.member.dao.*,java.util.*"%>
<jsp:useBean id="dao" class="com.sist.member.dao.BookMemberDAO"></jsp:useBean>
<%
	ArrayList<LocationVO> locList = dao.LocationDataAll();
	ArrayList<PossitiveVO> postiveList = dao.possitiveDataAll();
	String id = (String)session.getAttribute("id");
	BookMemberVO vo = dao.memberDetailData(id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="col-sm-10 col-sm-offset-3">
			<br>
			<h1>
				<span class="fa fa-sign-in"></span> 회원수정
			</h1>

			<hr>

        <!-- show any messages that come back with authentication -->
        <%-- <% if (message.length > 0) { %>
            <div class="alert alert-danger">
                <%= message %>
            </div>
            <% } %> --%>

                <!-- LOGIN FORM -->
                <form action="update_ok.jsp" method="post" id="signupForm">
                <input type="hidden" value="1" name="no">
                    <div class="form-group">
                        <label class="control-label">이메일</label>
                        <input value="<%=vo.getEmail() %>" type="email" class="form-control" id="email" name="email">
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
                        <input value="<%=vo.getName()%>" type="text" class="form-control" id="name" name="name">
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

						<option <%=vo.getLive().equals("서울")?"selected":"" %> value="서울">서울</option>
						<option <%=vo.getLive().equals("경기")?"selected":"" %> value="경기">경기</option>
						<option <%=vo.getLive().equals("인천")?"selected":"" %> value="인천">인천</option>
						<option <%=vo.getLive().equals("강원")?"selected":"" %> value="강원">강원</option>
						<option value="부산" <%=vo.getLive().equals("부산")?"selected":"" %>>부산</option>
						<option value="경남" <%=vo.getLive().equals("경남")?"selected":"" %>>경남</option>
						<option value="대구" <%=vo.getLive().equals("대구")?"selected":"" %>>대구</option>
						<option value="경북" <%=vo.getLive().equals("경북")?"selected":"" %>>경북</option>
						<option value="울산" <%=vo.getLive().equals("울산")?"selected":"" %>>울산</option>
						<option value="대전" <%=vo.getLive().equals("대전")?"selected":"" %>>대전</option>
						<option value="충남" <%=vo.getLive().equals("충남")?"selected":"" %>>충남</option>
						<option value="충북" <%=vo.getLive().equals("충북")?"selected":"" %>>충북</option>
						<option value="광주" <%=vo.getLive().equals("광주")?"selected":"" %>>광주</option>
						<option value="전북" <%=vo.getLive().equals("전북")?"selected":"" %>>전북</option>
						<option value="전남" <%=vo.getLive().equals("전남")?"selected":"" %>>전남</option>
						<option value="제주" <%=vo.getLive().equals("제주")?"selected":"" %>>제주</option>
						
						
						

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
                        <input value="<%= vo.getAge() %>" type="number" name="age" id="age" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>선호장르</label>
                        <select class="form-control" id="possitive" name="possitive">
                            	<% for(PossitiveVO posVO : postiveList) 
                                	{ 
                                %>
                                    <option <%=posVO.getName().equals(vo.getPossitive())?"selected":"" %> value="<%= posVO.getName() %>"><%= posVO.getName() %></option>
                                <% 
                                	} 
                                %> 
                                <!-- <option value="IT">IT</option> -->
                        </select>
                    </div>
                    <br>
                    <button type="submit" class="btn btn-info btn-lg btn-block">정보수정</button>
                </form>
                <hr>
                <p>
                    <a href="/">처음으로</a></p>
    </div>
</body>
</html>