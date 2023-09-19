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
	<form action="board/insertForm.jsp">
		<input type="submit" value="게시글 등록" name="INSERT" /> <br> <br>
	</form>
	<!-- 2단계 : 게시글 번호 입력 상세 조회 -->
	<form action="board/selectForm.jsp">
		<input type="submit" value="게시글 번호 입력 상세 조회" name="SELECT"/> <br> <br>
	</form>
	<!-- 3단계 : 게시글 수정 -->
	<form action="board/modifyForm.jsp">
		<input type="submit" value="게시글 번호 입력 수정" name="MODIFY" /> <br> <br>
	</form>
	<!-- 4단계 : 게시글 작성자 -->
	<form action="board/deleteForm.jsp">
		<input type="submit" value="게시글 작성자" name="NAME" /> <br> <br>
	</form>
</body>

</html>