<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/header.css" rel="stylesheet">
<link href="../css/footer.css" rel="stylesheet">
<link href="../css/write.css" rel="stylesheet">
<script src="https://cdn.ckeditor.com/4.7.3/full/ckeditor.js"></script>	
<script type="text/javascript">
window.onload=function(){
	CKEDITOR.replace('contents');
	var btn = document.getElementById("btn");
	btn.addEventListener("click", function(){
		//Form 특화
		//document.폼의name.iuput의name
		var n = document.getElementsByClassName("n");
		var check=true;
		for(var i=0;i<n.length;i++){
			if(n[i].value==""){
				alert("입력되지 않은 항목이 있습니다.");
				check=false;
				break;
			}
		}
		if(check){
			document.frm.submit();
		}
	});
}</script>
</head>
<body>
<%@ include file="../temp/header.jsp" %>
	<section id="main">
	<h1>글쓰기</h1>
		<article id="write">
		<form action="noticeWriteProcess.jsp" name="frm" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" class="n"></td>
				</tr>
				<tr>
				<td>작성자 : <%=memberDTO.getId() %></td>
					<td><input type="text" readonly="readonly" name="writer" value="<%=memberDTO.getId()%>" class="n"></td>
				</tr>
				<tr>
				<td>내용</td>
					<td><textarea name="contents" id="contents" class="n"></textarea></td>
				</tr>
				<tr>
				<td>내용</td>
					<td><input type="file" name="f1"></td>
				</tr>
				<tr>
				<td colspan="2"><input type="button" id="btn" value="글쓰기"></td>
				</tr>
			</table>
			</form>
		</article>
	</section>
	<%@ include file="../temp/footer.jsp" %>
</body>
</html>