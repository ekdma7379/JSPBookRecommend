<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.member.dao.*"%>
<%
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	BookMemberDAO dao = new BookMemberDAO();
	String result = dao.memberLogin(id, pwd);
	// result => NOID,NOPWD,OK
	if(result.equals("NOID"))
	{
%>
		<script type="text/javascript">
		alert("ID가 존재하지 않습니다.");
		history.back();
		</script>
<%
	}
	else if(result.equals("NOPWD"))
	{
%>
		<script type="text/javascript">
		alert("비밀번호가 틀립니다!!");
		history.back();
		</script>
<%
		
	}
	else // 로그인
	{
		/*
			정보를 서버측에 저장 session ex)로그인,장바구니
			session에 저장 => setAttribute()
			session에서 데이터를 가져올때 => getAttribute();
			session 해제 => invalidate();
			==> 저장 기간(톰캣 => default는 30분)
			
			session : HttpSession에 저장
			request는 지역변수
			session은 전역변수
		*/
		session.setAttribute("id", id);
		session.setAttribute("name", result);
		session.setAttribute("pwd", pwd);
		response.sendRedirect("main.jsp?no=0");
		
	}
	
%>