<%-- 
    Document   : dasboard
    Created on : Des 14, 2020, 11:37:28 PM
    Author     : Raynold Panji
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose>
    <c:when test="${level=='admin'}">
        <center><h3>SELAMAT DATANG DI SISTEM PEMINJAMAN BARANG</h3></center>
        <br> <br>
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                  <div class="card" style="width: 32rem;">
                    <div class="card-body">
                      <h4 class="card-title">Data Barang</h4>
                      <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                      <a href="menu.jsp?folder=admin&file=databarang.jsp" class="btn btn-primary">View Data</a>
                    </div>
                  </div>
                </div>
                <div class="col-sm-4">
                  <div class="card" style="width: 32rem;">
                    <div class="card-body">
                      <h4 class="card-title">Data User</h4>
                      <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                      <a href="menu.jsp?folder=admin&file=datauser.jsp" class="btn btn-primary">View Data</a>
                    </div>
                  </div>
                </div>
                <div class="col-sm-4">
                  <div class="card" style="width: 32rem;">
                    <div class="card-body">
                      <h4 class="card-title">Data Peminjaman</h4>
                      <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                      <a href="menu.jsp?folder=admin&file=peminjaman.jsp" class="btn btn-primary">View Data</a>
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
