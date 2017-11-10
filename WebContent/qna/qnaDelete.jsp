<%@page import="com.iu.qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int num=Integer.parseInt(request.getParameter("num"));

QnaDAO qnaDAO=new QnaDAO();
int result=qnaDAO.delete(num);

String s="Delete Fail";
if(result>0){
	s="Delete Success";
}
request.setAttribute("message", s);
request.setAttribute("path", request.getContextPath()+"/qna/qnaList.jsp");

RequestDispatcher view=request.getRequestDispatcher("../common/result.jsp");
view.forward(request, response);
%>
</body>
</html>