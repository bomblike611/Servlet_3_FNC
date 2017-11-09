<%@page import="com.iu.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
</head>
<body>
<%@ include file="../temp/header.jsp"%>

<section id="main">
<div class="container">
  <h2>MY PAGE</h2>
  <p><%=memberDTO.getId() %>'s my page</p>            
  <table class="table">
    <thead>
      <tr>
        <th>NAME</th>
        <th>EMAIL</th>
        <th>AGE</th>
        <th>JOB</th>
        <th>PHONE</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><%=memberDTO.getName() %></td>
        <td><%=memberDTO.getEmail() %></td>
        <td><%=memberDTO.getAge() %></td>
        <td><%=memberDTO.getJob() %></td>
        <td><%=memberDTO.getPhone() %></td>
      </tr>
    
    </tbody>
  </table>
  <div>
  <a class="btn btn-default" href="./memberUpdateForm.jsp">Update</a>
  <a class="btn btn-danger" id="del" href="./memberDelete.jsp">Delete</a>
  </div>



</div>
</section>
<%@ include file="../temp/footer.jsp"%>
</body>
</html>