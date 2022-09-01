<%-- 
    Document   : sign_in
    Created on : 23/05/2022, 12:56:52 AM
    Author     : cerna
--%>

<%@page import="java.sql.*"%>
<%@page import="clases.ConexionBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    Connection conn = ConexionBD.conectarBaseDatos();
    Statement st = null;
    ResultSet rs = null;
    String query = "";
    String correo = request.getParameter("correo_in");
    String contrasena = request.getParameter("contrasena_in");
    String rol= "";
    if (correo != null) {
        try {
            st = conn.createStatement();
            query = "SELECT usu_correo,usu_contrasena,id_rol FROM login WHERE usu_correo='" + correo + "'and usu_contrasena='" + contrasena + "'";
            rs = st.executeQuery(query);
            if (rs.next()) {
                rol=rs.getString("rol_nombre");
                
                System.out.println("Entro en el if");
                HttpSession sesion = request.getSession();
                
                sesion.setAttribute("correo", correo);

                /*A manera de prueba se muestran los datos de la sesión
                String nombre_Sesion = (String) sesion.getAttribute("nombre");
                String correo_Sesion = (String) sesion.getAttribute("correo");
                
                System.out.println(nombre_Sesion);
                System.out.println(correo_Sesion);*/
                response.sendRedirect("principal.jsp");
            } else {
                System.out.println("No entró en el if");
            }
        } catch (SQLException exc) {
            // Manejador de errores
            System.out.println(">>>>>>>>>SQLException: " + exc.getMessage());
            System.out.println(">>>>>>>>>SQLState: " + exc.getSQLState());
            System.out.println(">>>>>>>>>VendorError: " + exc.getErrorCode());
        } finally {
            /*
        * Se debe cerrar la conexión si o sí 
        * hay Resultset o un Statement.
             */
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {
                } // ignore
                rs = null;
            }
            if (st != null) {
                try {
                    st.close();
                } catch (SQLException sqlEx) {
                } // ignore

                st = null;
            }
        }
    }

%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.88.1">
        <link rel="icon" href="imagenes/NeoSoft.ico">
        <title>Iniciar Sesión</title>

        <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">



        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/signin.css" rel="stylesheet" type="text/css"/>
        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
        </style>


        <!-- Custom styles for this template -->
        <link href="signin.css" rel="stylesheet">
    </head>
    <body class="text-center">

        <main class="form-signin">
            <div>
                <form name="formulario_1" id="formulario_1" action="sign_in.jsp" method="POST">
                    <img class="mb-4" src="imagenes/Neosoft_chico_sinfondo.png" alt="">
                    <br>
                    <h1 class="h3 mb-3 fw-normal">Por favor, ingrese sus datos</h1>
                    <br>

                    <div class="form-floating">
                        <input type="email" class="form-control" id="correo_in" name="correo_in" placeholder="name@example.com">
                        <label for="correo_in">Correo Electrónico</label>
                    </div>
                    <div class="form-floating">
                        <input type="password" class="form-control" id="contrasena_in" name="contrasena_in" placeholder="Password">
                        <label for="contrasena_in">Contraseña</label>
                    </div>
                    <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
                    <p class="mt-5 mb-3 text-muted">&copy; 2017–2021</p>
                </form>
            </div>
        </main>



    </body>
</html>

