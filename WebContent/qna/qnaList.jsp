<%@page import="com.iu.qna.QnaDAO"%>
<%@page import="com.iu.qna.QnaDTO"%>
<%@page import="java.util.ArrayList"%>
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



//데이터정리
int curPage=1;
int perPage=10;
int perblock=5;

try{
	curPage=Integer.parseInt(request.getParameter("curPage"));
}catch(Exception e){
	
}


//디비에서 조회
int startRow=(curPage-1)*perPage+1;
int lastRow=curPage*perPage;

String kind=request.getParameter("kind");
String search=request.getParameter("search");


QnaDAO qnaDAO=new QnaDAO();
ArrayList<QnaDTO> ar=qnaDAO.selectList(kind, search, startRow, lastRow);


//1.전체 글의 갯수 구하기
int totalCount=qnaDAO.getTotalCount(kind, search);
//2.전체페이지수 구하기
int totalPage=0;
if(totalCount%perPage==0){
	totalPage=totalCount/perPage;
}else{
	totalPage=totalCount/perPage+1;
}
//3.전체 블럭 수 구하기
int totalBlock=0;
if(totalPage%perblock==0){
	totalBlock=totalPage/perblock;
}else{
	totalBlock=totalPage/perblock+1;
}
//4.현재 블럭 구하기
int curBlock=0;
if(curPage%perblock==0){
	curBlock=curPage/perblock;
}else{
	curBlock=curPage/perblock+1;
}

//5.StartNum,lastNum 구하기
int startNum=(curBlock-1)*perblock+1;
int lastNum=curBlock*perblock;

if(curBlock==totalBlock){
	lastNum=totalPage;
}


%>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


</head>
<body>
<section id="main">
<article>
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
      <%for(int i=0;i<ar.size();i++){ %>
        <td><%=ar.get(i).getNum()%></td>
        <td><%=ar.get(i).getTitle()%></td>
        <td><%=ar.get(i).getContents()%></td>
        <td><%=ar.get(i).getWriter()%></td>
        <td><%=ar.get(i).getHit()%></td>
        <td><%=ar.get(i).getReg_date()%></td>
        <%} %>
      </tr>
    </tbody>
  </table>
</div>
</article>
</section>
</body>
</html>