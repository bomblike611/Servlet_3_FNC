<%@page import="com.iu.notice.NoticeDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="com.iu.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

NoticeDTO noticeDTO=new NoticeDTO();
noticeDTO.setNum(Integer.parseInt(request.getParameter("num")));
noticeDTO.setTitle(request.getParameter("title"));
noticeDTO.setContents(request.getParameter("contents"));

NoticeDAO noticeDAO=new NoticeDAO();
int result=noticeDAO.update(noticeDTO);
String s="수정실패";

if(result>0){
	s="수정완료";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
window.onload=function(){
alert("<%=s%>");
location.href="./noticeList.jsp";	
}
</script>
</body>
</html>