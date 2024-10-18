<%@page import="Persistencia.HibernetConfig, org.hibernate.Transaction, org.hibernate.Session, java.sql.*, java.io.*, Modelo.Persona, Controllers.Gestor" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<!DOCTYPE html>
<html>
<head>
    <title>Guardar Persona</title>
</head>
    <body>
        <h2>Guardar</h2>
        <jsp:useBean id="personaBean" class="Modelo.Persona" scope="session" />
        <%  
        String dni = request.getParameter("dni");
        String nombre = request.getParameter("nombre");
        String domicilio = request.getParameter("domicilio");

        try {
            if (dni != null && nombre != null && domicilio != null) {
                int dniNumber = Integer.parseInt(dni);

                personaBean.setDni(dniNumber);
                personaBean.setNombre(nombre);
                personaBean.setDomicilio(domicilio);


                Persona personaIngresada = new Persona(dniNumber, nombre, domicilio);
                Gestor gestor = new Gestor();
                gestor.guardar(personaIngresada);
                out.println("Persona guardada correctamente.");
            } else {
                out.println("<p>Error: Todos los campos son requeridos.</p>");
            }  
        }catch (Exception e) {
            out.println("<p>Error al guardar la persona: " + e.getMessage() + "</p>");
            e.printStackTrace();
        }
        %>
        <br>
        <a href="index.jsp">Volver al formulario</a><br>
        <a href="DatosPersona.jsp">Ver Datos Cargados</a>
    </body>
</html>