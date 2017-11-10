<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

int num=Integer.parseInt(request.getParameter("num"));

NoticeDAO noticeDAO=new NoticeDAO();
int result=noticeDAO.delete(num);
String s="삭제 실패";


if(result>0){
	s="삭제 완료";
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