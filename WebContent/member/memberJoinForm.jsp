<%@page import="com.iu.member.MemberDTO"%>
<%@page import="com.iu.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="../css/header.css" rel="stylesheet">
<link href="../css/footer.css" rel="stylesheet">
<style type="text/css">
article{
width:70%;
margin: 0 auto;
}

</style>
<script type="text/javascript">
window.onload=function(){
	var btnd=document.getElementById("btnd");
	btnd.addEventListener("click", function() {
		var id=document.frm.id.value
		window.open("memberIdCheck.jsp?id="+id, "", "top=200, left=300, width=400, height=300");
	});
}
</script>
</head>
<body>
<%@ include file="../temp/header.jsp" %>
<section id="main">
<article>
<div>
<h1>멤버 등록</h1>
</div>
 <form action="./memberJoinProcess.jsp">
    <div class="form-group">
      <label for="id">아이디:</label>
      <input type="text" class="form-control" name="id" id="id">
      <input type="button" value="중복확인" class="btn btn-danger" id="btnd">
    </div>
    <div class="form-group">
      <label for="password">패스워드:</label>
      <input type="password" class="form-control" name="pw">
    </div>
       <div class="form-group">
      <label for="name">이름:</label>
      <input type="text" class="form-control" name="name">
    </div>
       <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" name="email">
    </div>
       <div class="form-group">
      <label for="phone">번호:</label>
      <input type="text" class="form-control" name="phone">
    </div>
       <div class="form-group">
      <label for="age">나이:</label>
      <input type="number" class="form-control" "age">
    </div>
       <div class="form-group">
      <label for="job">직업:</label><br>
      Student<input type="radio" name="job" value="S" checked="checked" class="form-control">
      Teacher<input type="radio" name="job" value="T" class="form-control">
    </div>
    <button type="submit" class="btn btn-default">Submit</button>
  </form>

</article>
</section>
<%@ include file="../temp/footer.jsp" %>
</body>
</html>