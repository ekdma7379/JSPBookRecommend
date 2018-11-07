<%@page import="com.sist.dao.BookVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.*,com.sist.member.dao.*"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String id=(String)session.getAttribute("id");
	String bookno = request.getParameter("bookno");    
%>
<jsp:useBean id="dao" class="com.sist.dao.BookDAO"></jsp:useBean>
<%
	BookVO vo = dao.BookDetailData(Integer.parseInt(bookno));
	int total = dao.BookCommentTotal(vo.getNo());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h3>
			&lt;<%=vo.getTitle()%>&gt; 상세보기
		</h3>
		<table class="table">
			<tr>
				<td><a href="main.jsp?no=0" class="btn btn-sm btn-warning">목록</a>
			</tr>
		</table>
		<div class="row">
			<table class="table table-hover">
				<%-- <tr class="danger">
				<th>no</th>
				<th>제목</th>
				<th>장르</th>
				<th></th>
				<th>배우</th>
				<th>개봉일</th>
				<th>등급</th>
				<th>감독</th>
			</tr>
			<%
				
			%> --%>

				<tr>
					<td width=40% rowspan="6"><img src="<%=vo.getImage()%>"
						width=100%></td>
					<th class="success text-center" colspan="2"><%=vo.getTitle()%></th>
				</tr>
				<tr>
					<td width=15% class="text-right">작가</td>
					<td width=45%><%=vo.getAuthor()%></td>
				</tr>
				<tr>
					<td width=15% class="text-right">출판사</td>
					<td width=45%><%=vo.getPublisher()%></td>
				</tr>
				<tr>
					<td width=15% class="text-right">출판일</td>
					<td width=45%><%=vo.getPubdate()%></td>
				</tr>
				<tr>
					<td width=15% class="text-right">가격</td>
					<td width=45%><%=vo.getPrice()%></td>
				</tr>
				<tr>
					<td width=15% class="text-right">댓글점수</td>
					<td width=45%><%=vo.getCommentpoint()%></td>
				</tr>
				<tr>
					<th colspan="3" class="text-left"><%=vo.getDescription()%></th>
				</tr>
					<%
						if(id!=null)
						{
					%>
						<span id="like-holder"> <span class=" like-main"=""> <span
						class="like-main-emo"></span> <span class="like">Like</span>
						<!-- <span class="likecount">1.2k</span> -->
					<%
						}
					%>
				
			</table>
			<hr>

			<!-- 댓글 -->

			<div id="commentsystem">
				<div id="profpicture">
					<iframe
						src="https://www.facebook.com/plugins/feedback.php?api_key=113869198637480&href=codepen.io&numposts=5&sdk=joey&version=v2.10&width=500"
						frameborder="0"
						style="position: absolute; width: 500px; height: 118px; margin-left: -8px; margin-top: -67px;"
						allowtransparency="true"></iframe>
				</div>

					<textarea minlenght="10" autocomplete="off" autocorrect="off"
						autocapitalize="off" spellcheck="false" id="comment"
						name="comment" rows='1' placeholder='Write a comment...'></textarea>
					<input type="hidden" value="<%=vo.getNo()%>" id="bookNo">
					<input type="hidden" value="<%=total %>" id="commentTotal">
					<div id="logintopost">
						<div id="loginbtn">
							<span class="fa-stack" style="font-size: 16px;"> <i
								class="fa fa-circle-thin fa-stack-2x fa-inverse"></i> <i
								class="fa fa-facebook fa-stack-1x fa-inverse"></i>
							</span>
							<p id="logintext">Log in to post</p>
						</div>
					</div>
					<span id="count"></span>
					<%
						if(id==null)
						{
					%>
						<button id="send" disabled>
					<%
						}
						else
						{
					%>
						<button id="send">
					<%
						}
					%>
						<i class="fa fa-commenting-o" style="font-size: 18px;"></i> POST
					</button>


				<!-- 댓글 부분 -->
				<div id="printComment">

				</div>
					<!-- 댓글 부분 end -->
				
			</div>

			<!-- 댓글  end -->

		</div>
	</div>
</body>
</html>