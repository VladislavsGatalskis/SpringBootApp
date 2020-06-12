<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Successfully registered!</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <h1 style="color:green;font-size:180px">SUCCESS</h1>

    <%-- Good way because it doesn't add question mark (?) at the end of the url like it would using form and get method --%>
    <input style="display:none" type="button" id="regSuccess" onclick="location.href='/login'" value="Submit">

    <script type="text/javascript">
        $(document).ready(function() {
            document.getElementById('regSuccess').click();
        });

        // No need for timeout because it still needs time to redirect to fake and then to login page!
        // setTimeout(function(){ $(document).ready(function() {
        //     document.getElementById('regSuccess').click();
        // }); }, 0);
        
    </script>

</body>
</html>