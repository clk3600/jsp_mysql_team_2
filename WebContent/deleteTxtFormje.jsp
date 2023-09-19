<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글 삭제하기</title>
</head>
<body>

	<form action="deleteTxt.jsp">
		
		<table border="2">
			<tr>
				<td>작성 글 번호</td>
				<td> <input type="text" name="BOARDNUM" size="10"> </td>
			</tr>
			<tr>
				<td> <input type="submit" value="삭제"> </td>
				<td> <input type="reset" value="취소"> </td>
			</tr>
		</table>
	
	
	
	</form>

</body>
</html>