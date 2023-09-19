<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="jdk.internal.org.objectweb.asm.tree.TryCatchBlockNode"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String BOARDNUM = request.getParameter("BOARDNUM");
	String TITLE = request.getParameter("TITLE");
	String CONTENT = request.getParameter("CONTENT");
	String WRITER = request.getParameter("WRITER");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>

<%
	   Class.forName("com.mysql.cj.jdbc.Driver");
	   System.out.println("드라이버 로딩 성공!");
	   Connection conn = null;
	   PreparedStatement pstmt = null;
	   ResultSet resultSelect = null;
	 
	   
	   try{
		   String jdbcDriver = "jdbc:mysql://localhost:3306/jspmysqlteam2?characterEncoding=UTF-8&serverTimezone=UTC";
		   String dbUser = "jspmysqlteamuser2";
		   String dbPass = "jspmysqlteampw";
		   System.out.println("DB 접속 성공!");
		 
		   String query = "update board set TITLE = ?, CONTENT = ?, WRITER = ? where BOARDNUM=?";
		   
		  

		   conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		   
		   // 3. pStatement 생성
		   pstmt = conn.prepareStatement(query);
		   pstmt.setString(1, TITLE);
		   pstmt.setString(2, CONTENT);
		   pstmt.setString(3, WRITER);
		   pstmt.setString(4, BOARDNUM);
		   
		   // 4. 쿼리문 실행
		   int resulUpdate = pstmt.executeUpdate();
			
			%>
							
			<%= resulUpdate %>건의 데이터가 수정되었습니다!<br><br>
				<form action="index.jsp">
			<input type="submit" value="처음으로!">
			</form>		
			<% 
			
		   }
	   	   catch(SQLException ex){
		   out.println(ex.getMessage());
		   ex.printStackTrace();
	   }
	   finally{
		      // 6. 사용한 Statement 종료
		    
		      
		      if(pstmt != null) try{
		         pstmt.close();
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