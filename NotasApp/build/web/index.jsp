<%@page import="java.sql.*"%>
<%@page import="database.DataBaseHelper"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Lista de Estudiantes</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-5">
            <h2 class="text-center mb-4">Lista de Estudiantes</h2>
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>Cédula</th>
                            <th>Nombre</th>
                            <th>Nota</th>
                            <th>Estado</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            DataBaseHelper db = new DataBaseHelper();
                            ResultSet resultset = db.getEstudiantes();

                            while (resultset.next()) {
                                String cedula = resultset.getString("cedula");
                                String nombre = resultset.getString("nombre");
                                String nota = resultset.getString("nota");
                                String estado = resultset.getString("estado");

                                String estadoColor = "";
                                if (estado != null) {
                                    switch (estado) {
                                        case "Aprobado":
                                            estadoColor = "background-color: rgba(0, 255, 0, 0.2);";
                                            break;
                                        case "Aplazado":
                                            estadoColor = "background-color: rgba(255, 255, 0, 0.3);";
                                            break;
                                        case "Reprobado":
                                            estadoColor = "background-color: rgba(255, 0, 0, 0.3);";
                                            break;
                                        default:
                                            estadoColor = "background-color: rgba(200, 200, 200, 0.3);";
                                            break;
                                    }
                                }
                        %>
                        <tr>
                            <td><%= cedula%></td>
                            <td><%= nombre%></td>
                            <td>
                                <form action="ActualizarNota.jsp" onsubmit="return validarNota()">
                                    <div class="input-group">
                                        <input type="hidden" name="cedula" value="<%= cedula%>">
                                        <input type="number" name="nota" class="form-control" placeholder="Ingrese una nota" value="<%= nota != null ? nota : ""%>">
                                        <button type="submit" class="btn btn-primary">Añadir</button>
                                    </div>
                                </form>

                                <script>
                                    function validarNota() {
                                        let nota = document.querySelector('input[name="nota"]').value;
                                        if (nota < 0 || nota > 100) {
                                            alert("La nota debe estar entre 0 y 100.");
                                            return false;  
                                        }
                                        return true;  
                                    }
                                </script>
                            </td>
                            <td style="<%= estadoColor%>"><%= estado != null ? estado : "Sin estado"%></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
