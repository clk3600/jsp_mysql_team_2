<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<!-- 1단계 : 게시글 등록 -->
	<form action="insertBoardForm.jsp">
		<input type="submit" value="게시글 등록_정주이"/> <br> <br>
	</form>
	<form action="insertForm.jsp">
		<input type="submit" value="게시글 등록_조성진"/> <br> <br>
	</form>
	<!-- 2단계 : 게시글 번호 입력 상세 조회 -->
	<form action="selectFormse.jsp">
		<input type="submit" value="게시글 번호 입력 상세 조회_김성우"/> <br> <br>
	</form>
	<!-- 3단계 : 게시글 수정 -->
	<form action="modifyFormch.jsp">
		<input type="submit" value="게시글 번호 입력 수정_김채연"/> <br> <br>
	</form>
	<!-- 4단계 : 게시글 작성자 -->
	<form action="deleteTxtFormje.jsp">
		<input type="submit" value="게시글  삭제_김지은"/> <br> <br>
	</form>
</body>

</html>