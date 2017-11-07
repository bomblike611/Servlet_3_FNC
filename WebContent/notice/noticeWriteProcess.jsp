<%@page import="com.iu.notice.NoticeDTO"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    
   	NoticeDTO noticeDTO=new NoticeDTO();
   	noticeDTO.setTitle(request.getParameter("title"));
   	noticeDTO.setContents(request.getParameter("contents"));
   	noticeDTO.setWriter(request.getParameter("writer"));
    %>
    
    <%
    NoticeDAO noticeDAO=new NoticeDAO();
    int result=noticeDAO.insert(noticeDTO);
    String s="글쓰기 실패";
    if(result>0){
    	s="글쓰기 성공";
    }
    
    request.setAttribute("message", s);
    
     //1.forward
  /*   RequestDispatcher view=request.getRequestDispatcher("../common/result.jsp");
    view.forward(request, response); */
    
    //2.redirect
    response.sendRedirect("../common/result.jsp");
    
    
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