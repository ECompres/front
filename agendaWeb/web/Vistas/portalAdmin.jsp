<%-- 
    Document   : index
    Created on : 19/07/2020, 12:37:35 PM
    Author     : Emmanuel
--%>

<%@page import="ServiciosWeb.Usuarios"%>
<%@page import="Modelos.UsuariosService"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
        %>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#">Navbar</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <li class="nav-item active">
                        <a class="nav-link" href="UsuariosServlet?accion=portalAdmin">Ver usuarios<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="UsuariosServlet?accion=add">Agregar usuarios</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ContactosServlet?accion=portalUsuario">Ver contactos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ContactosServlet?accion=add">Agregar contacto</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="UsuariosServlet?accion=Perfil&id=<%=sesion.getAttribute("id")%>">Ver perfil</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="UsuariosServlet?accion=logOut">Cerrar sesión</a>
                    </li>
            </div>
        </nav>
        <br>
        <div class="container">

            <h3>Bienvenido <%=sesion.getAttribute("nombres")%> </h3>
            <h4>Listado de usuarios </h4>
            <table class="table table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th>Id</th>
                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>Email</th>
                        <th>Tipo de usuario</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>

                    <tr>
                        <%
                            UsuariosService usu = new UsuariosService();
                            List<Usuarios> listaUsuarios = usu.listarUsuarios();
                            int id = (Integer) sesion.getAttribute("id");
                            for (Usuarios u : listaUsuarios) {
                                if (u.getID() != id) {

                        %>
                        <td><%=u.getID()%></td>
                        <td><%=u.getNOMBRES()%></td>
                        <td><%=u.getAPELLIDOS()%></td>
                        <td><%=u.getEMAIL()%></td>
                        <td><%
                            if (u.getTIPOUSUARIO() == 0) {
                            %>Administrador
                            <%} else {%>
                            Usuario
                            <%}%>
                        </td>
                        <td>
                            <a href="UsuariosServlet?accion=Editar&id=<%=u.getID()%>" class="btn btn-warning">Editar</a>
                            <a href="UsuariosServlet?accion=Borrar&id=<%=u.getID()%>" class="btn btn-danger">Borrar</a>
                        </td>
                    </tr>
                    <%}
                        }%>
                </tbody>
            </table>
        </div>
    </body>
</html>
