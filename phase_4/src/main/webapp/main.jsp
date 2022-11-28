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
		out.println("<form method='POST' action='insert.jsp'>");
		switch (db_name) {
		case "Subscriber":
			out.println("<p>Insert into "+db_name+".</p>");
			out.println("<p>Subscriber id(10000~20000): <input type='text' name='subscriber_id'><br>"
					+"Starting date(yyyy-mm-dd): <input type='date' name='starting_date' value='2000-01-01'><br>"
					+"Validation date(yyyy-mm-dd): <input type='date' name='validation_due' value='2000-01-01'><br>"
					+"Subscriber type: <select name = 'subscriber_type'><option value='individual'>individual</option>"
					+"<option value='isntitution'>isntitution</option></select><br>"
					+"Name: <input type='text' name='name'><br></p>");
			break;
		case "Rating":
			out.println("<p>Insert into "+db_name+".</p>");
			out.println("<p>Subscriber id(10000~20000): <input type='text' name='sub_id'><br>"
					+"Journal id(30000~40000): <input type='text' name='j_id'><br>"
					+"Written date(yyyy-mm-dd): <input type='date' name='written_date' value='2000-01-01'><br>"
					+"Star: <select name = 'subscriber_type'><option value='1'>1</option><option value='2'>2</option>"
					+"<option value='3'>3</option><option value='4'>4</option><option value='5'>5</option></select><br></p>");
			break;
		case "Journal":
			out.println("<p>Insert into "+db_name+".</p>");
			out.println("<p>Journal id(30000~40000): <input type='text' name='j_id'><br>"
					+"Title: <input type='text' name='title'><br>"
					+"Views: <input type='text' name='views'><br>"
					+"Cited by: <input type='text' name='cited_by'><br>"
					+"Volume number: <input type='text' name='vol_num'><br>"
					+"Academy name: <input type='text' name='aca_name'><br>"
					+"Publication date(yyyy-mm-dd): <input type='date' name='publication_date' value='2000-01-01'><br>"
					+"Open to: <select name = 'open_to'><option value='subscriber_only'>subscriber only</option>"
					+"<option value='public'>public</option></select><br></p>");
			break;	
		case "Review":
			out.println("<p>Insert into "+db_name+".</p>");
			out.println("<p>Review id(60000~70000): <input type='text' name='unique_review_id'><br>"
					+"Journal id(30000~40000): <input type='text' name='j_id'><br>"
					+"Author id(50000~60000): <input type='text' name='a_id'><br>"
					+"Review text: <input type='text' name='review_text'><br>"
					+"Review date(yyyy-mm-dd): <input type='date' name='review_date' value='2000-01-01'><br></p>");
			break;	
		case "Author":
			out.println("<p>Insert into "+db_name+".</p>");
			out.println("<p>Author id(50000~60000): <input type='text' name='unique_author_id'><br>"
					+"First name: <input type='text' name='F_name'><br>"
					+"Last name: <input type='text' name='L_name'><br></p>");
			break;	
		case "Academyworker":
			out.println("<p>Insert into "+db_name+".</p>");
			out.println("<p>Worker id(40000~50000): <input type='text' name='unique_worker_id'><br>"
					+"First name: <input type='text' name='F_name'><br>"
					+"Last name: <input type='text' name='L_name'><br>"
					+"Academy name: <input type='text' name='aca_name'><br>"
					+"Department: <select name = 'department'><option value='Contract'>Contract</option>"
					+"<option value='Sales'>Sales</option><option value='Publisher'>Publisher</option>"
					+"<option value='Web Management'>Web Management</option><option value='Marketing'>Marketing</option>"
					+"<option value='Financial'>Financial</option></select><br>"
					+"Salary: <input type='text' name='salary'><br></p>");
			break;	
		case "Institute":
			out.println("<p>Insert into "+db_name+".</p>");
			out.println("<p>Institute name: <input type='text' name='Institute_name'><br></p>");
			break;	
		case "Academy":
			out.println("<p>Insert into "+db_name+".</p>");
			out.println("<p>Academy name: <input type='text' name='aca_name'><br>"
					+"Institution name: <select name = 'ins_name'><option value='IEEE'>IEEE</option>"
					+"<option value='acm'>acm</option><option value='elsevier'>elsevier</option>"
					+"<option value='springer'>springer</option><option value='mdpi'>mdpi</option>"
					+"<option value='oxford'>oxford</option></option></select><br>"
					+"Academy foundation date(yyyy-mm-dd): <input type='date' name='academy_foundation_date' value='2000-01-01'><br></p>");
			break;	
		default:
			break;
		}
		out.println("<input type='hidden' name='Table' value='"+db_name+"'/>");
		out.println("<input type='reset' value='Reset'><input type='submit' value='Submit'></p>");
		out.println("</form>");
		
	}
%>

</body>
</html>