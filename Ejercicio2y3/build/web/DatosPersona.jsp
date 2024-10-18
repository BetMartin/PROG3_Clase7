<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="Persistencia.HibernetConfig"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="Modelo.Persona" %>
<%@ page import="Controllers.Gestor" %>


<html>
<head>
    <title>Lista de Personas</title>
    <link rel="stylesheet" href="estiloTabla2.css"/>
</head>
<body>
    <h2>Lista de Personas</h2>
    <table>
        <tr>
            <th>DNI</th>
            <th>Nombre</th>
            <th>Domicilio</th>
        </tr>
        <%
            Gestor gestor = new Gestor();
            List<Persona> personas = gestor.listar(Persona.class);
            for (Persona persona : personas) {
        %>
        <tr>
            <td><%= persona.getDni() %></td>
            <td><%= persona.getNombre() %></td>
            <td><%= persona.getDomicilio() %></td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>