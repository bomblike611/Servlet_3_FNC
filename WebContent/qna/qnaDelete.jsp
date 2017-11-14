<%@page import="java.io.File"%>
<%@page import="com.choa.files.FileDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.choa.files.FileDAO"%>
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
String save=session.getServletContext().getRealPath("upload");
FileDAO fileDAO=new FileDAO();
ArrayList<FileDTO> ar=fileDAO.selectList(num);
for(FileDTO f: ar){
	File file=new File(save,f.getFname());
	file.delete();
}
fileDAO.delete(num);
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