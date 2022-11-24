<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
    <!-- import JDBC package -->
    <%@ page language="java" import="java.text.*, java.sql.*" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="EUC-KR">
            <title>Phase4 Select</title>
        </head>

        <body>
        
		<form method='POST' action='view.html'>
		<input type='submit' value='Go back'>
		</form>
            <%  
            String number=request.getParameter("action_no");  
            if(number.equals("1")){
                out.println("<form method='POST' action='sresponse.jsp'>");
                out.println("<h3>Query 1. Search for academy workers satisfying the following conditions:</h3>");
                out.println("Salary more than:");
                out.println("<input type='text' name='salary1'>");
                out.println("<input type='reset' value='Reset'><input type='submit' value='Submit'>");
                out.println("</form>");
                }
                else if(number.equals("2")){
                out.println("<form method='POST' action='sresponse.jsp'>");
                    out.println("<h3>Query 2. Search for average salary of academy workers satisfying the following conditions:</h3>");
                    out.println("Who works on academy which is member of institute:");
                    out.println("<select name='insname1'>");
                        out.println("<option value='IEEE'>IEEE</option>");
                        out.println("<option value='acm'>acm</option>");
                        out.println("<option value='elsevier'>elsevier</option>");
                        out.println("<option value='springer'>springer</option>");
                        out.println("<option value='mdpi'>mdpi</option>");
                        out.println("<option value='oxford'>oxford</option>");
                        out.println("</select>");
                    out.println("<input type='reset' value='Reset'><input type='submit' value='Submit'>");
                    out.println("</form>");
                }
                else if(number.equals("3")){
                out.println("<form method='POST' action='sresponse.jsp'>");
                    out.println("<h3>Query 3. Search for journals open to:</h3>");
                    out.println("<select name='opento'>");
                        out.println("<option value='public'>Public</option>");
                        out.println("<option value='subscriberonly'>Subscriber only</option>");
                        out.println("</select>");
                    out.println("<input type='reset' value='Reset'><input type='submit' value='Submit'>");
                    out.println("</form>");
                }
                else if(number.equals("4")){
                out.println("<form method='POST' action='sresponse.jsp'>");
                    out.println("<h3>Query 4. Search for journals satisfying the following condition: </h3>");
                    out.println("which have at least one keywords in comman with other journal(ID): ");
                    out.println("<input type='text' name='jid1'>");
                    out.println("<input type='reset' value='Reset'><input type='submit' value='Submit'>");
                    out.println("</form>");
                }
                else if(number.equals("5")){
                out.println("<form method='POST' action='sresponse.jsp'>");
                    out.println("<h3>Query 5. Search for journals satisfying the following condition: </h3>");
                    out.println("over ");
                    out.println("<select name='views'>");
                        out.println("<option value='100'>100</option>");
                        out.println("<option value='500'>500</option>");
                        out.println("<option value='800'>800</option>");
                        out.println("<option value='1100'>1100</option>");
                        out.println("<option value='1500'>1500</option>");
                        out.println("<option value='1800'>1800</option>");
                        out.println("<option value='2100'>2100</option>");
                        out.println("</select>");
                    out.println("views.<br>");
                    out.println("<input type='reset' value='Reset'><input type='submit' value='Submit'>");
                    out.println("</form>");
                }
                else if(number.equals("6")){
                out.println("<form method='POST' action='sresponse.jsp'>");
                    out.println("<h3>Query 6. Search for subscribers satisfying the following condition: </h3>");
                    out.println("Who rated ");
                    out.println("<select name='stars'>");
                        out.println("<option value='1'>1</option>");
                        out.println("<option value='2'>2</option>");
                        out.println("<option value='3'>3</option>");
                        out.println("<option value='4'>4</option>");
                        out.println("<option value='5'>5</option>");
                        out.println("</select>");
                    out.println("stars. <br>");
                    out.println("<input type='reset' value='Reset'><input type='submit' value='Submit'>");
                    out.println("</form>");
                }
                else if(number.equals("7")){
                out.println("<form method='POST' action='sresponse.jsp'>");
                    out.println("<h3>Query 7. Search for total salary of academy satisfying the following condition:</h3>");
                    out.println("where academy name includes: ");
                    out.println("<input type='text' name='academyname'>");
                    out.println("<input type='reset' value='Reset'><input type='submit' value='Submit'>");
                    out.println("</form>");
                }
                else if(number.equals("8")){
                out.println("<form method='POST' action='sresponse.jsp'>");
                    out.println("<h3>Query 8. Search for institution satisfying the following condition: </h3>");
                    out.println("subscribing date is after: ");
                    out.println("<select name='date'>");
                        out.println("<option value='1999-09-07'>1999-09-07</option>");
                        out.println("<option value='2002-02-01'>2002-02-01</option>");
                        out.println("<option value='2004-06-03'>2004-06-03</option>");
                        out.println("<option value='2010-11-13'>2010-11-13</option>");
                        out.println("<option value='2015-12-20'>2015-12-20</option>");
                        out.println("<option value='2019-01-05'>2019-01-05</option>");
                        out.println("</select>");
                    out.println("<input type='reset' value='Reset'><input type='submit' value='Submit'>");
                    out.println("</form>");
                }
                else if(number.equals("9")){
                out.println("<form method='POST' action='sresponse.jsp'>");
                    out.println("<h3>Query 9. Search for journals satisfying the following condition: </h3>");
                    out.println("Keywords with ");
                    out.println("<input type='text' name='keyword1'>");
                    out.println(" and ");
                    out.println("<input type='text' name='keyword2'>");
                    out.println("<input type='reset' value='Reset'><input type='submit' value='Submit'>");
                    out.println("</form>");
                }
                else {
                out.println("<form method='POST' action='sresponse.jsp'>");
                    out.println("<h3>Query 10. Search for academy worker satisfying the following condition: </h3>");
                    out.println("who works on ");
                    out.println("<select name='dname1'>");
                        out.println("<option value='Contract'>Contract</option>");
                        out.println("<option value='Sales'>Sales</option>");
                        out.println("<option value='Publisher'>Publisher</option>");
                        out.println("<option value='Web Management'>Web Management</option>");
                        out.println("<option value='Marketing'>Marketing</option>");
                        out.println("<option value='Financial'>Financial</option>");
                        out.println("</select>");
                    out.println(" department.<br>");
                    out.println("<input type='reset' value='Reset'><input type='submit' value='Submit'>");
                    out.println("</form>");
                }

                %>
        </body>

        </html>