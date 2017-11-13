<%@page import="com.choa.files.FileDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.choa.files.FileDAO"%>
<%@page import="com.iu.notice.NoticeDTO"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	
	int num=Integer.parseInt(request.getParameter("num"));
	NoticeDAO noticeDAO=new NoticeDAO();
	int result=noticeDAO.hitUpdate(num);
	NoticeDTO noticeDTO=noticeDAO.selectOne(num);
	FileDAO fileDAO=new FileDAO();
	ArrayList<FileDTO> ar=fileDAO.selectList(num);
	
	%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style type="text/css">
#main{
	background-color: #FAF6DC;
}

#write{
	width: 70%;
	margin: 0 auto;
}
table{
	border-spacing: 0px;
	border-collapse: collapse;
	margin: 0 auto;
	background-color: white;
	width: 70%;
	height: 70%;
}
* {
	margin: 0;
	padding: 0;
}
td{
	border-bottom: 6px #FAF6DC solid;
	width: 95px;
	height: 50px;
	text-align: center;
}

th{
border-bottom: 6px #FAF6DC solid;
	width: 95px;
	height: 50px;
	text-align: center;
}

.contents{
 width: 550px;
}

#first{
	background-color: black;
	color: white;
	border-bottom: 0px solid;
}
</style>
<link href="../css/header.css" rel="stylesheet">
<link href="../css/footer.css" rel="stylesheet">
</head>
<body>
	<%@ include file="../temp/header.jsp" %>
	<section id="main">
		<article id="write">
			<table>
			<thead>
				<tr id="first">
					<th class="contents">SUBJECT</th>
					<th>NAME</th>
					<th>DATE</th>
					<th>HIT</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td class="contents"><%=noticeDTO.getTitle() %></td>
					<td><%=noticeDTO.getWriter() %></td>
					<td><%=noticeDTO.getReg_date() %></td>
					<td><%=noticeDTO.getHit() %></td>
				</tr>
				<tr>
				<td colspan="4" class="contents"><%=noticeDTO.getContents() %></td>
				</tr>
				</tbody>
				<tr>
				<td colspan="4">
				<a href="./noticeList.jsp" class="btn btn-info">List</a>
				<%
				if(memberDTO!=null&&memberDTO.getId().equals(noticeDTO.getWriter())){ %>
				<a href="./noticeUpdateForm.jsp?num=<%=noticeDTO.getNum() %>" class="btn btn-info">수정</a>
				<a href="./noticeDelete.jsp?num=<%=noticeDTO.getNum() %>" class="btn btn-info">삭제</a>
				<%} %>
				</td>
				</tr>
			<tr>
			<%for(int i=0;i<ar.size();i++){ %>
			<td colspan="4">
			<a href="../upload/<%=ar.get(i).getFname()%>"><%=ar.get(i).getOname() %>^___^</a>
			</td>
			<%} %>
			</tr>
			</table>
		</article>
	</section>
	<%@ include file="../temp/footer.jsp" %>
</body>
</html>