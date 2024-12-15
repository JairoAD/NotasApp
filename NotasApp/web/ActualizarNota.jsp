<%@page import="database.DataBaseHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
        DataBaseHelper dt = new DataBaseHelper();
        String cedula = request.getParameter("cedula");
        int nota = Integer.parseInt(request.getParameter("nota"));

        if (dt.setNota(cedula, nota)) {
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("index.jsp?error=Failed to register the event.");
        }
    
%>
