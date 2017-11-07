<%@page import="com.iu.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    
    String id=request.getParameter("id");
    MemberDAO memberDAO=new MemberDAO();
    boolean check=memberDAO.idCheck(id);
    String s=id+"는 사용가능합니다.";
    if(!check){
    	s=id+"는 중복된 아이디입니다.";
    }
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	var btn=document.getElementById("btn");
	btn.addEventListener("click", function() {
		window.opener.document.frm.id.value="<%=id%>";
		window.close();
	});
}

</script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<h1>ID Check</h1>
	<form action="memberIdCheck.jsp" name="frm">
	<p>ID : <input type="text" name="id">
	<button class="btn btn-danger">중복체크</button></p>
	</form>
	<h3><%=s %></h3>
	<%if(check){%>
	<button class="btn btn-default" id="btn">확인</button>
	<%}%>
</body>
</html>