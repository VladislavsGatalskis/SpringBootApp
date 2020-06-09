<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Java WebApp - Login</title>
    <style>
        div.form-container {
            max-width:300px;
            margin:auto;
        }

        .container {
            height:95vh;
            position: relative;
            border: 3px solid green;
            background-image: url("https://inspirationfeed.com/wp-content/uploads/2015/04/blurred-background.jpg");
            background-repeat: no-repeat;
            background-size: 100% 100%;
        }

        .center {
            margin: 0;
            position: absolute;
            top: 50%;
            left: 50%;
            -ms-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="center">
            <div id="form-main-container" style="background-color:white;border:1px solid black; border-radius: 25px; padding: 1px 40px 30px 40px">
                <h2>Login</h2>
                <span id="reg-err" style="color:red;font-size:11px">${error}</span>
                <form action="login" method="POST">
                    <div>
                        <label>Username:</label>
                        <input type="text" name="username" value="${oldUsername}"><br>
                    </div><br>
                    <div>
                        <label style="padding-left:3px">Password:</label>
                        <input type="password" name="password" value="${oldPassword}"><br>
                    </div><br>
                    <input type="submit" value="Login"><a href="/register" style="padding-left:10px;">Not signed up yet?</a>
                </form>
            </div>
        </div>
    </div>

    <script>
        if(document.getElementById('reg-err').innerHTML != "")
        {
            document.getElementById("form-main-container").style.backgroundColor = "#FFAFAF";
            setTimeout(function(){ document.getElementById("form-main-container").style.backgroundColor = "white"; }, 100);
        }
    </script>
</body>
</html>