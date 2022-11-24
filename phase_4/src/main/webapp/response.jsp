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
<h2>Lab #9: Repeating Lab #5-3 via JSP</h2>
<h3>-------- Q1 Result: ---------</h3>
<%
 	String pname = request.getParameter("pname1");
	String dnum = request.getParameter("dnum1");
	String salary = request.getParameter("salary1");
	query = "with temp as (select w.essn from works_on w join project p on (w.pno = p.pnumber) where p.pname like '"+pname+"%'" + ") select distinct e.fname, e.lname from employee e join temp t on (e.ssn = t.essn) where e.salary <= "+salary+" and e.dno = "+dnum + " order by e.lname";
	pstmt = conn.prepareStatement(query);
	rs = pstmt.executeQuery();
	out.println("<table border=\"1\">");
	ResultSetMetaData rsmd = rs.getMetaData();
	int cnt = rsmd.getColumnCount();
	for(int i =0;i<cnt;i++)
		out.println("<th>"+rsmd.getColumnName(i+1)+"</th>");
	while(rs.next()){
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>");
		out.println("<td>"+rs.getString(2)+"</td>");
		out.println("</tr>");
	}
	out.println("</table>");
%>
<h3>-------- Q2 Result: ---------</h3>
<%
	String superssn = request.getParameter("superssn2");
	String addr = request.getParameter("addr2");
	query = "select d.dnumber, d.dname, e.ssn, e.fname from employee e join department d on (e.dno = d.dnumber) where e.super_ssn = '"+superssn+"' and e.address like '%" + addr + "%'";
	pstmt = conn.prepareStatement(query);
	rs = pstmt.executeQuery();
	rsmd = rs.getMetaData();
	out.println("<table border=\"1\">");
	cnt = rsmd.getColumnCount();
	for(int i =0;i<cnt;i++)
		out.println("<th>"+rsmd.getColumnName(i+1)+"</th>");
	while(rs.next()){
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>");
		out.println("<td>"+rs.getString(2)+"</td>");
		out.println("<td>"+rs.getString(3)+"</td>");
		out.println("<td>"+rs.getString(4)+"</td>");
		out.println("</tr>");
	}
	out.println("</table>");
%>
<h3>-------- Q3 Result: ---------</h3>
<%	
	pname = request.getParameter("pname3");
	String hours = request.getParameter("hours3");
	query = "select e.lname, p.pname, w.hours from employee e left join works_on w on e.ssn = w.essn left join project p on w.pno = p.pnumber where p.pname = '"+pname+"' and w.hours >= "+hours + " order by w.hours desc";
	pstmt = conn.prepareStatement(query);
	rs = pstmt.executeQuery();
	rsmd = rs.getMetaData();
	out.println("<table border=\"1\">");
	cnt = rsmd.getColumnCount();
	for(int i =0;i<cnt;i++)
		out.println("<th>"+rsmd.getColumnName(i+1)+"</th>");
	while(rs.next()){
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>");
		out.println("<td>"+rs.getString(2)+"</td>");
		out.println("<td>"+rs.getFloat(3)+"</td>");
		out.println("</tr>");
	}
	out.println("</table>");
%>
<h3>-------- Q4 Result: ---------</h3>
<%	
	pname = request.getParameter("pname4");
	hours = request.getParameter("hours4");
	query = "select distinct e.fname, e.lname, w.hours from employee e left join works_on w on e.ssn = w.essn left join project p on w.pno = p.pnumber where p.pname like '%" + pname + "%' and w.hours >= " + hours + " order by w.hours";
	pstmt = conn.prepareStatement(query);
	rs = pstmt.executeQuery();
	rsmd = rs.getMetaData();
	out.println("<table border=\"1\">");
	cnt = rsmd.getColumnCount();
	for(int i =0;i<cnt;i++)
		out.println("<th>"+rsmd.getColumnName(i+1)+"</th>");
	while(rs.next()){
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>");
		out.println("<td>"+rs.getString(2)+"</td>");
		out.println("<td>"+rs.getFloat(3)+"</td>");
		out.println("</tr>");
	}
	out.println("</table>");
%>
<h3>-------- Q5 Result: ---------</h3>
<%	
	superssn = request.getParameter("superssn5");
	query = "select e.lname, e.fname, d.dependent_name, d.sex, d.relationship from employee e inner join dependent d on e.ssn = d.essn where e.super_ssn = '" + superssn + "'";
	pstmt = conn.prepareStatement(query);
	rs = pstmt.executeQuery();
	rsmd = rs.getMetaData();
	out.println("<table border=\"1\">");
	cnt = rsmd.getColumnCount();
	for(int i =0;i<cnt;i++)
		out.println("<th>"+rsmd.getColumnName(i+1)+"</th>");
	while(rs.next()){
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>");
		out.println("<td>"+rs.getString(2)+"</td>");
		out.println("<td>"+rs.getString(3)+"</td>");
		out.println("<td>"+rs.getString(4)+"</td>");
		out.println("<td>"+rs.getString(5)+"</td>");
		out.println("</tr>");
	}
	out.println("</table>");
	rs.close();
	pstmt.close();
	conn.close();
%>
</body>
</html>