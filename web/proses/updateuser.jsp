<%-- 
    Document   : updateuser
    Created on : Des 14, 2020, 12:13:43 PM
    Author     : Raynold Panji
--%>

<%@page import="function.user"%>
<jsp:useBean id="u" class="function.fuser"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<%
    int i = user.update(u);
    
    String alert, msg;
    if(i>0){  
        alert = "alert-success";
        msg = "Update Data Berhasil !";
    }else{  
        alert = "alert-danger";
        msg = "Update Data Gagal !";  
    }  

    String contextpath = request.getContextPath() + "/halaman/menu.jsp?folder="+session.getAttribute("level")+"&file=datauser.jsp";
    response.sendRedirect(contextpath + "&alert=" + alert + "&message=" + msg); 
%>
