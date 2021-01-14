<%-- 
    Document   : dasboard
    Created on : Des 14, 2020, 11:37:28 PM
    Author     : Raynold Panji
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose>
    <c:when test="${level=='pegawai'}">
        <center><h1>SELAMAT DATANG DI SISTEM PEMINJAMAN BARANG</h1></center>
        <br> <br>
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                  <div class="card" style="width: 46rem;">
                    <div class="card-body">
                      <h4 class="card-title">Pinjam barang</h4>
                      <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                      <a href="menu.jsp?folder=pegawai&file=barangpinjam.jsp" class="btn btn-primary">Input Pinjam</a>
                    </div>
                  </div>
                </div>
                <div class="col-sm-6">
                  <div class="card" style="width: 46rem;">
                    <div class="card-body">
                      <h4 class="card-title">Lihat Peminjaman</h4>
                      <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                      <a href="menu.jsp?folder=pegawai&file=peminjaman.jsp" class="btn btn-primary">View Pinjam</a>
                    </div>
                  </div>
                </div>
            </div>
        </div>
    </c:when> 
    <c:otherwise>
        <div class="alert alert-danger">
            <strong>Permission Error!</strong> Akses Ditolak.
        </div>
    </c:otherwise>    
</c:choose>

    <%@include file="footer.jsp" %>
