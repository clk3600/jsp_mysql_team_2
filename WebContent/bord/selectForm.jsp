<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
	<form action="select.jsp" method="post">
	
	<table border="1">
			<tr>
				<td>조회할 게시글 번호</td>
				<td><input type="text" name="BOARDNUM" size="10"></td>
			</tr>
		</table>
		<input type="submit" value="게시글 조회">
		<input type="reset" value="취소">
	</form>
</body>
</html>