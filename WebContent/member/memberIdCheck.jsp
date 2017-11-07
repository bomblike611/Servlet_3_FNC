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
</head>
<body>
	<h1>ID Check</h1>
	<h3><%=s %></h3>
</body>
</html>