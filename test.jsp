<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>JDBC Connection example</title>
    </head>
  <body>
    <h1>JDBC Connection example</h1>
    
    <table border="1">
      <tr>
        <td>ID</td>
        <td>Name</td>
        <td>Age</td>
   </tr>
    <% 
    String db = "cs157a"; 
    try {
 		java.sql.Connection con; 
 		Class.forName("com.mysql.jdbc.Driver"); 
 		con = DriverManager.getConnection("jdbc:mysql://localhost/cs157a?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root","1234");
    	out.println( db + " database successfully opened.");
    	out.println("<html><body><pre>"); //nextline
     	out.println( "Database table is showing below."); 
    	String query = "select * from emp";
    	Statement stmt=con.createStatement();
    	ResultSet rs = stmt.executeQuery(query);
    	while(rs.next()) {
   	%>	
  		<tr>
  		<td><%out.println(rs.getInt(1)); %></td>
  		<td><%out.println(rs.getString(2)); %></td>
  		<td><%out.println(rs.getInt(3)); %></td>
  		</tr>
 
    <%
    	}
    %>
    </table>
    <%
    rs.close();
    stmt.close();
    con.close();
    }
    catch(SQLException e) {
    	out.println("SQLException caught: " + e.getMessage());
    	} 
    %>
  </body>
</html>


