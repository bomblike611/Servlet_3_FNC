<%@page import="com.iu.qna.QnaDTO"%>
<%@page import="com.iu.qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    //서브쿼리 대신 QnaDTO parent=qnaDAO.selectOne(qnaDTO.getNum());로 셋팅해줘도댐
    QnaDTO qnaDTO=new QnaDTO();
    qnaDTO.setNum(Integer.parseInt(request.getParameter("fnum")));
    qnaDTO.setTitle(request.getParameter("title"));
    qnaDTO.setContents(request.getParameter("contents"));
    qnaDTO.setWriter(request.getParameter("writer"));
    QnaDAO qnaDAO=new QnaDAO();
    int result=qnaDAO.replyInsert(qnaDTO);
    String s="실패";
    if(result>0){
    	s="성공";
    }
    
    request.setAttribute("message", s);
    request.setAttribute("path", "./qnaList.jsp");
    
    RequestDispatcher view=request.getRequestDispatcher("../common/result.jsp");
    view.forward(request, response);
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>