<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
</head>
<body>
	<div>
		<header>
			<h1>게시판</h1>
		</header>
		<hr />
		
		<%@include file="nav.jsp" %>
		<hr />
		
		<section>
			<table>
				<thead>
					<tr><th>글 번호</th><th>제목</th><th>작성자</th><th>작성일자</th></tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="list">
					<tr>
						<td><c:out value="${list.bno }" /></td>
						<td>
							<a href="/board/readView?bno=${list.bno }"><c:out value="${list.title }" /></a>
						</td>
						<td><c:out value="${list.writer }" /></td>
						<td><fmt:formatDate value="${list.regdate }" pattern="yyyy-MM-dd" /></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</section>
	</div>
</body>
</html>