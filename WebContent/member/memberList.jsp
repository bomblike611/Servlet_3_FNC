<%@page import="com.iu.member.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.iu.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    MemberDAO memberDAO=new MemberDAO();
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    int curPage=1;
    int perPage=10;
    
   	String kind=request.getParameter("kind");
    String search=request.getParameter("search");
    
    if(kind==null){
    	kind="id";
    }
    if(search==null){
    	search="";
    }
    try{
    curPage=Integer.parseInt(request.getParameter("curPage"));
    }catch(Exception e){
    	e.printStackTrace();
    }
    int startRow=(curPage-1)*perPage+1;
    int lastRow=curPage*perPage;
    ArrayList<MemberDTO> ar=memberDAO.selectList(startRow, lastRow,kind,search);

  	int totalCount=memberDAO.getTotalCount(kind,search);
  	int totalPage=0;
  	if(totalCount%perPage==0){
  		totalPage=totalCount/perPage;
  	}else{
  		totalPage=totalCount/perPage+1;
  	}
  	

  	int perBlock=5;
  	int totalBlock=0;
  	if(totalPage%perBlock==0){
  		totalBlock=totalPage/perBlock;
  	}else{
  		totalBlock=totalPage/perBlock+1;
  	}

  	int curBlock=0;
  	if(curPage%perBlock==0){
  		curBlock=curPage/perBlock;
  	}else{
  		curBlock=curPage/perBlock+1;
  	}
  	

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
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
article{
width: 1200px;
margin: 0 auto;
}
</style>
</head>
<body>

<%@ include file="../temp/header.jsp" %>

<section id="main">
<article>
 <table class="table table-condensed">
    <thead>
      <tr>
        <th>ID</th>
        <th>NAME</th>
        <th>EMAIL</th>
        <th>PHONE</th>
        <th>AGE</th>
      </tr>
    </thead>
    <tbody>
      <%for(int i=0;i<ar.size();i++){ %>
      <tr>
      <td><%=ar.get(i).getId() %></td>
      <td><%=ar.get(i).getName() %></td>
      <td><%=ar.get(i).getEmail() %></td>
      <td><%=ar.get(i).getPhone() %></td>
      <td><%=ar.get(i).getAge() %></td>
      </tr>
      <%} %>
    </tbody>
  </table>
  <div class="container">                 
  <ul class="pagination">
  <%if(curBlock >1){ %>
  <li><a href="./memberList.jsp?curPage=<%=startNum-1%>&kind=<%=kind%>&search=<%=search%>">[이전]</a></li>
  <%} %>
  <%for(int i=startNum;i<=lastNum;i++){%>
    <li><input type="button" class="btn page" value="<%=i%>"></li>
    <%} %>
     <%if(curBlock<totalBlock){ %>
    <li><a href="./memberList.jsp?curPage=<%=lastNum+1%>&kind=<%=kind%>&search=<%=search%>">[다음]</a></li>
    <%} %>
  </ul>
   <form action="memberList.jsp">
   <input type="hidden" name="curPage">
  <select name="kind">
  <option value="name">이름</option>
  <option value="id">아이디</option>
  <option value="email">이메일</option>
  </select>
  <input type="text" name="search">
  <input type="submit" class="btn btn-info" value="Search">
  </form>
</div>
</article>
</section>
<%@ include file="../temp/footer.jsp" %>
</body>
</html>