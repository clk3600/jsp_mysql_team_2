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
		 
		   String query = "select * from board where BOARDNUM = ?";
		   
		  

		   conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		   
		   // 3. pStatement 생성
		   pstmt = conn.prepareStatement(query);
		   pstmt.setString(1, BOARDNUM);
		   
		   // 4. 쿼리문 실행
		   resultSelect = pstmt.executeQuery();
		
		
			
			 // 5. 쿼리문 실행 결과 출력
		   if(resultSelect.next()){
		%>
			<table border="1">
			<tr>
				<td>글 번호</td>
				
			<td><%= resultSelect.getString("BOARDNUM") %></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><%= resultSelect.getString("TITLE") %></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><%= resultSelect.getString("CONTENT") %></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><%= resultSelect.getString("WRITER") %></td>
			</tr>
			</table>
			<form action="index.jsp">
			<input type="submit" value="처음으로!">
			</form>	
		<%				
		   }else{
				%>
			게시글 번호	<%= BOARDNUM %>번 게시물은 존재하지 않습니다!
				
				<% 
		   }
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