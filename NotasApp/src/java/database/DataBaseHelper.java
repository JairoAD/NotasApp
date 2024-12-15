package database;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DataBaseHelper {

    Connection conn;

    public void Close() {
        try {
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DataBaseHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public DataBaseHelper() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/notasDB?useUnicode=true&characterEncoding=UTF-8", "root", "Admin$1234");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DataBaseHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet getEstudiantes() throws SQLException {
        Statement statement = conn.createStatement();
        String sql = "SELECT "
                + "e.cedula, "
                + "e.nombre, "
                + "e.nota,"
                + "e.estado "
                + "FROM notasDB.estudiantes e ";

        ResultSet resultset = statement.executeQuery(sql);
        return resultset;
    }

    
    public boolean setNota(String cedula, int nota) throws SQLException {
        Statement statement = conn.createStatement();
        // SQL para actualizar tanto la nota como el estado
        String sql = "UPDATE estudiantes SET nota = " + nota + ", estado = CASE "
                + "WHEN nota < 65 THEN 'Reprobado' "
                + "WHEN nota >= 65 AND nota < 70 THEN 'Aplazado' "
                + "WHEN nota >= 70 THEN 'Aprobado' "
                + "END "
                + "WHERE cedula = '" + cedula + "'";

        int rowsUpdated = statement.executeUpdate(sql);
        if (rowsUpdated > 0) {
            System.out.println("Nota y estado actualizados correctamente para la cédula: " + cedula);
            return true;
        } else {
            return false;
        }
    }

}
