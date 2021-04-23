<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="<c:url value="/assets/javascript/jquery/jquery-3.6.0.js"/>"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<script src="<c:url value="/assets/javascript/blog.js"/>"></script>
	<div class="p-4 p-md-5 mb-4 text-white rounded bg-dark">
		<div class="col-md-15">
			<h1 class="display-4 fst-italic" onclick="hrefBlog('${b_id}')">${blogVo.blogTitle}</h1>
			<c:choose>
				<c:when test="${empty authUser }">
					<li><a href="<c:url value="/user/login"/>">로그인</a></li>
				</c:when>
				<c:otherwise>
					<c:if test="${authUser.userNo eq blogVo.userNo }">
						<li><a href="<c:url value="/${authUser.id }/admin/basic"/>">내 블로그관리</a></li>
					</c:if>
					<li><a href="<c:url value="/user/logout"/>">로그아웃</a></li>
				</c:otherwise>
			</c:choose>
		</div>
	</div>