<%-- 
    Document   : checkout
    Created on : 21-Apr-2023, 6:34:16 am
    Author     : karun
--%>


<%
    User user = (User) session.getAttribute("current-user");

    if (user == null) {

        session.setAttribute("message", "Yot are not logged in !! Login first to access checkout page");
        response.sendRedirect("login.jsp");
        return;

    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>checkout</title>
        <%@include file = "components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file = "components/navbar.jsp" %>
        <script type="text/javascript" src="js/script.js">

        </script>
        <br><br><br>

        <div class="container">

            <div class="row">

                <!--card data-->
                <div class="col-md-6 mt-5">
                    <div class="card">

                        <div class="card-body">


                            <h3 class="text-center mb-5">Your selected items </h3>
                            <div class="cart-body">

                            </div>
                        </div>

                    </div>
                </div>


                <!--form details-->
                <div class="col-md-6 mt-5">


                    <div class="card">

                        <div class="card-body">


                            <h3 class="text-center mb-5">Your details for order </h3>

                            <form action="#!">

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" class="form-control" id="inputemail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>

                                <div class="form-group">
                                    <label for="name">Your Good Name for Shipping</label>
                                    <input type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name">
                                </div>
                                
                                <div class="form-group">
                                    <label for="phone1">Your Contact</label>
                                    <input type="text" class="form-control" id="phone1" aria-describedby="emailHelp" placeholder="Enter Contact no.">
                                </div>

                                <div class="form-group">
                                    <label for="textarea1">Your Shipping Address</label>
                                    <textarea  class="form-control" id="textarea1" placeholder="Enter your address" rows="3"></textarea>

                                </div>

                                

                                <!--This button is to set existing values-->
                                <div class="container text-center">
                                    <button type = "submit" onclick="getValue('<%= user.getUserEmail()%>', '<%= user.getUserName()%>', '<%= user.getUserPhone()%>', '<%= user.getUserAddress()%>')" class="btn btn-secondary m-2">Get Existing Value</button>
                                </div>


                                <div class="container text-center">

                                    <button class="btn btn-outline-success"> Order now </button>
                                    <button class="btn btn-outline-primary"> Continue Shopping </button>

                                </div>

                            </form>

                        </div>

                    </div>

                </div>

            </div>

        </div>
        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
