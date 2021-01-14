<%-- 
    Document   : updatebarang
    Created on : Des 14, 2020, 11:57:47 PM
    Author     : Raynold Panji
--%>

<%@page import="function.barang"%>
<jsp:useBean id="u" class="function.fbarang"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<%
    int i = barang.update(u);
//    response.sendRedirect("menu.jsp?folder=halaman&file=buku.jsp");
    
    String alert, msg;
    if(i>0){  
        alert = "alert-success";
        msg = "Update Data Berhasil !";
    }else{  
        alert = "alert-danger";
        msg = "Update Data Gagal !";  
    }  

    String contextpath = request.getContextPath() + "/halaman/menu.jsp?folder="+session.getAttribute("level")+"&file=databarang.jsp";
    response.sendRedirect(contextpath + "&alert=" + alert + "&message=" + msg); 
%>

