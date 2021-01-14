<%-- 
    Document   : simpanbarang
    Created on : Des 14, 2020, 11:47:28 PM
    Author     : Raynold Panji
--%>

<%@page import="function.barang"%>  
<jsp:useBean id="u" class="function.fbarang"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
  
<%  
    int i=barang.save(u); 
    String alert,msg;
    if(i>0){  
        alert = "alert-success";
        msg = "Input Data Berhasil !";
    }else{  
        alert = "alert-danger";  
        msg = "Input Data Gagal !";  
    } 

    String contextpath = request.getContextPath() + "/halaman/menu.jsp?folder="+session.getAttribute("level")+"&file=databarang.jsp";
    response.sendRedirect(contextpath + "&alert=" + alert + "&message=" + msg); 
%> 

<%--<jsp:include page="/menu.jsp?folder=halaman&file=buku.jsp"></jsp:include>--%>


