<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>수정 화면</title>
</head>
<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form[name=updateForm]");
	
	// 저장 버튼
	$(".update_btn").on("click", function(){
		if(fn_valiChk()){
			return false;
		}
		formObj.attr("action", "/board/update");
		formObj.attr("method", "post");
		formObj.submit();
	});
	
	// 취소 버튼
	$(".cancel_btn").on("click", function(){
		location.href = "/board/list";
	});
});

// 인풋값 체크
function fn_valiChk(){
	var regForm = $("form[name=updateForm] .chk").length; // form내의 있는 클래스를 선택시 한칸 띄우고 .chk
	for(var i=0; i<regForm; i++){
		if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
			alert($(".chk").eq(i).attr("title"));
			return true;
		}
	}
}
</script>
<body>
	<div>
		<header>
			<h1>게시판</h1>
		</header>
		<hr />
		
		<%@include file="nav.jsp" %>
		<hr />
		
		<section>
			<form name="updateForm" action="/board/update" method="post">
				<table>
					<tbody>
						<tr>
							<td>
								<label for="bno">글 번호</label><input type="text" id="bno" name="bno" value="${update.bno }" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td>
								<label for="title">제목</label><input type="text" id="title" name="title" value="${update.title }" class="chk" title="제목을 입력하세요" />
							</td>
						</tr>
						<tr>
							<td>
								<label for="content">내용</label><textarea rows="" cols="" id="content" name="content" class="chk" title="내용을 입력하세요" >${update.content }</textarea>
							</td>
						</tr>
						<tr>
							<td>
								<label for="writer">작성자</label><input type="text" id="writer" name="writer" value="${update.writer }" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td>
								<label for="regdate">작성날짜</label>
								<fmt:formatDate value="${update.regdate }" pattern="yyyy-MM-dd" />
							</td>
						</tr>
					</tbody>
				</table>
			</form>
			<div>
				<button type="button" class="update_btn">저장</button>
				<button type="button" class="cancel_btn">취소</button>
			</div>
		</section>
	</div>
</body>
</html>