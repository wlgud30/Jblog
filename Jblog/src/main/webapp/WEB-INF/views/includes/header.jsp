<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<style>
html, body {
	height: 100%;
}

body {
	display: flex;
	align-items: center;
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #f5f5f5;
}

.form-signin {
	width: 100%;
	max-width: 330px;
	padding: 15px;
	margin: auto;
}

.form-signin .checkbox {
	font-weight: 400;
}

.form-signin .form-floating:focus-within {
	z-index: 2;
}

.form-signin input[type="email"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}
</style>


		<form>
			<h1 class="h3 mb-3 fw-normal"><a href="/jblog">JBlog</a></h1>

			<div class="form-floating">
				<c:choose>
					<c:when test="${empty authUser }">
						<a href="<c:url value="/user/login"/>"><button type="button" class="btn btn-primary">로그인</button></a>
						<a href="<c:url value="/user/join"/>"><button type="button" class="btn btn-primary">회원가입</button></a>
					</c:when>
					<c:otherwise>
						<a href="<c:url value="/user/logout"/>"><button type="button" class="btn btn-primary">로그아웃</button></a>
						<a href="<c:url value="/${authUser.id }"/>"><button type="button" class="btn btn-primary">내블로그</button></a>
					</c:otherwise>
				</c:choose>
			</div>
			<br />
		</form>
	