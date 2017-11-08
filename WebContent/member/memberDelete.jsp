<%@page import="com.iu.member.MemberDTO"%>
<%@page import="com.iu.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%MemberDAO memberDAO=new MemberDAO();
  int result=memberDAO.delete(MemberDTO.getId());
  String s="삭제에 실패하였습니다.";
  if(result>0){
	  s="삭제에 성공하였습니다.";
  }
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