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
	Connection conn = null;
	String query;
	PreparedStatement pstmt;
	ResultSet rs;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url,user,pass);
%>

<h2>Welcome</h2>
<%
 	String db_name = request.getParameter("db_name");
	String Action = request.getParameter("Action");
	System.out.println(db_name);
	if(Action.equals("Select")){
		out.println("<form method='POST' action='select.jsp'>");
		out.println("<p>Quick Overview with prepared SQL</p>");
		out.println("<p>Type data retrieve operation number you want to perform.</p>");
		out.println("<p>(1) Search by Salary \t(2) Search by Institute name \t(3) Search by Subscriber type</p>");
		out.println("<p>(4) Search by duplicated keyword \t(5) Search by views \t(6) Search by number of stars</p>");
		out.println("<p>(7) Search by academy name \t(8) Search by subscribe start date \t(9) Search by two keywords \n(10) Search by department </p>");
		out.println("<input type='text' name='number'>");
		out.println("<input type='submit' value='Go back' formaction='view.html'>");
		out.println("<input type='submit' value='Submit'>");
		out.println("</form>");
	}
	else if(Action.equals("Delete")){
		out.println("<form method='POST' action='delete.jsp'>");
		out.println("<p>Delete From "+db_name+" Where</p>");
		out.println("<input type='text' name='where_action'><br>");
		out.println("<input type='reset' value='Reset'><input type='submit' value='Submit'>");
		out.println("</form>");

	}
%>

</body>
</html>