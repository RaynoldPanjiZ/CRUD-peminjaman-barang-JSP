<%-- 
    Document   : inputdatabarang
    Created on : Des 14, 2020, 11:37:28 PM
    Author     : Raynold Panji
--%>
<title>INPUT BARANG</title>

<%@page import="function.barang,function.fbarang"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% int id = barang.idGenerator(); %>
              

<c:choose>
    <c:when test="${level=='admin'}">        
        <div class="container my-4">    
            <h2>INPUT DATA BARANG</h2>        
            <hr class="my-4">
            <form action="${pageContext.request.contextPath}/proses/simpanbarang.jsp" method="post">
            <h4 class="my-5 h2">Detail Barang</h4>
            <div class="border border-danger p-4">
              <div class="form-group w-25">
                <label for="example1">Kode Barang</label>
                <input type="text" class="form-control" id="example1" name="idbarang" readonly value="<%=id%>" required>
              </div>

              <div class="form-group w-25">
                <label for="example2">Nama Barang</label>
                <input type="text" class="form-control" id="example2" name="namabarang" required>
              </div>

              <div class="form-group w-25">
                <label for="example3">Kondisi Barang</label>
                <select name="kondisi" class="form-control" id="example3" required>
                    <option value="" disabled selected>-- Pilih Kondisi Barang --</option>
                    <option>Baik</option>
                    <option>Rusak</option>
                </select>
              </div>

              <div class="form-group w-50">
                <label for="example4">Keterangan Barang</label>
                <textarea class="form-control" id="example4" name="keterangan" required></textarea>
              </div>

              <div class="form-group w-75">
                <label for="example5">Jumlah Barang</label>
                <input type="number" class="form-control" id="example4" name="jumlah" required>
              </div>

              <div class="form-group w-75">
                <label for="example5">Jenis Barang</label>
                <input type="text" class="form-control" id="example4" name="jenis" required>
              </div>
            </div>
              <!-- Grid row -->
              <input type="submit" class="btn btn-primary btn-md"name="simpan" value="Simpan" onclick="return confirm('Apakah Ingin Menyimpan data?')">      
            </form>
            <!-- Extended material form grid -->
        </div>
    </c:when> 
    <c:otherwise>
        <div class="alert alert-danger">
            <strong>Permission Error!</strong> Akses Ditolak.
        </div>
    </c:otherwise>    
</c:choose>
        

<%@include file="footer.jsp" %>