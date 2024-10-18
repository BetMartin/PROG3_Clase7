
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="estilo1.css"/>
    </head>
    <body>
        <div class="container">
            <h2>Crear Tabla</h2>

            <form action="tabla.jsp">
                <label for="Cantidad de filas:">Número de Filas:</label>
                <input type="text" id="filas" name="filas" required><br><br>
                <label for="Cantidad de columnas:">Número de Columnas:</label>
                <input type="text" id="columnas" name="columnas" required><br><br>
                <button type="submit">Crear Tabla</button>
            </form>
        </div>
    </body>
</html>
