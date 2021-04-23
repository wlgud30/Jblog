<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<c:url value="/assets/javascript/jquery/jquery-3.6.0.js"/>"></script>
<!-- 스크립트 삽입 -->
<script src="<c:url value="/assets/javascript/blog.js"/>"></script>
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
	<form method="post" action="<c:url value="category_delete"/>">
		<table class="table table-bordered">
			<thead>
				<tr class="table-primary">
					<td>번호</td>
					<td>카테고리명</td>
					<td>포스트 수</td>
					<td>설명</td>
					<td>삭제</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var = "vo">
					<tr>
						<td>${vo.cateNo }</td>
						<td>${vo.cateName }</td>
						<td>${vo.count }</td>
						<td>${vo.description }</td>
						<td>
							<input type="button" onclick="cateDel('${vo.cateNo }','${authUser.id }')" value="X"/>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
	<form method="post" action="<c:url value="category_insert"/>">
		<h3>새로운 카테고리 추가</h3>
		<div class="input-group mb-3">
		  <span class="input-group-text" id="inputGroup-sizing-default" >카테고리명</span>
		  <input type="text" name="cateName" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
		</div>
		<div class="input-group mb-3">
		  <span class="input-group-text" id="inputGroup-sizing-default">설명</span>
		  <input type="text" name="description" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
		</div>
		<input class="btn btn-primary" type="submit" value="작성">
	</form>
	<jsp:include page="/WEB-INF/views/includes/blog_footer.jsp" />
	</main>
</body>
</html>