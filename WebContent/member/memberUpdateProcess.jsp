<%@page import="com.iu.member.MemberDAO"%>
<%@page import="com.iu.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    %>
    
    <%
    MemberDTO memberDTO=new MemberDTO();
    memberDTO.setId(((MemberDTO)session.getAttribute("member")).getId());
    memberDTO.setPw(request.getParameter("pw"));
    memberDTO.setAge(Integer.parseInt(request.getParameter("age")));
    memberDTO.setEmail(request.getParameter("email"));
    memberDTO.setPhone(request.getParameter("phone"));
    memberDTO.setName(request.getParameter("name"));
    
    MemberDAO memberDAO=new MemberDAO();
    int result=memberDAO.update(memberDTO);
    if(result>0){
    	memberDTO.setJob(((MemberDTO)session.getAttribute("member")).getJob());
    session.setAttribute("member", memberDTO);
    }
    
    response.sendRedirect("./memberView.jsp");
    
    
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