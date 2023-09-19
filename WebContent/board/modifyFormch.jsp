<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>modifyForm.jsp</title>
</head>
<body>
	<form action="modifych.jsp" method="post">
	
		<table border="1">
			<tr>
				<td>넘버</td>
				<td><input type="text" name="BOARDNUM" size="20"></td>
			</tr>
			<tr>
				<td>타이틀</td>
				<td><input type="text" name="TITLE" size="20"></td>
			</tr>
			<tr>
				<td>콘텐츠</td>
				<td><input type="text" name="CONTENT" size="20"></td>
			</tr>
			<tr>
				<td>글쓴이</td>
				<td><input type="text" name="WRITER" size="20"></td>
			</tr>
			<tr>
				<td><input type="submit" value="수정"></td>
				<td><input type="reset" value="취소"></td>
			</tr>		
		</table>	
	
	</form>
</body>
</html>