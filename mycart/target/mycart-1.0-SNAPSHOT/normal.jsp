<%-- 
    Document   : normal
    Created on : 15-Mar-2023, 12:59:33 pm
    Author     : karun
--%>

<%@page import = "com.learn.mycart.entities.User" %>
<%
    User user = (User) session.getAttribute("current-user");
    
    if (user == null) {
    
        session.setAttribute("message", "Yot are not logged in...!");
        response.sendRedirect("login.jsp");
        return;
        
    } else {
    
        if (user.getUserType().equals("admin")) {
            session.setAttribute("message", "Yot are not normal user...!");
            response.sendRedirect("login.jsp");
            return;
        }
        
        if (user.getUserType().equals("normal")) {
            response.sendRedirect("index.jsp");
            return;
        }
    }


%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Normal Panel</title>
        <%@include file = "components/common_css_js.jsp" %>
    </head>
    <body>
        
        <%@include file = "components/navbar.jsp" %>
        <br><br>
        <script type="text/javascript" src="js/script.js">


           
        </script>
        
        <%@include file="components/common_modals.jsp" %>
        
    </body>
</html>
