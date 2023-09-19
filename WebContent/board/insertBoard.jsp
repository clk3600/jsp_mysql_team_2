<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	
	String boardnum = request.getParameter("BOARDNUM");
	String title = request.getParameter("TITLE");
	String content = request.getParameter("CONTENT");
	String writer = request.getParameter("WRITER");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("드라이버 로딩 성공!");
	Connection conn = null;
	Statement stmt = null;
	
	try{
		String jdbcDriver = "jdbc:mysql://localhost:3306/jspmysqlteam2?characterEncoding=UTF-8&serverTimezone=UTC";
		String dbUser = "jspmysqlteamuser2";
		String dbPass = "jspmysqlteampw";
		System.out.println("DB 접속 성공!");
		
		// insert into board values(10, '등록', '수정', '정주이');
		String query = "insert into board values('"+boardnum+"','"+title+"', '"+content+"', '"+writer+"')";
		
		// 2. 데이터베이스 커넥션 생성
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		// 3. Statement 생성
		stmt = conn.createStatement();
		
		// 4. 쿼리문 실행
		int resultInsert = stmt.executeUpdate(query);
		
		// 5. 쿼리문 실행 결과 출력
			
			%>
			
			<%= resultInsert %> 건의 게시글의 등록되었습니다!
			
			<%
		
	}
	catch(SQLException ex) {
		out.println(ex.getMessage());
		ex.printStackTrace();
	} finally{
	      // 6. 사용한 Statement 종료
	      if(stmt != null) try{
	         stmt.close();
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