<%
String message = (String)session.getAttribute("message");
if(message != null){

%>

<div class="alert alert-success alert-dismissible fade show mt-3 pt-2 pb-2 font-italic border border-success text-center" role="alert">
    <strong><%= message %></strong> 
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
   
<%

    }
    session.removeAttribute("message");
%>