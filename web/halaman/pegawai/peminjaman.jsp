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
    <c:when test="${level=='pegawai'}">        
        <div class="container">
        <h1>DATA PEMINJAMAN</h1>
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Kode Pinjam</th>
                <th>Kode Barang</th>
                <th>Nama Barang</th>
                <th>Keterangan Peminjaman</th>
                <th>Tanggal Pinjam</th>
                <th>Tanggal Kembali</th>
                <th>Status</th>
                <th>Nama Peminjam</th>
                <th>Kontak Peminjam 1</th>
                <th>Kontak Peminjam 2</th>
                <th>Kode Operator Pegawai</th>
                <th><center>Action</center></th>
            </tr>    
            </thead>
            <tbody>
            <c:forEach items="${list}" var="u">
            <tr>
                <td>${u.getIdpinjam()}</td>
                <td>${u.getIdbarang()}</td>
                <td>${u.getNamabarang()}</td>
                <td>${u.getKetpinjam()}</td>
                <td>${u.getTglpinjam()}</td>
                <td>${u.getTglkembali()}</td>
                <td>${u.getStatus()}</td>
                <td>${u.getNamapeminjam()}</td>
                <td>${u.getKontak1()}</td>
                <td>${u.getKontak2()}</td>
                <td>${u.getIduser()}</td>
                <td>
                    <!--Kondisi jika status dipinjam/dikembalikan-->
                <c:if test="${u.getStatus()=='Dipinjam'}">
                    <a href="menu.jsp?folder=pegawai&file=barangkembali.jsp&id_pinjam=${u.getIdpinjam()}"><button class="btn btn-success">Input Barang Kembali</button></a>
                </c:if>
                <c:if test="${u.getStatus()!='Dipinjam'}">
                    <button class="btn btn-default" disabled="clicked">Barang Sudah Kembali</button>
                </c:if>
                </td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
        <% if(request.getParameter("alert")!=null) {
                if(request.getParameter("alert").equals("alert-success")) { %>
            <div class="alert alert-success">
                <strong>Success!</strong> <%=request.getParameter("message")%>.
            </div>
            <% } else if(request.getParameter("alert").equals("alert-danger")) { %>
            <div class="alert alert-danger">
                <strong>Danger!</strong> <%=request.getParameter("message")%>.
            </div>
            <% } else {
                out.print("");
            }} 
        %>
        <br><a href="menu.jsp?folder=pegawai&file=barangpinjam.jsp"><button class="btn btn-info">Pinjam Barang</button></a>
        </div>
    </c:when> 
    <c:otherwise>
        <div class="alert alert-danger">
            <strong>Permission Error!</strong> Akses Ditolak.
        </div>
    </c:otherwise>    
</c:choose>
        
<%@include file="footer.jsp" %>