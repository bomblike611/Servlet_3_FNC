
<%@page import="com.iu.member.MemberDTO"%>
<%@page import="com.iu.qna.QnaDTO"%>
<%@page import="com.iu.qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

QnaDTO qnaDTO=new QnaDTO();
qnaDTO.setContents(request.getParameter("contents"));
qnaDTO.setTitle(request.getParameter("title"));
MemberDTO memberDTO=(MemberDTO)session.getAttribute("member");
qnaDTO.setWriter(memberDTO.getId());

QnaDAO qnaDAO=new QnaDAO();
int result=qnaDAO.insert(qnaDTO);
String s="Write Fail";
if(result>0){
	s="Write Success";
}
request.setAttribute("message", s);
request.setAttribute("path", request.getContextPath()+"/qna/qnaList.jsp");
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