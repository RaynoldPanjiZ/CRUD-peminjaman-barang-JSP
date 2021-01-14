<%-- 
    Document   : peminjaman
    Created on : Des 14, 2020, 11:37:28 PM
    Author     : Raynold Panji 
--%>

<title>DATA PEMINJAMAN</title>

<%@page import="function.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    List<fpinjam> list = pinjam.getAllRecords();
    request.setAttribute("list", list);
%>
     

<c:choose>
    <c:when test="${level=='admin'}">        
        <div class="container">
        <h1>DATA PEMINJAMAN</h1>
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Kode Pinjam</th>
                <th>Keterangan Pinjam</th>
                <th>Tanggal Pinjam</th>
                <th>Tanggal Kembali</th>
                <th>Status</th>
                <th>Kode User Operator</th>
                <th>Nama Peminjam</th>
                <th>Kontak Peminjam</th>
                <th>Kontak lainnya</th>
            </tr>    
            </thead>
            <tbody>
            <c:forEach items="${list}" var="u">
            <tr>
                <td>${u.getIdpinjam()}</td>
                <td>${u.getKetpinjam()}</td>
                <td>${u.getTglpinjam()}</td>
                <td>${u.getTglkembali()}</td>
                <td>${u.getStatus()}</td>
                <td>${u.getIduser()}</td>
                <td>${u.getNamapeminjam()}</td>
                <td>${u.getKontak1()}</td>
                <td>${u.getKontak2()}</td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
        </div>
    </c:when> 
    <c:otherwise>
        <div class="alert alert-danger">
            <strong>Permission Error!</strong> Akses Ditolak.
        </div>
    </c:otherwise>    
</c:choose>
        

<%@include file="footer.jsp" %>