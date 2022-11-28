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
<form method='POST' action='view.html'>
<input type='submit' value='Go back'>
</form>
<h2>Welcome</h2>
<%
 	String db_name = request.getParameter("db_name");
	String Action = request.getParameter("Action");
	if(Action.equals("Select")){
		out.println("<form method='POST' action='select.jsp'>");
		out.println("<p>Quick Overview with prepared SQL.</p>");
		out.println("<p>Select operation number you want to perform.</p>");
		out.println("<select name = 'action_no'>");
		out.println("<option value='1'>(1) Search by Salary</option>");
		out.println("<option value='2'>(2) Search by Institute name</option>");
		out.println("<option value='3'>(3) Search by Subscriber type</option>");
		out.println("<option value='4'>(4) Search by duplicated keyword</option>");
		out.println("<option value='5'>(5) Search by views</option>");
		out.println("<option value='6'>(6) Search by number of stars</option>");
		out.println("<option value='7'>(7) Search by academy name</option>");
		out.println("<option value='8'>(8) Search by subscribe start date</option>");
		out.println("<option value='9'>(9) Search by two keywords</option>");
		out.println("<option value='10'>(10) Search by department</option>");
		out.println("</select>");
		//out.println("<input type='submit' value='Go back' formaction='view.html'>");
		out.println("<input type='submit' value='Submit'>");
		out.println("</form>");
	}
	else if(Action.equals("Delete")){
		out.println("<form method='POST' action='delete.jsp'>");
		out.println("<p>Delete From "+db_name+" Where</p>");
		out.println("<input type='hidden' name='Table' value='"+db_name+"'/>");
		out.println("<input type='text' name='where_action'><br>");
		out.println("<input type='reset' value='Reset'><input type='submit' value='Submit'>");
		out.println("</form>");
	}
	else if(Action.equals("Update")){
		out.println("<form method='POST' action='update.jsp'>");
		out.println("<p>Update "+db_name+" Set <input type='text' name='set_action'> Where <input type='text' name='where_action'><br>");
		out.println("<input type='hidden' name='Table' value='"+db_name+"'/>");
		out.println("<input type='reset' value='Reset'><input type='submit' value='Submit'></p>");
		out.println("</form>");
	}
	else{
		
				
		
		
		
	}
%>

</body>
</html>