<%-- 
    Document   : deletedatabarang
    Created on : Des 14, 2020, 11:37:28 PM
    Author     : Raynold Panji
--%>

<%@page import="function.barang,function.fbarang"%>
<%
    String id = request.getParameter("id_barang");
    fbarang u = barang.getRecordById(id);

    int i=barang.delete(u);
    String alert, msg;
    if(i>0){  
        alert = "alert-success";
        msg = "Delete Data Berhasil !";
    }else{  
        alert = "alert-danger";
        msg = "Delete Data Gagal !";  
    }    

    String contextpath = request.getContextPath() + "/halaman/menu.jsp?folder="+session.getAttribute("level")+"&file=databarang.jsp";
    response.sendRedirect(contextpath + "&alert=" + alert + "&message=" + msg); 
%>
