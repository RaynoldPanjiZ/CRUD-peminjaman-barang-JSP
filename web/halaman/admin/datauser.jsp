<title>DATA USER</title>

<%@page import="function.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:choose>
    <c:when test="${level=='admin'}">        
        <%
            List<fuser> list = user.getAllRecords();
            request.setAttribute("list", list);
        %>
        <div class="container">
            <h1>DATA USER</h1>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>Kode User</th>
                    <th>Nama User</th>
                    <th>Username</th>
                    <th>level</th>
                    <th><center>Action</center></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="u">
                    <tr>
                        <td>${u.getIduser()}</td>
                        <td>${u.getNamauser()}</td>
                        <td>${u.getUsername()}</td>
                        <td style="width: 200px">${u.getLevel()}</td>
                        <td style="width: 150px">
                            <a href="menu.jsp?folder=admin&file=editdatauser.jsp&id_user=${u.getIduser()}"><button class="btn btn-warning">Edit</button></a>
                            <c:if test="${u.getIduser()!=iduser}">
                                <a href="${pageContext.request.contextPath}/proses/deletedatauser.jsp?id_user=${u.getIduser()}"><button class="btn btn-danger" onclick="return confirm('Are you sure you want to continue')">Delete</button></a>
                            </c:if>
                        </td>
                        <c:if test="${u.getIduser()==iduser}">
                            <td><img src="${pageContext.request.contextPath}/img/check.png" width="20px" title="User aktif / anda"></td>
                        </c:if>
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
            }} %>
            
            <br> <a href="menu.jsp?folder=admin&file=inputdatauser.jsp"><button class="btn btn-info">Input User</button></a>
        </div>
    </c:when> 
    <c:otherwise>
        <div class="alert alert-danger">
            <strong>Permission Error!</strong> Akses Ditolak.
        </div>
    </c:otherwise>    
</c:choose>
                
<%@include file="footer.jsp" %>