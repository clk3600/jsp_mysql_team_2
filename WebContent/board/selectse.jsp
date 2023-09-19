<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String writer = request.getParameter("writer");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Select 조회문</title>
<style>
	table{
		border-collapse: collapse;
	}
</style>
</head>
<body>
	<%
		// 1. JDBC 드라이버 로딩
	Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("드라이브 로딩 성공!");
	Connection conn = null;
	PreparedStatement pstmtSelect = null;
	ResultSet resultSelect = null;
	try {
		String jdbcDriver = "jdbc:mysql://localhost:3306/jspmysqlteam2?characterEncoding=UTF-8&serverTimezone=UTC";
		String dbUser = "jspmysqlteamuser2";
		String dbPass = "jspmysqlteampw";
		System.out.println("DB 접속 성공!");

		String query = "select * from board where writer = ?";

		// 2. 데이터베이스 커넥션 생성
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

		// 3. Satatement 생성
		pstmtSelect = conn.prepareStatement(query);
		pstmtSelect.setString(1, writer);

		// 4. 쿼리문 실행
		resultSelect = pstmtSelect.executeQuery();
		if (resultSelect.next()) {
	%>

	<table border="1">
		<tr>
			<td>게시글번호</td>
			<td><%=resultSelect.getInt("BOARDNUM")%></td>
		</tr>
		<tr>
			<td>게시글제목</td>
			<td><%=resultSelect.getString("TITLE")%></td>
		</tr>
		<tr>
			<td>게시글내용</td>
			<td><%=resultSelect.getString("CONTENT")%></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><%=resultSelect.getString("WRITER")%></td>
		</tr>
	</table>

	<%
		} else {
	%>
	<%=writer%>에 해당하는 정보가 존재하지 않습니다!
	<%
		}

	} catch (SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
	} finally {
	// 6. 사용한 Statement 종료
	if (resultSelect != null)
	try {
		resultSelect.close();
	} catch (SQLException ex) {
		ex.printStackTrace();
	}

	if (pstmtSelect != null)
	try {
		pstmtSelect.close();
	} catch (SQLException ex) {
		ex.printStackTrace();
	}

	// 7. 커넥션 종료
	if (conn != null)
	try {
		conn.close();
	} catch (SQLException ex) {
		ex.printStackTrace();
	}
	}
	%>
	<div>
		<form action="index.jsp">
			<input type="submit" value="처음으로">
		</form>
	</div>
</body>
</html>