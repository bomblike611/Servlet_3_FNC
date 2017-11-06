<%@page import="com.iu.notice.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    
    
    
    int curPage=1;
	int perPage=10;
	
	String kind=request.getParameter("kind");
	String search=request.getParameter("search");
	
	if(kind==null){
		kind="title";
	}
	if(search==null){
		search="";
	}
	
	
	try{
	curPage=Integer.parseInt(request.getParameter("curPage"));
	}catch(Exception e){
		e.printStackTrace();
	}
	
	
	int lastRow=curPage*perPage;
	int startRow=(curPage-1)*perPage+1;
	
	
	NoticeDAO noticeDAO=new NoticeDAO();
	ArrayList<NoticeDTO> ar=noticeDAO.selectList(startRow,lastRow,kind,search);
	//////////////////////////////////////////////////////////////////
	//pageing 처리
	int totalCount=noticeDAO.getTotalCount();
	int totalPage=0;
	if(totalCount%perPage==0){
		totalPage=totalCount/perPage;
	}else{
		totalPage=totalCount/perPage+1;
	}
	
	//totalBlock
	int perBlock=5;
	int totalBlock=0;
	if(totalPage%perBlock==0){
		totalBlock=totalPage/perBlock;
	}else{
		totalBlock=totalPage/perBlock+1;
	}
	//curPage를 이용해서 curBlock 구하기
	int curBlock=0;
	if(curPage%perBlock==0){
		curBlock=curPage/perBlock;
	}else{
		curBlock=curPage/perBlock+1;
	}
	
	//curBlock으로 startNum과 lastNum 구하기
	int lastNum=curBlock*perBlock;
	int startNum=(curBlock-1)*perBlock+1;
	
	if(curBlock==totalBlock){
		lastNum=totalPage;
	}
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/header.css" rel="stylesheet">
<link href="../css/footer.css" rel="stylesheet">
<link href="../css/list.css" rel="stylesheet">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}
</style>
</head>

<body>
<%@ include file="../temp/header.jsp" %>
<section id="main">
	<h1>NOTICE <%=totalCount %></h1><br>
	<article id="list">
	<table class="table table-hover">
	<tr id="first">
	<td>NO</td>
	<td class="contents">SUBJECT</td>
	<td>NAME</td>
	<td>DATE</td>
	<td>HIT</td>
	</tr>
	<%
	
	for(int i=0;i<ar.size();i++){
	%>
	<tr>
	<td><%=ar.get(i).getNum() %></td>
	<td class="contents"><a href="./noticeView.jsp?num=<%=ar.get(i).getNum()%>"><%=ar.get(i).getTitle() %></a></td>
	<td><%=ar.get(i).getWriter() %></td>
	<td><%=ar.get(i).getReg_date() %></td>
	<td><%=ar.get(i).getHit() %></td>
	</tr>
	<%} %>
	</table>
	<!-- pageing -->
	<div class="container">             
  <ul class="pagination">
  <%if(curBlock >1){ %>
  <li><a href="./noticeList.jsp?curPage=<%=startNum-1%>&kind=<%=kind%>&search=<%=search%>">[이전]</a></li>
  <%} %>
    <%
    for(int i=startNum;i<=lastNum;i++){
    %>
    
    <li><a href="./noticeList.jsp?curPage=<%=i%>&kind=<%=kind%>&search=<%=search%>"><%=i %></a></li>

    <%} %>
    <%if(curBlock<totalBlock){ %>
    <li><a href="./noticeList.jsp?curPage=<%=lastNum+1%>&kind=<%=kind%>&search=<%=search%>">[다음]</a></li>
    <%} %>
  </ul>
</div>
<!-- search 제목,작성자,내용 -->
<form action="./noticeList.jsp">
<select name="kind">
<option value="title">제목</option>
<option value="writer">작성자</option>
<option value="contents">내용</option>
</select>
<input type="text" name="search"><input type="submit" value="검색">
</form>

	<a href="./noticeWriteForm.jsp" class="btn btn-info" id="write">글쓰기</a>
</article>
</section>
<%@ include file="../temp/footer.jsp" %>
</body>
</html>