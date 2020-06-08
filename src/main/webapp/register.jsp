<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Java WebApp - Register</title>
</head>
<body>
    <h3>Register</h3>
    <form action="register" method="POST" onsubmit="return validator()">
        <input type="text" name="username"><br>
        <input id="pw" type="password" name="password"><br>
        <input id="rpw"type="password" name="repeatedPassword"><br>
        <input type="submit"><br>
    </form>

    <script>
        function validator() 
        {
            if(document.getElementById('pw').value == document.getElementById('rpw').value)
            {
                alert("OK");
            }
            else
            {
                alert("error");
                return false;
            }
        }
        
    </script>
</body>
</html>