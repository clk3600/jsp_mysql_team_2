<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	
	String boardNUM = request.getParameter("BOARDNUM");
	String title = request.getParameter("TITLE");
	String content = request.getParameter("CONTENT");
	String writer = request.getParameter("WRITER");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>modify.jsp</title>
</head>
<body>
	
	<%
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("드라이버 로딩 성공!");
		Connection conn = null;
		PreparedStatement prstmt = null;
		
		try{
			String jdbcDriver = "jdbc:mysql://localhost:3306/jspmysqlteam2?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbUser = "jspmysqlteamuser2";
			String dbPass = "jspmysqlteampw";
			System.out.println("DB 접속 성공!");
			
			// update member set password = '2468', name = '이영자', email = 'ja@gmail.com' where memberid = 'jang';
			String query = "update BOARD set WRITER = ?, TITLE = ?, CONTENT = ? where BOARDNUM = ?";
			
			// 2. 데이터베이스 커넥션 생성
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			// 3. Statement 생성
			prstmt = conn.prepareStatement(query);
			prstmt.setString(1, writer);
			prstmt.setString(2, title);
			prstmt.setString(3, content);
			prstmt.setString(4, boardNUM);
			
			// 4. 쿼리문 실행
			int resultUpdate = prstmt.executeUpdate();
		
	%>
	<%
			// 5. 쿼리문 실행 결과 출력
				if(resultUpdate == 0){
			%>			
				<%= writer %>는 존재하지 않는 글쓴이 입니다!
			<%
				} else {
			%>
				<%= resultUpdate %>건의 게시물이 수정 되었습니다!
				<form action="index.jsp">
					<input type="submit" value="처음으로" /> <br> <br>
				</form>					
			<%
				}
			%>	
			
			<%
			}catch(SQLException ex){
				out.println(ex.getMessage());
				ex.printStackTrace();
			}   finally{
				// 6. 사용한 Statement 종료			
				if(prstmt != null) try{
					prstmt.close();
				} catch(SQLException ex){
					ex.printStackTrace();
				}
				
				// 7. 커넥션 종료
				if(conn != null) try{
					conn.close();
				} catch(SQLException ex){
					ex.printStackTrace();
				}
			}
			%>
	
	
</body>
</html>