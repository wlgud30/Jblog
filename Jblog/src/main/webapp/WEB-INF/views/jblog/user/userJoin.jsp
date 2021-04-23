<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<c:url value="/assets/javascript/jquery/jquery-3.6.0.js"/>"></script>
<!-- 스크립트 삽입 -->
<script src="<c:url value="/assets/javascript/user.js"/>"></script>
<title>Insert title here</title>
</head>
<body class="text-center">
	<main class="form-signin">
		<jsp:include page="/WEB-INF/views/includes/header.jsp" />
		<form action="<c:url value="/user/join"/>" method="POST" id="uJoinForm">
			<input type="hidden" name="check" value="f">
			<div class="form-floating">
				<input type="text" name="userName" placeholder="이름을 입력하십시오."class="form-control">
				<spring:hasBindErrors name="userVo">
					<c:if test="${ errors.hasFieldErrors('userName') }">
						<script>
							var msg = "${errors.getFieldError('userName').defaultMessage }"
							alert(msg);
						</script>
					</c:if>
				</spring:hasBindErrors>
			</div>
			<div class="input-group">
				<input name="id" type="text" placeholder="아이디를 입력하십시오" class="form-control rounded" aria-label="Search" aria-describedby="search-addon">
				<button type="button" class="btn btn-outline-primary" onclick="checkId()">중복체크</button>
				<spring:hasBindErrors name="userVo">
					<c:if test="${ errors.hasFieldErrors('id') }">
						<script>
							var msg = "${errors.getFieldError('id').defaultMessage }"
							alert(msg);
						</script>
					</c:if>
				</spring:hasBindErrors>
			</div>
			<div class="form-floating">
				<input name="password" type="password" placeholder="비밀번호를 입력하십시오" class="form-control" style=" margin-bottom: 0px;">
				<spring:hasBindErrors name="userVo">
					<c:if test="${ errors.hasFieldErrors('password') }">
						<script>
							var msg = "${errors.getFieldError('password').defaultMessage }"
							alert(msg);
						</script>
					</c:if>
				</spring:hasBindErrors>
			</div>
			<div class="checkbox mb-3">
		      <label>
		        <input type="checkbox" id="chk" value=""> 약관 동의
		      </label>
		    </div>
			<button class="w-100 btn btn-lg btn-primary" type="button" onclick="userJoin()">회원가입</button>
		</form>
	</main>

</body>
</html>