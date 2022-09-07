<%-- 
    Document   : cerrarsesion
    Created on : 1/09/2022, 12:38:49 AM
    Author     : cerna
--%>
<%
    HttpSession sesion = request.getSession();
    sesion.invalidate();
    response.sendRedirect("index.html");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
