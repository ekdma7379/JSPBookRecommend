<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.*,com.sist.dao.*"%>
<%
	request.setCharacterEncoding("EUC-KR");	
%>
<!-- <script>
	 $(function() {
		//$("#dialog").dialog();
		$('#searchBtn').click(function(){
			//$("#dialog").dialog();
			// ���̵�� �н����尡 �Է� �Ǿ����� Ȯ���ؾ��Ѵ�.
			var name=$('#searchInput').val();
			if(name.trim()=="")
			{
				$('#searchInput').focus();
				alert("å �̸� X");
				return;
			}
				var type=$('#type').val();
				var bookFindData={"name":name,"type":type};
				// ����
				$.ajax({
					type:'POST',
					url:'login_ok.jsp',
					data:bookFindData,
					success:function(response)
					{
						$('#print').html(response);
					}
				});
		});
	}); 
</script> -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="form-group">
			<form>
				<input type="hidden" name="jsp" value="bookfind.jsp"> <label
					for="exampleFormControlSelect1">Ÿ��</label> <select
					class="form-control" id="type" name="type">
					<option value="title">�����̸�</option>
					<option value="author">����</option>
				</select>
		</div>
		<div class="search-box" id="SBox">
			<input name="bookName" id="searchInput" placeholder="���� �˻�"
				type="text"> <input type="button" id="searchBtn" class="btn btn-sm btn-primary" value="�˻�">
		</div>
		</form>
		<div id="print">
		</div>
		<br> <br>
	</div>

</body>
</html>