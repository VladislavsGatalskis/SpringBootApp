<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Java WebApp - Register</title>
    <style>
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
                <h2>Register</h2>
                <span id="other-reg-err" style="color:red;font-size:11px">${error}</span>
                <%-- <span id="reg-err" style="color:red;font-size:11px"></span> --%>
                <form action="register" method="POST" onsubmit="return validator()">
                    <div>
                        <label style="padding-left:45px">Username:</label>
                        <input id="un" type="text" name="username" value="${oldUsername}"><br>
                    </div><br>
                    <div>
                        <label style="padding-left:48px">Password:</label>
                        <input id="pw" type="password" name="password" value="${oldPassword}"><br>
                    </div><br>
                    <div>
                        <label>Repeat password:</label>
                        <input id="rpw"type="password" name="repeatedPassword"><br>
                    </div><br>
                    <input type="submit" value="Register"><br>
                </form>
            </div>
        </div>
    </div>

    <script>

        if(document.getElementById('other-reg-err').innerHTML != "")
        {
            // document.getElementById("other-reg-err").style.color = "black";
            // setTimeout(function(){ document.getElementById("other-reg-err").style.color = "red"; }, 100);
            document.getElementById("form-main-container").style.backgroundColor = "#FFAFAF";
            setTimeout(function(){ document.getElementById("form-main-container").style.backgroundColor = "white"; }, 100);
        }

        // function validator() 
        // {
            // if(document.getElementById('other-reg-err').value != "")
            // {
            //     alert("${error}"); 
            //     document.getElementById("reg-err").style.color = "black";
            //     setTimeout(function(){ document.getElementById("reg-err").style.color = "red"; }, 50);
            // }
            // else
            // {
            //     alert("success!");
            //     document.getElementById("reg-err").style.color = "black";
            // }
        // }

        /// OLD VALIDATOR ///
        // function validator() 
        // {
        //     document.getElementById('reg-err').innerHTML = "";
        //     noErrors = true; // Variable that is needed for knowing if anyerrors occured. 
        //                      // It is helping for situation when there are more than 1 error
        //                      // so every error could be shown by JS validator. 

        //     if(document.getElementById('un').value == "")
        //     {
        //         document.getElementById('reg-err').innerHTML += "ERROR! Username is empty!<br>";
        //         noErrors = false;
        //     }

        //     if(document.getElementById('pw').value == "")
        //     {
        //         document.getElementById('reg-err').innerHTML += "ERROR! Password is empty!<br>";
        //         noErrors = false;
        //     }

        //     if(document.getElementById('pw').value != document.getElementById('rpw').value)
        //     {
        //         document.getElementById('reg-err').innerHTML += "ERROR! Password and repeated password does not match!<br>";
        //         noErrors = false;
        //     }

        //     if(noErrors)
        //     {
        //         document.getElementById("reg-err").style.color = "green";
        //         document.getElementById('reg-err').innerHTML += "Successfully registered!";
        //     }
        //     else
        //     {
        //         document.getElementById("reg-err").style.color = "black";
        //         setTimeout(function(){ document.getElementById("reg-err").style.color = "red"; }, 50);
        //     }

        //     return noErrors;
        // }
        
    </script>
</body>
</html>