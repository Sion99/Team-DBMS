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
	String strSID = "xe";
	String portNum = "1521";
	String user = "dbms";
	String pass = "1212";
	String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
	/* System.out.println(url); */
	Connection conn = null;
	PreparedStatement pstmt;
	ResultSet rs;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url,user,pass);
	String sql = "";
	/* System.out.println(query); */
%>
<h4>-------- Result ---------</h4>
<%
	String number = request.getParameter("number");
	switch(number){
	case "1":
		String salary1 = request.getParameter("salary1");
		sql = "select f_name, l_name, salary from academyworker where salary > " + salary1;
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		out.println("<table border=\"1\">");
		ResultSetMetaData rsmd = rs.getMetaData();
		int cnt = rsmd.getColumnCount();
		for(int i =1;i<=cnt;i++){
			out.println("<th>"+rsmd.getColumnName(i)+"</th>");
		}
		while(rs.next()){
			out.println("<tr>");
			out.println("<td>"+rs.getString(1)+"</td>");
			out.println("<td>"+rs.getString(2)+"</td>");
			out.println("<td>"+rs.getString(3)+"</td>");
			out.println("</tr>");
		}
		out.println("</table>");
		rs.close();
		pstmt.close();
		conn.close();
		break;
		
	case "2":
		String insname1 = request.getParameter("insname1");
		sql = "select a.academy_name, round(AVG(aw.salary),2) as average_sal from academyworker aw inner join academy a \r\n"
				+ "on aw.aca_name = a.academy_name\r\n"
				+ "where ins_name = " + "'" + insname1 + "'" + "\r\n"
				+ "group by a.academy_name";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		out.println("<table border=\"1\">");
		rsmd = rs.getMetaData();
		cnt = rsmd.getColumnCount();
		for(int i =1;i<=cnt;i++){
			out.println("<th>"+rsmd.getColumnName(i)+"</th>");
		}
		while(rs.next()){
			out.println("<tr>");
			out.println("<td>"+rs.getString(1)+"</td>");
			out.println("<td>"+rs.getString(2)+"</td>");
			out.println("</tr>");
		}
		out.println("</table>");
		rs.close();
		pstmt.close();
		conn.close();
		break;
		
	case "3":
		String opento = request.getParameter("opento");
		sql = "select title from journal j \r\n"
				+ "where open_to = " + "'" + opento + "'" + "and\r\n"
				+ "exists (select unique_review_id \r\n"
				+ "from review r where r.j_id = j.unique_journal_ID)";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		out.println("<table border=\"1\">");
		rsmd = rs.getMetaData();
		cnt = rsmd.getColumnCount();
		for(int i =1;i<=cnt;i++){
			out.println("<th>"+rsmd.getColumnName(i)+"</th>");
		}
		while(rs.next()){
			out.println("<tr>");
			out.println("<td>"+rs.getString(1)+"</td>");
			out.println("</tr>");
		}
		out.println("</table>");
		rs.close();
		pstmt.close();
		conn.close();
		break;
		
	case "4":
		String jid1 = request.getParameter("jid1");
		sql = "select title from journal j \r\n"
				+ "where j.unique_journal_ID in ( \r\n"
				+ "select distinct j_id from keyword k \r\n"
				+ "where k.keyword_text in (select keyword_text from keyword\r\n"
				+ "where j_id=" + jid1 + "))";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		out.println("<table border=\"1\">");
		rsmd = rs.getMetaData();
		cnt = rsmd.getColumnCount();
		for(int i =1;i<=cnt;i++){
			out.println("<th>"+rsmd.getColumnName(i)+"</th>");
		}
		while(rs.next()){
			out.println("<tr>");
			out.println("<td>"+rs.getString(1)+"</td>");
			out.println("</tr>");
		}
		out.println("</table>");
		rs.close();
		pstmt.close();
		conn.close();
		break;		

	case "5":
		String views = request.getParameter("views");
		sql = "select title, publication_date,views from journal\r\n"
				+ "where views >= " + views + "order by views";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		out.println("<table border=\"1\">");
		rsmd = rs.getMetaData();
		cnt = rsmd.getColumnCount();
		for(int i =1;i<=cnt;i++){
			out.println("<th>"+rsmd.getColumnName(i)+"</th>");
		}
		while(rs.next()){
			out.println("<tr>");
			out.println("<td>"+rs.getString(1)+"</td>");
			out.println("<td>"+rs.getString(2)+"</td>");
			out.println("<td>"+rs.getString(3)+"</td>");
			out.println("</tr>");
		}
		out.println("</table>");
		rs.close();
		pstmt.close();
		conn.close();
		break;
		
	case "6":
		String stars = request.getParameter("stars");
		sql = "select distinct name from subscriber, rating\r\n"
				+ "where subscriber_id in (select sub_id from rating\r\n"
				+ "where star = " + stars + ")";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		out.println("<table border=\"1\">");
		rsmd = rs.getMetaData();
		cnt = rsmd.getColumnCount();
		for(int i =1;i<=cnt;i++){
			out.println("<th>"+rsmd.getColumnName(i)+"</th>");
		}
		while(rs.next()){
			out.println("<tr>");
			out.println("<td>"+rs.getString(1)+"</td>");
			out.println("</tr>");
		}
		out.println("</table>");
		rs.close();
		pstmt.close();
		conn.close();
		break;
		
	case "7":
		String academyname = request.getParameter("academyname");
		sql = "select sum(salary) from academyworker ac, academy a\r\n"
				+ "where a.academy_name like +" + "'" + "%" + academyname + "%" + "'" + "\r\n"
				+ "and a.academy_name = ac.aca_name";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		out.println("<table border=\"1\">");
		rsmd = rs.getMetaData();
		cnt = rsmd.getColumnCount();
		for(int i =1;i<=cnt;i++){
			out.println("<th>"+rsmd.getColumnName(i)+"</th>");
		}
		while(rs.next()){
			out.println("<tr>");
			out.println("<td>"+rs.getString(1)+"</td>");
			out.println("</tr>");
		}
		out.println("</table>");
		rs.close();
		pstmt.close();
		conn.close();
		break;
		
	case "8":
		String date = request.getParameter("date");
		sql = "select name from subscriber\r\n"
				+ "where subscriber_type = 'institution'\r\n"
				+ "and starting_date > TO_DATE('" + date + "', 'yyyy-mm-dd')";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		out.println("<table border=\"1\">");
		rsmd = rs.getMetaData();
		cnt = rsmd.getColumnCount();
		for(int i =1;i<=cnt;i++){
			out.println("<th>"+rsmd.getColumnName(i)+"</th>");
		}
		while(rs.next()){
			out.println("<tr>");
			out.println("<td>"+rs.getString(1)+"</td>");
			out.println("</tr>");
		}
		out.println("</table>");
		rs.close();
		pstmt.close();
		conn.close();
		break;
		
	case "9":
		String keyword1 = request.getParameter("keyword1");
		String keyword2 = request.getParameter("keyword2");
		sql = "select title from journal j\r\n"
				+ "where j.unique_journal_ID in (\r\n"
				+ "select distinct j_id from keyword k\r\n"
				+ "where k.keyword_text =" + "'" + keyword1 + "'" + ")\r\n"
				+ "INTERSECT\r\n"
				+ "select title from journal j\r\n"
				+ "where j.unique_journal_ID in (\r\n"
				+ "select distinct j_id from keyword k\r\n"
				+ "where k.keyword_text =" + "'" + keyword2 + "'" + ")";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		out.println("<table border=\"1\">");
		rsmd = rs.getMetaData();
		cnt = rsmd.getColumnCount();
		for(int i =1;i<=cnt;i++){
			out.println("<th>"+rsmd.getColumnName(i)+"</th>");
		}
		while(rs.next()){
			out.println("<tr>");
			out.println("<td>"+rs.getString(1)+"</td>");
			out.println("</tr>");
		}
		out.println("</table>");
		rs.close();
		pstmt.close();
		conn.close();
		break;
		
	case "10":
		String dname1 = request.getParameter("dname1");
		sql = "select f_name, l_name\r\n"
				+ "from academyworker\r\n"
				+ "where department = " + "'" + dname1 + "'";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		out.println("<table border=\"1\">");
		rsmd = rs.getMetaData();
		cnt = rsmd.getColumnCount();
		for(int i =1;i<=cnt;i++){
			out.println("<th>"+rsmd.getColumnName(i)+"</th>");
		}
		while(rs.next()){
			out.println("<tr>");
			out.println("<td>"+rs.getString(1)+"</td>");
			out.println("<td>"+rs.getString(2)+"</td>");
			out.println("</tr>");
		}
		out.println("</table>");
		rs.close();
		pstmt.close();
		conn.close();
		break;	
	}
%>
</body>
</html>