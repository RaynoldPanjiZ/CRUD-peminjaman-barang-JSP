<%-- 
    Document   : simpanpinjam
    Created on : Des 14, 2020, 11:57:43 PM
    Author     : Raynold Panji
--%>

<%@page import="function.pinjam"%>  
<jsp:useBean id="u" class="function.fpinjam"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
  
<%  
    int i=pinjam.save(u); 
    String alert,msg;
    if(i>0){  
        alert = "alert-success";
        msg = "Input Data Berhasil !";
    }else{  
        alert = "alert-danger";  
        msg = "Input Data Gagal !";  
    } 

    String contextpath = request.getContextPath() + "/halaman/menu.jsp?folder="+session.getAttribute("level")+"&file=peminjaman.jsp";
    response.sendRedirect(contextpath + "&alert=" + alert + "&message=" + msg); 
%> 

<%--<jsp:include page="menu.jsp?folder=halaman&file=peminjaman.jsp"></jsp:include>--%>
