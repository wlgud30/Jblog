<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<main class="container">
		<jsp:include page="/WEB-INF/views/includes/blog_header.jsp" />
		<div  style="margin-left: 0px;">
			<div class="btn-group" role="group" aria-label="Basic example">
				<a href="<c:url value="basic"/>"><button type="button" class="btn btn-primary">기본설정</button></a>
				<a href="<c:url value="category"/>"><button type="button" class="btn btn-primary">카테고리</button></a>
				<a href="<c:url value="write"/>"><button type="button" class="btn btn-primary">글작성</button></a>
			</div>
		</div>
		<br/>
		<form method="post" action="<c:url value="basic"/>"enctype="multipart/form-data">
			<div class="input-group mb-3">
			  <span class="input-group-text" id="inputGroup-sizing-default">블로그 제목</span>
			  <input type="text" name="blogTitle" value="${blogVo.blogTitle }" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			<p>로고이미지</p>
			<div class="input-group">
				<c:if test="${not empty blogVo.logoFile}">
					<img width=320 height=240 class="img-thumbnail" src="/jblog/upload-images/${blogVo.logoFile }">
				</c:if>
			</div>
			<input type="file" value="${blogVo.logoFile }" name="uploadfile">
			<input type="submit" value="전송">
		</form>
		<jsp:include page="/WEB-INF/views/includes/blog_footer.jsp" />
	</main>
</body>
</html>