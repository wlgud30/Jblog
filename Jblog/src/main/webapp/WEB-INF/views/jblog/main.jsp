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
		<div class="input-group">
			<input type="search" class="form-control rounded"
				placeholder="검색어를 입력 하세요." aria-label="Search"
				aria-describedby="search-addon" />
			<button type="button" class="btn btn-outline-primary">검색</button>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio"
				name="inlineRadioOptions" id="inlineRadio1" value="option1" /> <label
				class="form-check-label" for="inlineRadio1">블로그 제목</label>
		</div>

		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio"
				name="inlineRadioOptions" id="inlineRadio2" value="option2" /> <label
				class="form-check-label" for="inlineRadio2">블로그</label>
		</div>
	</main>

</body>
</html>