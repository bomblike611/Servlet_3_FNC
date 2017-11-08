<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    
    Cookie [] ar=request.getCookies();
    String cId="";
    for(int i=0;i<ar.length;i++){
    	if(ar[i].getName().equals("id")){
    		cId=ar[i].getValue();
    		break;
    	}
    }
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<link href="../css/header.css" rel="stylesheet">
<link href="../css/footer.css" rel="stylesheet">
<script type="text/javascript">
window.onload=function(){
	var btn=document.getElementById("btn2");
	btn.addEventListener("click", function() {
		var id=document.frm.id.value;
		var pw=document.frm.pw.value;
		if(id==""&&pw==""){
			alert("모두 입력해주세요");
		}else{
			document.frm.submit();
		}
	});
}
</script>
</head>
<body>
<section id="main">
<%@ include file="../temp/header.jsp" %>
<h1>Login</h1>
<form name="frm" class="form-horizontal"
				action="memberLoginProcess.jsp" method="post">
				<input type="hidden" name="idCheck" id="idCheck" value="0">
				<div class="form-group">
					<label class="control-label col-sm-2" for="id">ID:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="id" name="id"
							placeholder="Enter ID" value="<%=cId%>">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="Job">ID저장하기:</label>
					<div class="col-sm-10">
						<input type="checkbox" value="save"
							class="checkbox-inline" name="save">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="pw">PW:</label>
					<div class="col-sm-10">
						<input type="password" class="form-control n" id="pw" name="pw"
							placeholder="Enter Pw">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="button" id="btn2" class="btn btn-default"
							value="Login">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="Job">Job:</label>
					<div class="col-sm-10">
						STUDENT<input type="radio" value="S" checked="checked"
							class="radio-inline" name="job"> TEACHER<input
							type="radio" value="T" class="radio-inline" name="job">
					</div>
				</div>
			</form>
<%@ include file="../temp/footer.jsp" %>
</section>

</body>
</html>