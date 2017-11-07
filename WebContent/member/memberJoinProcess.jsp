<%@page import="com.iu.member.MemberDTO"%>
<%@page import="com.iu.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    MemberDAO memberDAO=new MemberDAO();
    int age=0;
    try{
    age=Integer.parseInt(request.getParameter("age"));
    }catch(Exception e){
    	
    }
    MemberDTO memberDTO=new MemberDTO();
    memberDTO.setId(request.getParameter("id"));
    memberDTO.setPw(request.getParameter("pw"));
    memberDTO.setName(request.getParameter("name"));
    memberDTO.setEmail(request.getParameter("email"));
    memberDTO.setPhone(request.getParameter("phone"));
    memberDTO.setAge(age);
    memberDTO.setJob(request.getParameter("job"));
    
    int result=memberDAO.insert(memberDTO);
    
    String path="../index.jsp";
    String s="회원가입 실패";
    if(result>0){
    	s="회원가입 완료";
    }
    
    request.setAttribute("message", s);
    request.setAttribute("path",path);
    
    RequestDispatcher view=request.getRequestDispatcher("../common/result.jsp");
    view.forward(request, response);
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