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


<input type="button" value="Go back" onclick="history.back()" />
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
<h2>Insert menu</h2>
<h4>Answer</h4>
<%	
	boolean incorrect = true;
	String input = "";
	String Table = request.getParameter("Table");
	String where_action = request.getParameter("where_action");
	String sql = "INSERT INTO " + Table + " VALUES (";
	pstmt = conn.createStatement();
	String subscriber_id, starting_date, validation_due, subscriber_type, name, star, written_date, sub_id, j_id, views, title,
		open_to, publication_date,cited_by, vol_num, aca_name, unique_review_id, review_date, review_text, a_id,unique_author_id,
		F_name,L_name, unique_worker_id, department, salary, Institute_name, academy_foundation_date, ins_name;
	switch (Table) {
	case "Subscriber":
		subscriber_id = request.getParameter("subscriber_id");
		starting_date = request.getParameter("starting_date");
		validation_due = request.getParameter("validation_due");
		subscriber_type = request.getParameter("subscriber_type");
		name = request.getParameter("name");
		sql+=subscriber_id + ", to_date('" + starting_date + "', 'yyyy-mm-dd'), to_date('" + validation_due +"', 'yyyy-mm-dd'), '"
			+ subscriber_type + "', '" + name+"')";
		break;
	case "Rating":
		star = request.getParameter("star");
		written_date = request.getParameter("written_date");
		sub_id = request.getParameter("sub_id");
		j_id = request.getParameter("j_id");
		sql+=star + ", to_date('" + written_date + "', 'yyyy-mm-dd')," + sub_id + "," + j_id +")";
		break;
	case "Journal":
		j_id = request.getParameter("j_id");
		views = request.getParameter("views");
		title = request.getParameter("title");
		open_to = request.getParameter("open_to");
		publication_date = request.getParameter("publication_date");
		cited_by = request.getParameter("cited_by");
		vol_num = request.getParameter("vol_num");
		aca_name = request.getParameter("aca_name");
		sql+=j_id + ","+ views+ ",'"+ title+"','"+ open_to +"', to_date('" + publication_date + "', 'yyyy-mm-dd'),"
			+ cited_by + "," + vol_num+",'"+ aca_name+"')";
		break;	
	case "Review":
		unique_review_id = request.getParameter("unique_review_id");
		review_date = request.getParameter("review_date");
		review_text = request.getParameter("review_text");
		j_id = request.getParameter("j_id");
		a_id = request.getParameter("a_id");
		sql+=unique_review_id + "', to_date('" + review_date + "', 'yyyy-mm-dd'),'" + review_text + "'," + j_id+",'"+ a_id+")";
		break;		
	case "Author":
		unique_author_id = request.getParameter("unique_author_id");
		F_name = request.getParameter("F_name");
		L_name = request.getParameter("L_name");
		sql+=unique_author_id + ",'" + F_name + "','" + L_name+"')";
		break;	
	case "Academyworker":
		unique_worker_id = request.getParameter("unique_worker_id");
		F_name = request.getParameter("F_name");
		L_name = request.getParameter("L_name");
		department = request.getParameter("department");
		aca_name = request.getParameter("aca_name");
		salary = request.getParameter("salary");
		sql+=unique_worker_id + ",'" + F_name + "','" + L_name+ "','" + department + "','" + aca_name + "," + salary + ")";
		break;	
	case "Institute":
		out.println("<p>Institute name: <input type='text' name='Institute_name'><br></p>");
		Institute_name = request.getParameter("Institute_name");
		sql+= "'"+Institute_name+"')";
		break;	
	case "Academy":
		aca_name = request.getParameter("aca_name");
		academy_foundation_date = request.getParameter("academy_foundation_date");
		ins_name = request.getParameter("ins_name");
		sql+= "'"+aca_name+ "', to_date('" + academy_foundation_date + "', 'yyyy-mm-dd'),'"+ins_name+"')";
		
		break;	
	default:
		break;
	}
	try {
		out.println("<p>"+sql+"</p>");
		pstmt.executeUpdate(sql);
		pstmt.executeBatch();
		out.println("<p> Data successfully inserted.</p>");
	} catch (SQLException e) {
		out.println("<p>Query is not correct. Please try again.</p>");
	}
	
	
%>

</body>
</html>
