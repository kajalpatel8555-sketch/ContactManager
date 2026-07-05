<%@ page import="java.sql.*" %>
<%@ page import="com.contactmanager.contactmanager.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact List</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background: white;
        }

        th, td {
            border: 1px solid #000;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: lightblue;
        }

        a {
            text-decoration: none;
            color: blue;
            font-weight: bold;
        }

        .btn {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>

<body>

<h2>Contact List</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
    </tr>

    <%
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            con = DBConnection.getConnection();

            if(con == null){
    %>

    <tr>
        <td colspan="4" style="color:red;">
            Database Connection Failed!
        </td>
    </tr>

    <%
    } else {

        String sql = "SELECT * FROM contacts";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();

        while(rs.next()){
    %>

    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getString("phone") %></td>
    </tr>

    <%
            }
        }

    } catch(Exception e){
    %>

    <tr>
        <td colspan="4" style="color:red;">
            <%= e.getMessage() %>
        </td>
    </tr>

    <%
        } finally {

            try{
                if(rs != null) rs.close();
            }catch(Exception e){}

            try{
                if(ps != null) ps.close();
            }catch(Exception e){}

            try{
                if(con != null) con.close();
            }catch(Exception e){}
        }
    %>

</table>

<div class="btn">
    <a href="contact-form.jsp"> Add New Contact</a>
</div>

</body>
</html>