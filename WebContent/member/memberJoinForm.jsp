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
<link href="../css/header.css" rel="stylesheet">
<link href="../css/footer.css" rel="stylesheet">
<style type="text/css">
article{
width:70%;
margin: 0 auto;
}

</style>
</head>
<body>
<%@ include file="../temp/header.jsp" %>
<section id="main">
<article>
<div>
<h1>멤버 등록</h1>
<form action="./memberJoinProcess.jsp">
<p>아이디:<input type="text" name="id"></p>
<p>패스워드:<input type="password" name="pw"></p>
<p>이름:<input type="text" name="name"></p>
<p>이메일:<input type="email" name="email"></p>
<p>번호:<input type="text" name="phone"></p>
<p>나이:<input type="number" name="age"></p>
<p>직업:S<input type="radio" name="job" value="S">T<input type="radio" name="job" value="T"></p>
<p><input type="submit" value="회원가입"></p>
</form>
</div>


</article>
</section>
<%@ include file="../temp/footer.jsp" %>
</body>
</html>