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

<form method='POST' action='view.html'>
<input type='submit' value='Go back'>
</form>
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
<h2>Delete menu</h2>
<h4>Answer</h4>
<%	
	boolean incorrect = true;
	String input = "";
	String Table = request.getParameter("Table");
	String where_action = request.getParameter("where_action");
	String sql = "DELETE FROM " + Table + " WHERE "+ where_action;
	pstmt = conn.createStatement();
	try {
		pstmt.addBatch(sql);
		int[] count = pstmt.executeBatch();
		if (count[0] == 0)
			out.println("<p>No matching data to delete</p>");
		else
			out.println(count[0] + "<p> row successfully deleted.</p>");
	} catch (SQLException e) {
		out.println("<p>Query is not correct. Please try again.</p>");
	}
%>
<input type="button" value="go back" onclick="history.back()" />
</body>
</html>
