<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="text-center">
	<main class="form-signin">
		<jsp:include page="/WEB-INF/views/includes/header.jsp" />
		<h5>감사합니다 회원가입 및 블로그가 성공적으로 만들어 졌습니다.</h5>
		<a href="<c:url value="/user/login"/>">
			<button class="w-100 btn btn-lg btn-primary" type="button">로그인하기</button>
		</a>
	</main>

</body>
</html>