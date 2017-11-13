<%@page import="com.choa.files.FileDAO"%>
<%@page import="com.choa.files.FileDTO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.iu.notice.NoticeDTO"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	int maxSize = 1024 * 1024 * 10;//최대 10MB
	String save = session.getServletContext().getRealPath("upload");
	File f = new File(save);
	if (!f.exists()) {
		f.mkdir();
	}
	MultipartRequest multi = new MultipartRequest(request, save, maxSize, "UTF-8",new DefaultFileRenamePolicy());//객체생성과 동시에 파일저장이 완료
	NoticeDTO noticeDTO = new NoticeDTO();
	noticeDTO.setWriter(multi.getParameter("writer"));
	noticeDTO.setTitle(multi.getParameter("title"));
	noticeDTO.setContents(multi.getParameter("contents"));
	
	
	NoticeDAO noticeDAO = new NoticeDAO();
	int result = noticeDAO.getNum();
	noticeDTO.setNum(result);
	FileDTO fileDTO = new FileDTO();
	String oname = multi.getOriginalFileName("f1");
	String fname = multi.getFilesystemName("f1");//name에 파라미터 name을 넣음
	fileDTO.setOname(oname);
	fileDTO.setFname(fname);
	fileDTO.setNum(result);
	result= noticeDAO.insert(noticeDTO);
	FileDAO fileDAO=new FileDAO();
	result=fileDAO.insert(fileDTO);
%>

<% 
	
	String s = "글쓰기 실패";
	if (result > 0) {
		s = "글쓰기 성공";
	}
	String path = "../index.jsp";

	request.setAttribute("message", s);
	request.setAttribute("path", path);

	//1.forward
	RequestDispatcher view = request.getRequestDispatcher("../common/result.jsp");
	view.forward(request, response);

	//2.redirect
	/* response.sendRedirect("../common/result.jsp"); */
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		window.onload = function() {
			alert("<%=s%>");
			location.href = "./noticeList.jsp";
		}
	</script>
</body>
</html>