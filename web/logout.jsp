<%-- 
    Document   : logout
    Created on : Dec 30, 2020, 4:39:03 AM
    Author     : Raynold Panji
--%>

<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <!-- Menghapus semua session -->
        <%   
            session.invalidate();
        %>
            <jsp:forward page="index.jsp"/>
    </body>
</html>
