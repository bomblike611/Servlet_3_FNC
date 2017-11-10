<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    
    int fnum=Integer.parseInt(request.getParameter("num"));
    
    
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
<link href="../css/header.css" rel="stylesheet">
<link href="../css/footer.css" rel="stylesheet">
</head>
<script type="text/javascript">
window.onload=function(){
	var btn = document.getElementById("btn");
	btn.addEventListener("click", function(){
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
<body>
<%@include file="../temp/header.jsp" %>
<section id="main">
<div class="container">
  <h2>Write</h2>
  <form class="form-horizontal" action="./replyWriteProcess.jsp" name="frm">
  <input type="hidden" name="fnum" value="<%=fnum%>">
    <div class="form-group">
      <label class="control-label col-sm-2" for="title">Title</label>
      <div class="col-sm-10">
        <input type="text" class="form-control n" id="title" placeholder="Enter title" name="title">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="writer">Writer</label>
      <div class="col-sm-10">
        <input type="text" readonly="readonly" class="form-control n" id="writer" placeholder="Enter writer" name="writer" value="<%=memberDTO.getId()%>">
      </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-2" for="contents">Contents</label>
      <div class="col-sm-10">
        <input type="text" class="form-control n" id="contents" placeholder="Enter contents" name="contents">
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <input type="button" id="btn" name="btn" class="btn btn-success" value="write">
      </div>
    </div>
  </form>
</div>
</section>
<%@include file="../temp/footer.jsp" %>


</body>
</html>