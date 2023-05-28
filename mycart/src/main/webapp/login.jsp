

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login - MyCart</title>
        <%@include file = "components/common_css_js.jsp" %>
        <%@include file = "components/common_css_js.jsp" %>

    </head>
    <body class = "bg-img">

        <%@include file = "components/navbar.jsp" %>
         <script type="text/javascript" src="js/script.js">


           
        </script>
        

        <div class ="container mt-3">
            <div class ="row">
                <div class ="col-md-6 offset-md-3 mt-5">

                    <div class="card mt-20">

                        <div class ="card-header bg-dark text-white">

                            <h3>Login here</h3>

                        </div>

                        <div class = "card-body">
                            <%@include file = "components/message.jsp" %>

                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name ="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name = "password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                
                                <a href="register.jsp" class="text-center d-block mb-3" >If not registered, Click here</a>
                         
                                <div class="container text-center">
                                    
                                   <button type="submit" class="btn bg-success">Submit</button>
                                   <button type="reset" class="btn bg-warning">Reset</button>
                                </div>
                                
                             </form>

                        </div>

                        <div class="card-footer">

                        </div>

                    </div>

                </div>
            </div>
        </div>
                             

    </body>
</html>
