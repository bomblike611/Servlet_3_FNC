<%@page import="com.choa.files.FileDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.choa.files.FileDAO"%>
<%@page import="com.iu.qna.QnaDTO"%>
<%@page import="com.iu.qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<% 
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

int num=Integer.parseInt(request.getParameter("num"));

QnaDTO qnaDTO=new QnaDTO();
QnaDAO qnaDAO=new QnaDAO();
qnaDTO=qnaDAO.selectOne(num);

FileDAO fileDAO=new FileDAO();
ArrayList<FileDTO> ar=fileDAO.selectList(num);

%>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="../css/header.css" rel="stylesheet">
<link href="../css/footer.css" rel="stylesheet">
</head>
<body>
<%@include file="../temp/header.jsp" %>
<section id="main">
	<div class="container">
				<h2>QnA</h2>
				<p>질문하면 답해드림ㅇㅇ</p>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>NUMBER</th>
							<th>TITLE</th>
							<th>CONTENTS</th>
							<th>WRITER</th>
							<th>HIT</th>
							<th>DATE</th>
						</tr>
					</thead>
					<tbody>
						
						<tr>
							<td><%=qnaDTO.getNum() %></td>
							<td><%=qnaDTO.getTitle() %></td>
							<td><%=qnaDTO.getContents() %></td>
							<td><%=qnaDTO.getWriter() %></td>
							<td><%=qnaDTO.getHit() %></td>
							<td><%=qnaDTO.getReg_date() %></td>
						</tr>
						<%for(int i=0;i<ar.size();i++){ %>
						<tr>
						<td>
						<a href="../upload/<%=ar.get(i).getFname()%>"><%=ar.get(i).getOname() %></a>
						</td>
						</tr>
						<%} %>
					</tbody>
				</table>
				<%if(memberDTO!=null&&memberDTO.getId().equals(qnaDTO.getWriter())){ %>
				<a href="./qnaDelete.jsp?num=<%=qnaDTO.getNum() %>" class="btn btn-danger">Delete</a>
				<a href="./qnaUpdateForm.jsp?num=<%=qnaDTO.getNum() %>" class="btn btn-default">Update</a>
				<%} %>
				<%if(memberDTO!=null){ %>
				<a href="./replyWriteForm.jsp?num=<%=qnaDTO.getNum() %>" class="btn btn-default">Answer</a>
				<%} %>
				<a href="./qnaList.jsp" class="btn btn-default">List</a>
				
			</div>
</section>
<%@include file="../temp/footer.jsp" %>
</body>
</html>