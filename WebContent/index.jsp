<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}
</style>
<link href="./css/main.css" rel="stylesheet">
</head>
<body>
	<%@ include file="./temp/header.jsp" %>
	<!-- Header 끝 -->
	<!-- 메인 시작 -->
	<section id="main">
		<div id="MainContents">
			<article id="mainImage">
				<img src="./images/main/main.jpg">
			</article>
			<section id="MainBoard">
				<article class="MainPost">
					<img src="./images/main/npost1.PNG">
				</article>
				<article class="MainPost">
					<img src="./images/main/npost2.PNG">
				</article>
				<article class="MainPost">
					<div>
						<img src="./images/main/npost3.PNG">
					</div>
					<div>
						<img src="./images/main/npost4.PNG">
					</div>
				</article>
			</section>
		</div>
	</section>
	<!-- 메인 끝 -->
	<!-- 푸터시작 -->
		<%@ include file="./temp/footer.jsp" %>
	<!-- 푸터끝 해리푸터 ㅅㄱ; -->
</body>
</html>