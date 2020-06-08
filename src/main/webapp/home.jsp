<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Java WebApp - Home</title>
</head>
<body>
    <%
    if(session.getAttribute("user") == null)
    {
    %>
        <h3>Welcome Guest!</h3>
        <a href="/login">Login</a> | <a href="/register">Register</a>
    <%    
    }
    else 
    {
    %>
        <h3>Welcome ${user.username}!</h3>
        <form action="/logout" method="post">
            <input type="submit" value="Logout"/>
        </form>
    <%    
    }  
    %>

</body>
</html>