<!-- ID       NOT NULL VARCHAR2(20)  
    PWD      NOT NULL VARCHAR2(10)  
    NAME     NOT NULL VARCHAR2(34)  
    SEX               CHAR(4)       
    BIRTHDAY NOT NULL VARCHAR2(10)  
    POST     NOT NULL CHAR(7)       
    ADDR1    NOT NULL VARCHAR2(200) 
    ADDR2             VARCHAR2(100) 
    TEL      NOT NULL CHAR(13)      
    CONTENT           CLOB          
    REGDATE           DATE  -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"> -->
<style type="text/css">
.row{
   /*margin: 0px auto;  가운데 정렬 */
}
h3{
   text-align: center;
}
</style>
<!-- import -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script><!-- 라이브러리 -->
<script type="text/javascript">
/*
 * widow.onload=function()  
    {
   
    }
    
    태그 : $('태그명')
       ID: $('#ID명')
       class : $('.class명')
 */
$(function(){
   $('#postBtn').click(function(){
	  	window.open("postfind.jsp","post","width=480,height=350,scrollbars=yes") 
   });
   $('#checkBtn').click(function(){
	  	window.open("idcheck.jsp","post","width=480,height=350") 
  });
});
</script>
</head>
<body>
   <div class="container">
      <h3>회원가입</h3>
      <div class="row">
      <form name="joinFrm" method="post" action="join_ok.jsp">
         <table class="table table-hover">
            <tr>
               <th class="text-right danger" width=20%>ID</th>
               <td class="text-left" width=80%>
                  <input type=text name=id size=15 readonly required><!-- readonly읽기만 가능 -->
                  <input type=button value="중복체크" class="btn btn-xs btn-primary" id="checkBtn">
               </td>
            </tr>
            <tr>
               <th class="text-right danger" width=20%>비밀번호</th>
               <td class="text-left" width=80%>
                  <input type=password name=pwd size=15 required>
                  <input type=password name=pwd1 size=15 placeholder="재입력"><!-- placeholder은 5번에서만 나옵니당 -->
               </td>
            </tr>
            <tr>
               <th class="text-right danger" width=20%>이름</th>
               <td class="text-left" width=80%>
                  <input type=text name=name size=15 required>
               </td>
            </tr>
            <tr>
               <th class="text-right danger" width=20%>성별</th>
               <td class="text-left" width=80%>
                  <input type="radio" name=sex value="남자" checked>남자
                  <input type="radio" name=sex value="여자">여자
               </td>
            </tr>
            <tr>
               <th class="text-right danger" width=20%>생년월일</th>
               <td class="text-left" width=80%>
                  <input type=date name=birthday size=25 required><!-- type= date -->
               </td>
            </tr>
            <tr>
               <th class="text-right danger" width=20%>우편번호</th>
               <td class="text-left" width=80%>
                  <input type=text name=post1 size=5 readonly>-
                  <input type=text name=post2 size=5 readonly>
                  <input type=button value="우편번호검색" class="btn btn-xs btn-primary" id="postBtn">
               </td>
            </tr>
            <tr>
               <th class="text-right danger" width=20%>주소</th>
               <td class="text-left" width=80%>
                  <input type=text name=addr1 size=45 readonly>
               </td>
            </tr>
            <tr>
               <th class="text-right danger" width=20%>상세주소</th>
               <td class="text-left" width=80%>
                  <input type=text name=addr2 size=45 required>
               </td>
            </tr>
            <tr>
               <th class="text-right danger" width=20%>전화번호</th>
               <td class="text-left" width=80%>
                  <select name=tel1>
                     <option>010</option>
                     <option>011</option>
                     <option>017</option>
                  </select>
                  <input type=text name=tel2 size=10>
                  <input type=text name=tel3 size=10>
               </td>
            </tr>
            <tr>
               <th class="text-right danger" width=20%>소개</th>
               <td class="text-left" width=80%>
                  <textarea rows="8" cols="60" name=content></textarea>
               </td>
            </tr>
            <tr>
               <td colspan="2" class="text-center">
                  <input type="submit" value="회원가입" class="btn btn-sm btn-success">
                  <input type="button" value="취소" class="btn btn-sm btn-warning">
               </td>
            </tr>
         </table>
         </form>
      </div>
   </div>
</body>
</html>