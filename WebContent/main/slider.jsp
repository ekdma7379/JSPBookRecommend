<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.news.*,java.util.*"%>
<%
	NewsManager nm = new NewsManager();
	List<Item> list = nm.getNaverNewsData();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
     <h3>실시간 검색어 관련 뉴스</h3>
<!--      <table class="table">
       <tr>
        <td>
          Search:<input type=text name=data size=20>
          <input type=submit value=검색>
        </td>
       </tr>
     </table> -->
     <table class="table">
       <%
       	for(int i=0;i<2;i++)
       	{
       %>
         <tr class="danger table-hover">
          <td><%=list.get(i).getTitle() %></td>
         </tr>
         <tr>
           <td><%=list.get(i).getDescription() %></td>
         </tr>
       <%
       }
       %>
     </table>
    </div>
</body>
</html>