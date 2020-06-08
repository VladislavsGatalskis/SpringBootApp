<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Java WebApp - Logout</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <h3>Logout</h3>
    <form name="fakeLogout" action="logout" method="POST">
        <input type="submit" value="Logout"><br>
    </form>

    <script type="text/javascript">
        $(document).ready(function() {
            document.fakeLogout.submit();
        });
    </script>

</body>
</html>