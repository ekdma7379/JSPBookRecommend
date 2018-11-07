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
				<span class="fa fa-sign-in"></span> ȸ������
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
                        <label class="control-label">�̸���</label>
                        <input type="email" class="form-control" id="email" name="email">
                    </div>
                    <div class="form-group">
                        <label>��й�ȣ</label>
                        <input type="password" class="form-control" id="pwd" name="pwd">
                    </div>
                    <div class="form-group">
                        <label>��й�ȣ Ȯ��</label>
                        <input type="password" class="form-control" id="repwd" name="repwd">
                    </div>
                    <div class="form-group">
                        <label>�̸�</label>
                        <input type="text" class="form-control" id="name" name="name">
                    </div>
                    <div class="form-group">
                        <label>��� ����</label> 
                        <select class="form-control" id="live" name="live">
						<%-- <%
							for (LocationVO vo : locList) 
							{
						%>
						<option value="<%= vo.getName() %>"><%= vo.getName() %></option>
						<%
							}
						%> --%>

						<option value="����">����</option>
						<option value="���">���</option>
						<option value="��õ">��õ</option>
						<option value="����">����</option>
						<option value="����">����</option>
						<option value="�λ�">�λ�</option>
						<option value="�泲">�泲</option>
						<option value="�뱸">�뱸</option>
						<option value="���">���</option>
						<option value="���">���</option>
						<option value="����">����</option>
						<option value="�泲">�泲</option>
						<option value="���">���</option>
						<option value="����">����</option>
						<option value="����">����</option>
						<option value="����">����</option>
						<option value="����">����</option>
						
						
						

					</select>
				</div>
                    <div class="form-group">
                        <label>����</label>
                        <select class="form-control" id="sex" name="sex">
                            <option value="����">����</option>
                            <option value="����">����</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>����</label>
                        <input type="number" name="age" id="age" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>��ȣ�帣</label>
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
                    <button type="submit" class="btn btn-info btn-lg btn-block">ȸ������</button>
                </form>
                <hr>
                <p>
                    <a href="/">ó������</a></p>
    </div>
</div>
</body>
</html>