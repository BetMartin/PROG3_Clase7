<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="estilo2.css">
        <title>Formulario</title>
    </head>
    <body>
        <div class="container">
        <h2>Formulario para Cargar Persona</h2>
        <form action="guardarPersona.jsp" method="POST">
            <label for="dni">DNI:</label>
            <input type="text" id="dni" name="dni" required><br><br>

            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required><br><br>

            <label for="domicilio">Domicilio:</label>
            <input type="text" id="domicilio" name="domicilio" required><br><br>

            <button type="submit">Guardar</button>
        </form>
        </div>
    </body>
</html>