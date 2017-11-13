
<%@page import="java.util.Enumeration"%>
<%@page import="com.choa.files.FileDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.choa.files.FileDTO"%>
<%@page import="com.iu.member.MemberDTO"%>
<%@page import="com.iu.qna.QnaDTO"%>
<%@page import="com.iu.qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

int maxSize=1024*1024*10;
String save=session.getServletContext().getRealPath("upload");
MultipartRequest multi=new MultipartRequest(request,save,maxSize,"UTF-8",new DefaultFileRenamePolicy());

QnaDAO qnaDAO=new QnaDAO();
int num=qnaDAO.getNum();


QnaDTO qnaDTO=new QnaDTO();
qnaDTO.setContents(multi.getParameter("contents"));
qnaDTO.setTitle(multi.getParameter("title"));
MemberDTO memberDTO=(MemberDTO)session.getAttribute("member");
qnaDTO.setNum(num);
qnaDTO.setWriter(memberDTO.getId());

FileDAO fileDAO=new FileDAO();
int result=qnaDAO.insert(qnaDTO);

//file의 파라미터이름을 정확히 알 수 없을때
Enumeration e =multi.getFileNames();
while(e.hasMoreElements()){
	String obj=(String)e.nextElement();
	FileDTO fileDTO=new FileDTO();
	fileDTO.setOname(multi.getOriginalFileName(obj));
	fileDTO.setFname(multi.getFilesystemName(obj));
	fileDTO.setNum(num);
	fileDAO.insert(fileDTO);
}

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