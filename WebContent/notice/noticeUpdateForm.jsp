<%@page import="com.iu.notice.NoticeDTO"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    
    int num=Integer.parseInt(request.getParameter("num"));
    
    NoticeDAO noticeDAO=new NoticeDAO();
    NoticeDTO noticeDTO=noticeDAO.selectOne(num);
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/header.css" rel="stylesheet">
<link href="../css/footer.css" rel="stylesheet">
<link href="../css/write.css" rel="stylesheet">
<script type="text/javascript">
window.onload=function(){
	var btn = document.getElementById("btn");
	btn.addEventListener("click", function(){
		//Form 특화
		//document.폼의name.iuput의name
			document.frm.submit();
	});
}</script>
</head>
<body>
<%@ include file="../temp/header.jsp" %>
	<section id="main">
	<h1>글쓰기</h1>
		<article id="write">
		<form action="noticeUpdateProcess.jsp" name="frm">
			<table>
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" class="n" value="<%=noticeDTO.getTitle() %>"></td>
				</tr>
				<tr>
				<td>작성자</td>
					<td><input type="text" name="writer" readonly="readonly" class="n" value="<%=noticeDTO.getWriter()%>"></td>
				</tr>
				<tr>
				<td>내용</td>
					<td><textarea name="contents" id="contents" class="n"><%=noticeDTO.getContents() %></textarea></td>
				</tr>
				<tr>
				<td colspan="2"><input type="button" id="btn" value="글쓰기">
				<input type="hidden" name="num" value="<%=noticeDTO.getNum()%>">
				</td>
				</tr>
			</table>
			</form>
		</article>
	</section>
	<%@ include file="../temp/footer.jsp" %>
</body>
</html>