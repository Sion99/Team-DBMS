<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Lab #9 Response</title>
</head>
<body>
<% 
	String serverIP = "localhost";
	String strSID = "orcl";
	String portNum = "1521";
	String user = "dbms";
	String pass = "1212";
	String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
	/* System.out.println(url); */
	Connection conn = null;
	Statement pstmt;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url,user,pass);
%>
<h2>Update menu</h2>
<h4>Result</h4>
<%	
	String input = "";
	String Table = request.getParameter("Table");
	String update_action1 = request.getParameter("update_action1");
	String update_action2 = request.getParameter("update_action2");
	String sql = "UPDATE " + Table + " SET "+ update_action1+ " WHERE "+ update_action2;
	pstmt = conn.createStatement();
	try {
		int res = pstmt.executeUpdate(sql);
		out.println(res + " <p>row updated.</p>");
	} catch (SQLException e) {
		out.println("<p>Input is not correct. Please try again.\n</p>");
	}
	
%>
<input type="button" value="Go back" onclick="history.back()" />
</body>
</html>
