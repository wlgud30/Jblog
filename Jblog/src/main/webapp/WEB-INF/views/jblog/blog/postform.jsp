<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
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
		<h1>포스트 추가</h1>
		<form method="post" action="<c:url value="write"/>">
			<div class="input-group mb-3">
			 <span class="input-group-text" id="inputGroup-sizing-default" >제목</span>
			 <input type="text" name="postTitle" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			 <select name="cateNo"  class="form-select" aria-label="Default select example">
				  <c:forEach items="${list}" var="vo" varStatus="status">
					<option <c:if test="${status.index eq 0}">selected="selected"</c:if> value="${vo.cateNo }">${vo.cateName}</option>
				  </c:forEach>
			</select>
			</div>
			<div class="input-group mb-3">
			 <span class="input-group-text">내용</span>
			 <textarea class="form-control" aria-label="With textarea" name="postContent"></textarea>
			</div>
			<input class="btn btn-primary" type="submit" value="작성">
			
		</form>
		<jsp:include page="/WEB-INF/views/includes/blog_footer.jsp" />
	</main>
</body>
</html>