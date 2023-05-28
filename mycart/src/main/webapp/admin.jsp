<%-- 
    Document   : admin
    Created on : 15-Mar-2023, 12:58:18 pm
    Author     : karun
--%>

<%@page import="java.util.Map"%>
<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%--For Authentication purpose--%>
<%@page import = "com.learn.mycart.entities.User" %>
<%
    User user = (User) session.getAttribute("current-user");

    if (user == null) {

        session.setAttribute("message", "Yot are not logged in...!");
        response.sendRedirect("normal.jsp");
        return;

    } else {

        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "Yot are not admin...!");
            response.sendRedirect("login.jsp");
            return;
        }
    }


%>


<%     //This is to get all categories dynamically
    CategoryDao cdao = new CategoryDao(FactoryProvider.getfactory());
    List<Category> list = cdao.getCategories();
    
    //getting count
    Map<String, Long> m = Helper.getCounts(FactoryProvider.getfactory());
    

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>

        <%@include file = "components/common_css_js.jsp" %>


    </head>
    <body>      

        <%@include file = "components/navbar.jsp" %>
        <script type="text/javascript" src="js/script.js">



        </script>
        <br><br>

        <!--message component-->
        <div class="container-fluid mt-3">
            <%@include file="components/message.jsp" %>

        </div>

        <div class = "admin container">

            <div class = "row mt-3">

                <!--                first col-->
                <div class="col-md-4">

                    <div class = "card">

                        <div class = "card-body text-center">

                            <div class="container">
                                <img style = "max-width: 100px;" class ="img-fluid" src = "img/seo-and-web.png" alt="user_image">
                            </div>

                            <h1><%= m.get("userCount") %></h1>
                            <h2 class = "text-uppercase text-muted">Users</h2>

                        </div>


                    </div>

                </div>


                <!--                second col-->
                <div class="col-md-4">

                    <div class = "card">

                        <div class = "card-body text-center">

                            <div class="container">
                                <img style = "max-width: 100px;" class ="img-fluid" src = "img/list.png" alt="user_image">
                            </div>

                            <h1><%= list.size()%></h1>
                            <h2 class = "text-uppercase text-muted">Categories</h2>

                        </div>


                    </div>

                </div>


                <!--                third col-->
                <div class="col-md-4">

                    <div class = "card">

                        <div class = "card-body text-center">

                            <div class="container">
                                <img style = "max-width: 100px;" class ="img-fluid" src = "img/product.png" alt="user_image">
                            </div>

                            <h1><%= m.get("productCount") %></h1>
                            <h2 class = "text-uppercase text-muted">Products</h2>

                        </div>


                    </div>

                </div>

            </div>



            <!--            Second row-->
            <div class = "row mt-3">

                <!--            2nd row: first col-->
                <div class = "col-md-6">

                    <div class = "card" data-toggle = "modal" data-target = "#add-category-modal">

                        <div class = "card-body text-center">

                            <div class="container">
                                <img style = "max-width: 100px;" class ="img-fluid" src = "img/keys.png" alt="user_image">
                            </div>

                            <p class = "mt-3">Click here to add new category</p>
                            <h2 class = "text-uppercase text-muted">Add Category</h2>

                        </div>


                    </div>

                </div>


                <!--            2nd row: second col-->
                <div class = "col-md-6">

                    <div class = "card" data-toggle = "modal" data-target = "#add-product-modal">

                        <div class = "card-body text-center">

                            <div class="container">
                                <img style = "max-width: 100px;" class ="img-fluid" src = "img/plus.png" alt="user_image">
                            </div>

                            <p class = "mt-3">Click here to add new product</p>
                            <h2 class = "text-uppercase text-muted">Add Products</h2>

                        </div>


                    </div>

                </div>

            </div>

        </div>



        <!--        add category modal-->
        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">


                        <form action="ProductOperationServlet" method = "post">

                            <input type ="hidden" name ="operation" value ="addcategory" >

                            <div class="form-group"><br><br>
                                <input type = "text" class = "form-control" name = "catTitle" placeholder="Enter category Title" required />

                            </div>

                            <div class="form-group">
                                <textarea style = "height: 200px;" class = "form-control" name = "catDescription" placeholder="Enter category Desc" required ></textarea>

                            </div>


                            <div class="container text-center">
                                <button class = "btn btn-success ">Add Category</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>


                        </form>



                    </div>

                </div>
            </div>
        </div>

        <!--        End category modal-->





        <!--        add Product modal-->


        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Product details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">


                        <form action = "ProductOperationServlet" method = "post" enctype="multipart/form-data">


                            <input type ="hidden" name ="operation" value ="addproduct" >


                            <div class="form-group"><br><br>
                                <input type = "text" class = "form-control" name = "pName" placeholder="Enter Product name" required />

                            </div>



                            <div class="form-group">
                                <textarea style = "height: 200px;" class = "form-control" name = "pDesc" placeholder="Enter Product Description" required ></textarea>

                            </div>



                            <div class="form-group">
                                <input type = "number" class = "form-control" name = "pPrice" placeholder="Enter Product price" required />

                            </div>



                            <div class="form-group">
                                <input type = "number" class = "form-control" name = "pDiscount" placeholder="Enter Discount on Product" required />

                            </div>



                            <div class="form-group">
                                <input type = "number" class = "form-control" name = "pQuantity" placeholder="Enter Quantity of product" required />

                            </div>



                            <!--product category-->




                            <div class="form-group">
                                <select  name = "catId" class="form-control"  >

                                    <%
                                        for (Category c : list) {
                                    %>

                                    <option value="<%= c.getCategoryId()%>" > <%= c.getCategoryTitle()%> </option>

                                    <%
                                        }
                                    %>

                                </select>
                            </div>


                            <!--product file-->
                            <div class="form-group">
                                <label for="pPic">Select Picture of product</label><br>
                                <input type="file" id = "pPic" name="pPic" required />
                            </div>


                            <div class="container text-center">
                                <button class = "btn btn-success ">Add Product</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>


                        </form>


                    </div>

                </div>
            </div>
        </div>

        <!--        End Product modal-->

        <%@include file="components/common_modals.jsp" %>

    </body>
</html>

