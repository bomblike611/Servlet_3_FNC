<%@page import="com.iu.member.MemberDTO"%>
<%@page import="com.iu.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>

<% 
MemberDTO memberDTO=new MemberDTO();
memberDTO.setId(request.getParameter("id"));
memberDTO.setPw(request.getParameter("pw"));
memberDTO.setJob(request.getParameter("job"));

String save=request.getParameter("save");

if(save !=null){
Cookie id=new Cookie("id",memberDTO.getId());
Cookie pw=new Cookie("pw",memberDTO.getPw());
id.setMaxAge(60*10);
response.addCookie(id);
}else{
	Cookie id= new Cookie("id","");
	id.setMaxAge(0);
	response.addCookie(id);
}

MemberDAO memberDAO=new MemberDAO();
memberDTO=memberDAO.selectOne(memberDTO);

String path="./memberLoginForm.jsp";
if(memberDTO !=null){
	session.setAttribute("member",memberDTO);
path="../index.jsp";
}

response.sendRedirect(path);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>