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
		alert("ID�� �������� �ʽ��ϴ�.");
		history.back();
		</script>
<%
	}
	else if(result.equals("NOPWD"))
	{
%>
		<script type="text/javascript">
		alert("��й�ȣ�� Ʋ���ϴ�!!");
		history.back();
		</script>
<%
		
	}
	else // �α���
	{
		/*
			������ �������� ���� session ex)�α���,��ٱ���
			session�� ���� => setAttribute()
			session���� �����͸� �����ö� => getAttribute();
			session ���� => invalidate();
			==> ���� �Ⱓ(��Ĺ => default�� 30��)
			
			session : HttpSession�� ����
			request�� ��������
			session�� ��������
		*/
		session.setAttribute("id", id);
		session.setAttribute("name", result);
		session.setAttribute("pwd", pwd);
		response.sendRedirect("main.jsp?no=0");
		
	}
	
%>