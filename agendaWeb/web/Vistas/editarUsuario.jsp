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
        <title>Actualizar usuario</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logged") == "0") {
                RequestDispatcher req = request.getRequestDispatcher("UsuariosServlet?accion=inicio");
                req.forward(request, response);
            }
        %>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#">Navbar</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarTogglerDemo02">

                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <%
                        if ((Integer) sesion.getAttribute("logged") == 1 && (Integer) sesion.getAttribute("tipoUsuario") == 0) {
                    %>
                    <li class="nav-item">
                        <a class="nav-link" href="UsuariosServlet?accion=portalAdmin">Ver usuarios</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="UsuariosServlet?accion=add">Agregar usuarios<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <%}%>
                        <a class="nav-link" href="ContactosServlet?accion=portalUsuario">Ver contactos</a>
                    </li>
                    <li class="nav-item active">
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
            <%
                int id = Integer.parseInt((String) request.getAttribute("idusu"));
                UsuariosService usu = new UsuariosService();
                Usuarios u = usu.listarID(id);

                System.out.println(u);
            %>
            <form action="UsuariosServlet">
                <input hidden type="text" name="txtid" readonly="" value = "<%=u.getID()%>">
                <div class="form-group">
                    <label for="exampleInputEmail1">Nombres</label>
                    <input type="text" name="nombres" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=u.getNOMBRES()%>" placeholder="Ingrese su(s) nombre(s)">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Apellidos</label>
                    <input type="text" name="apellidos" class="form-control" id="exampleInputPassword1" value="<%=u.getAPELLIDOS()%>" placeholder="Ingrese su(s) apellido(s)">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Email</label>
                    <input type="email" name="email" class="form-control" id="exampleInputEmail1" value="<%=u.getEMAIL()%>" aria-describedby="emailHelp" placeholder="Ingrese su Email">
                </div>

                <%
                    if ((Integer) sesion.getAttribute("tipoUsuario") == 0) {
                %>
                <div class="form-group">

                    <input type="password" hidden name="password" class="form-control" id="exampleInputPassword1" value="<%=u.getPASSWORD()%>" placeholder="Ingrese su contraseña">
                </div>
                <%} else {%>
                <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <input type="password" name="password" class="form-control" id="exampleInputPassword1" value="<%=u.getPASSWORD()%>" placeholder="Ingrese su contraseña">
                </div>
                
                <%}%>
                <input type="text" hidden name="tipoUsuario" readonly="" value = "<%=u.getTIPOUSUARIO()%>">
                <input type="submit" name="accion" value="Actualizar" class="btn btn-primary"></button>
            </form>
        </div>
    </body>
</html>
