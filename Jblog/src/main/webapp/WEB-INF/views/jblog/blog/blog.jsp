<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 img {
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}
</style>
</head>
<body>
	<main class="container">
		<jsp:include page="/WEB-INF/views/includes/blog_header.jsp" />
		<div class="row">
			<div class="col-md-8">
				<article class="blog-post">
					<c:choose>
						<c:when test="${empty pVo}">
							<h2 class="blog-post-title">등록된 글이 없습니다.</h2>
						</c:when>
						<c:otherwise>
							<h2 class="blog-post-title">${pVo.postTitle }</h2>
							<p>${pVo.postContent }</p>
						</c:otherwise>
					</c:choose>
				</article>
				<article class="blog-post">
					<c:if test="${not empty authUser && not empty pVo}">
						<form id="cmtForm" method="post" action="<c:url value="${b_id}/admin/cmtInsert"/>">
							<div class="input-group mb-3">
							  <span class="input-group-text" id="inputGroup-sizing-default">${authUser.userName}</span>
							  <input type="hidden" name="userNo" value="${authUser.userNo}">
							  <input type="hidden" name="postNo" value="${pVo.postNo}">
							  <input type="text" name="cmtContent" value="" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
							  <button type="button" class="btn btn-outline-primary" onclick="cmtInsert()">코멘트 작성</button>
							</div>
						</form>
					</c:if>
					<c:if test="${not empty cmtList && not empty pVo}">
						<form id="cmtDelForm"method="post" action="<c:url value="${b_id}/admin/cmtDelete"/>">
							<input type="hidden" name="cmtNo" id="cmt_cmtNo" value=""/>
							<input type="hidden" name="postNo" id="cmt_postNo"value=""/>
							<table class="table table-bordered">
								<c:forEach items="${cmtList}" var="vo">
									<tr>
										<td>${vo.userName }</td>
										<td>${vo.cmtContent }</td>
										<td><fmt:formatDate value="${vo.regDate}" pattern="yyyy/MM/dd"/></td>
										<td>
											<c:if test="${authUser.userNo eq vo.userNo }">
												<input type="button" onclick="cmtDel('${vo.cmtNo }','${pVo.postNo }')" value="X"/>
											</c:if>
										</td>
									</tr>
								</c:forEach>
							</table>
						</form>
					</c:if>
				</article>
				<nav class="blog-pagination" aria-label="Pagination">
					<table class="table">
						<c:forEach items="${pList }" var="vo">
							<tr onclick="">
								<td><a href="?postNo=${vo.postNo }&cateNo=${vo.cateNo}">${vo.postTitle }</a></td>
								<td><fmt:formatDate value="${vo.regDate}" pattern="yyyy/MM/dd"/></td>
							</tr>
						</c:forEach>
					</table>
				</nav>
			</div>
			<div class="col-md-4">
				<c:if test="${not empty blogVo.logoFile}">
					<div class="p-4">
						<img class="fst-italic" src="assets/img/${blogVo.logoFile}" style="display : block;">
					</div>
				</c:if>
				<div class="p-4">
					<h4 class="fst-italic" >카테고리</h4>
					<ol class="list-unstyled mb-0">
						<c:forEach items="${cList}" var="vo">
							<li><a href="?cateNo=${vo.cateNo }">${vo.cateName }</a></li>
						</c:forEach>
					</ol>
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/includes/blog_footer.jsp" />
	</main>
	<!--jsp:include page="/WEB-INF/views/includes/blog_header.jsp" />
		<c:if test="${not empty blogVo.logoFile}">
			<img src="assets/img/${blogVo.logoFile }">
		</c:if>
	<jsp:include page="/WEB-INF/views/includes/blog_footer.jsp" />
	  -->
</body>
</html>