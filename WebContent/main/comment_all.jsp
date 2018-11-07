<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,com.sist.dao.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String bookno = request.getParameter("bookno");
	BookDAO dao = new BookDAO();
	
	ArrayList<BookCommentVO> list = dao.BookCommentAllData(Integer.parseInt(bookno));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
			for(BookCommentVO bookvo:list)
			{
		%>
	<ul id="replytext">
			
			<li id="replybubble">
				<div
					style="position: absolute; margin-left: -28px; margin-top: -6px; overflow: hidden; width: 48px; height: 48px; border-radius: 50%; transform: scale(0.75); background-image: url('https://s1.postimg.org/833nj7c7jj/image.jpg')"></div>
				<div id="commentwrap">
					<div id="commentself">
					<%-- <span id="bullemeta"><%=bookvo.getMem_name()%></span> --%>
					<%=bookvo.getMem_name()%>
						<p id="reply-messenger-bulle">
							<!-- 문장 -->
							<%=bookvo.getContent() %>
							<span id="bullemeta"><%=bookvo.getRegdate() %></span>
							
							<!--  <span id="like-holder"> <span
								class="like-main"=""=""> <span class="like-main-emo"></span>
									<span class="like">Like</span> <span class="likecount">511</span> -->
									
									
						</p>
					</div>
				</div>
			</li>
		</ul>
		<%
			}
		%>
</body>
</html>