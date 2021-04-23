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

		<form method="POST" action="<c:url value="/user/login"/>">
			<div class="form-floating">
				<input id="id" name="id" type="text" value="" class="form-control" placeholder="아이디를 입력해 주세요.">
				<label for="id"></label>
			</div>
			<div class="form-floating">
				<input name="password" type="password" value="" class="form-control" id="floatingPassword" placeholder="비밀번호를 입력해 주세요.">
				<label for="floatingPassword"></label>
			</div>
			<c:if test="${not empty msg and empty authUser}">
				<p>${msg }</p>
			</c:if>
			<button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
		</form>
	</main>

</body>
</html>