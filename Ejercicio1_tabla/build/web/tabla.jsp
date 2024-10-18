<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Tabla</title>
        <link rel="stylesheet" href="estiloTabla1.css"/>
    </head>
    <body>
        <h1>Tabla:</h1><br>
        <div class = container>
            
            <table>
                <%
                    String filaStr = request.getParameter("filas");
                    String columnaStr = request.getParameter("columnas");

                    if(filaStr!=null && columnaStr!=null){
                        int fila=Integer.parseInt(filaStr);
                        int columna=Integer.parseInt(columnaStr);

                        for(int i = 1; i<fila+1; i++){
                            out.println("<tr>");
                            for(int j=1; j<columna+1;j++){
                                out.println("<td>"+i+"."+j+"</td>");
                            }
                            out.println("</tr>");
                        }
                    }
                %>
            </table>
        </div>
    </body>
</html>
