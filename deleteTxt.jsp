<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String boardNum = request.getParameter("BOARDNUM");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>삭제하기</title>
<style type="text/css">
	table{
		border: 2px pink solid;
	}

</style>

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
		
		//delete from member where memberid = 'lee';
		String query = "delete from board where boardnum = '"+boardNum+"'";
		
		//2.데이터 베이스 커넥션 생성
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		//3. Statement 생성
		stmt = conn.createStatement();
		
		//4. 쿼리문 실행
		int resultDelete = stmt.executeUpdate(query);
		
		//5. 쿼리문 실행 결과 출력

 %>			
			
			<% if(resultDelete == 0){ %>
			
			<%= boardNum %> ID가 존재하지 않습니다!
			
			<%
				}else{
					%>
				
			<%= resultDelete %>건의 데이터가 삭제되었습니다! <br> <br>
			}
			<%
			}
			%>
		<%
		
	}
	
	catch(SQLException ex){
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