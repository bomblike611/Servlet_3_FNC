<%@page import="com.iu.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Header 시작 -->
<header>
	<div id="hdtop">
		<div id=logo>
			<a href="<%=request.getContextPath()%>/index.jsp"><img
				src="/HTML_3_FNC/images/common/logo.png"></a>
		</div>
		<nav>
			<ul>
				<li><a
					href="<%=request.getContextPath()%>/notice/noticeList.jsp">COMPANY</a></li>
				<li><a href="<%=request.getContextPath()%>/qna/qnaList.jsp">ARTISTS</a></li>
				<li><a href="#">PR CENTER</a></li>
				<li><a href="#">AUDITION</a></li>
			</ul>

		</nav>
		<div class="hdSubMenu">
			<ul>
				<%
					MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
				%>
				<%
					if (memberDTO != null) {
				%>
				<li><a
					href="<%=request.getContextPath()%>/member/memberLogout.jsp">LOGOUT</a></li>
				<li><a href="<%=request.getContextPath()%>/member/memberView.jsp">MY PAGE</a></li>
				<%
					} else {
				%>
				<li><a
					href="<%=request.getContextPath()%>/member/memberLoginForm.jsp">LOGIN</a></li>
				<li><a
					href="<%=request.getContextPath()%>/member/memberJoinForm.jsp">JOIN</a></li>
				<%
					}
				%>
				<li><a href="#">KO</a></li>
				<li><a href="#">EN</a></li>
				<li><a href="#">JP</a></li>
				<li><a href="#">CN</a></li>
			</ul>
		</div>
	</div>
</header>
<!-- Header 끝 -->
