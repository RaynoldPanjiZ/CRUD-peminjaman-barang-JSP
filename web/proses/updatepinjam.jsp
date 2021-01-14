<%-- 
    Document   : updatepinjam
    Created on : Des 14, 2020, 12:15:23 PM
    Author     : Raynold Panji
--%>

<%@page import="function.pinjam"%>
<jsp:useBean id="u" class="function.fpinjam"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
    int i = pinjam.update(u);
    
    String alert, msg;
    if(i>0){  
        alert = "alert-success";
        msg = "Update Data Berhasil !";
    }else{  
        alert = "alert-danger";
        msg = "Update Data Gagal !";  
    }  

    String contextpath = request.getContextPath() + "/halaman/menu.jsp?folder="+session.getAttribute("level")+"&file=peminjaman.jsp";
    response.sendRedirect(contextpath + "&alert=" + alert + "&message=" + msg); 
%>

