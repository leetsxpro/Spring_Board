<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>게시물 작성 화면</title>
</head>
<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form[name=writeForm]");
	
	// 작성 버튼
	$(".write_btn").on("click", function(){
		if(fn_valiChk()){
			return false;
		}
		formObj.attr("action", "/board/write");
		formObj.attr("method", "post");
		formObj.submit();
	});
});

// 인풋값 체크
function fn_valiChk(){
	var regForm = $("form[name=writeForm] .chk").length; // form내의 있는 클래스를 선택시 한칸 띄우고 .chk
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
			<form name="writeForm" method="post" action="/board/write">
				<table>
					<tr>
						<td>
							<label for="title">제목</label><input type="text" id="title" name="title" class="chk" title="제목을 입력하세요" />					
						</td>
					</tr>
					<tr>
						<td>
							<label for="content">내용</label><textarea rows="" cols="" id="content" name="content" class="chk" title="내용을 입력하세요" ></textarea>
						</td>
					</tr>
					<tr>
						<td>
							<label for="writer">작성자</label><input type="text" id="writer" name="writer" class="chk" title="작성자를 입력하세요" />
						</td>
					</tr>
				</table>
			</form>
			<div>
				<button type="button" class="write_btn">작성</button>
			</div>
		</section>
	</div>
</body>
</html>