<%-- 
    Document   : databarang
    Created on : Des 15, 2020, 12:37:28 PM
    Author     : Raynold Panji
--%>


<title>DATA BARANG</title>       

<%@page import="function.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    List<fbarang> list = barang.getAllRecords();
    request.setAttribute("list", list);
%>
        
        
<c:choose>
    <c:when test="${level=='pegawai'}">        
        <div class="container">
        <h1>DATA BARANG</h1>
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Kode Barang</th>
                <th>Nama Barang</th>
                <th>Kondisi</th>
                <th>Keterangan</th>
                <th>Jumlah</th>
                <th>Jenis</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="u">
                <tr>
                    <td>${u.getIdbarang()}</td>
                    <td>${u.getNamabarang()}</td>
                    <td>${u.getKondisi()}</td>
                    <td>${u.getKeterangan()}</td>
                    <td>${u.getJumlah()}</td>
                    <td>${u.getJenis()}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <br>
        </div>
    </c:when> 
    <c:otherwise>
        <div class="alert alert-danger">
            <strong>Permission Error!</strong> Akses Ditolak.
        </div>
    </c:otherwise>    
</c:choose>
        

        
<%@include file="footer.jsp" %>
    
