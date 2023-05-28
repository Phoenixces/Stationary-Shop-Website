<%-- 
    Document   : register
    Created on : 08-Jan-2023, 8:52:15 am
    Author     : karun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        

        <%@include file = "components/common_css_js.jsp" %>

    </head>
    <body class = "bg-img">

        <%@include file = "components/navbar.jsp" %>
         <script type="text/javascript" src="js/script.js">


           
        </script>
        <div class ="container-fluid">
            
        <div class="row mt-5">
            <div class="col-md-4 offset-md-4">
               
                
                <%@include file = "components/message.jsp" %>

                <div class = "card-body container" >

                    <h3 class="text-center my-3 cssanimation sequence bounceInTop "  style="  font-weight: bold">  Register here...!</h3>
                    <div class="register-logo cssanimation sequence bounceInTop"></div>

                    <form action = "RegisterServlet" method="post" style = "background-color: rgb(255,255,255);color: black; margin-top: 10px; padding:  10px; box-sizing: border-box;">

                        <div class="container cssanimation sequence bounceInTop">
                            

                            <div class="form-group">
                                <label for="name" >User Name</label>
                                <input name = "user_name" type="text" class="form-control" id="name" placeholder="Enter here">
                            </div>

                            <div class="form-group">
                                <label for="email">User Email</label>
                                <input name = "user_email" type="email" class="form-control" id="email"  placeholder="example@test.com">
                            </div>

                            <div class="form-group">
                                <label for="password">User password</label>
                                <input name = "user_password" type="password" class="form-control" id="password" placeholder="Min 6 charaters long">
                            </div>

                            <div class="form-group">
                                <label for="phone">User phone</label>
                                <input name = "user_phone" type="number" class="form-control" id="phone"  placeholder="Enter here">
                            </div>

                            <div class="form-group">
                                <label for="phone">User Address</label>
                                <textarea name = "user_address" style="rows: 3" class="form-control"  placeholder="Enter here"></textarea>
                            </div>

                            <div class = "container text-center">
                                <button class = "btn  mb-2 bg-success text-white  mr-2"  style = "font-weight: bolder;">Register</button>
                                <button class = "btn  mb-2 bg-warning text-dark  ml-2" style = "font-weight: bolder;">Reset</button>       
                            </div>

                    </form>
                </div>

            </div>
        </div>
            
        </div>
    </body>
</html>
