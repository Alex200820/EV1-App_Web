
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entity.Plato;
import util.MySqlDBConexion;

public class PlatoModel {

    // Registrar plato
    public int insertaPlato(Plato obj) {
        int salida = -1;
        Connection conn = null;
        PreparedStatement pstm = null;

        try {
            conn = MySqlDBConexion.getConexion();

            String sql = "INSERT INTO plato "
                    + "(nombre, proteinaPlato, idCategoria, tiempoPreparacion, "
                    + "disponibilidad, popularidad, precio) "
                    + "VALUES (?,?,?,?,?,?,?)";

            pstm = conn.prepareStatement(sql);
            pstm.setString(1, obj.getNombre());
            pstm.setString(2, obj.getProteinaPlato());
            pstm.setInt(3, obj.getIdCategoria());
            pstm.setInt(4, obj.getTiempoPreparacion());
            pstm.setString(5, obj.getDisponibilidad());
            pstm.setString(6, obj.getPopularidad());
            pstm.setDouble(7, obj.getPrecio());

            System.out.println("SQL ==> " + pstm);

            salida = pstm.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstm != null) {
                    pstm.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return salida;
    }

    // Listar platos por nombre
    public List<Plato> listaPlatoPorNombre(String nombre) {
        List<Plato> salida = new ArrayList<Plato>();
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;

        try {
            conn = MySqlDBConexion.getConexion();

            String sql = "SELECT idPlato, nombre, proteinaPlato, idCategoria, "
                    + "tiempoPreparacion, disponibilidad, popularidad, precio "
                    + "FROM plato WHERE nombre LIKE ?";

            pstm = conn.prepareStatement(sql);
            pstm.setString(1, "%" + nombre + "%");

            System.out.println("SQL ==> " + pstm);

            rs = pstm.executeQuery();

            while (rs.next()) {
                Plato obj = new Plato();

                obj.setIdPlato(rs.getInt("idPlato"));
                obj.setNombre(rs.getString("nombre"));
                obj.setProteinaPlato(rs.getString("proteinaPlato"));
                obj.setIdCategoria(rs.getInt("idCategoria"));
                obj.setTiempoPreparacion(
                    rs.getInt("tiempoPreparacion")
                );
                obj.setDisponibilidad(
                    rs.getString("disponibilidad")
                );
                obj.setPopularidad(rs.getString("popularidad"));
                obj.setPrecio(rs.getDouble("precio"));

                salida.add(obj);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstm != null) {
                    pstm.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return salida;
    }

    // Actualizar plato
    public int actualizaPlato(Plato obj) {
        int salida = -1;
        Connection conn = null;
        PreparedStatement pstm = null;

        try {
            conn = MySqlDBConexion.getConexion();

            String sql = "UPDATE plato SET nombre=?, proteinaPlato=?, "
                    + "idCategoria=?, tiempoPreparacion=?, disponibilidad=?, "
                    + "popularidad=?, precio=? WHERE idPlato=?";

            pstm = conn.prepareStatement(sql);
            pstm.setString(1, obj.getNombre());
            pstm.setString(2, obj.getProteinaPlato());
            pstm.setInt(3, obj.getIdCategoria());
            pstm.setInt(4, obj.getTiempoPreparacion());
            pstm.setString(5, obj.getDisponibilidad());
            pstm.setString(6, obj.getPopularidad());
            pstm.setDouble(7, obj.getPrecio());
            pstm.setInt(8, obj.getIdPlato());

            System.out.println("SQL ==> " + pstm);

            salida = pstm.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstm != null) {
                    pstm.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return salida;
    }

    // Eliminar plato físicamente
    public int eliminarPlato(int idPlato) {
        int salida = -1;
        Connection conn = null;
        PreparedStatement pstm = null;

        try {
            conn = MySqlDBConexion.getConexion();

            String sql = "DELETE FROM plato WHERE idPlato = ?";

            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, idPlato);

            System.out.println("SQL ==> " + pstm);

            salida = pstm.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstm != null) {
                    pstm.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return salida;
    }

    // Eliminación lógica: alternar disponibilidad entre 1 y 0
    public int eliminacionLogicaPlato(int idPlato) {
        int salida = -1;
        Connection conn = null;
        PreparedStatement pstm = null;

        try {
            conn = MySqlDBConexion.getConexion();

            String sql = "UPDATE plato SET disponibilidad = "
                    + "CASE WHEN disponibilidad = '1' THEN '0' "
                    + "ELSE '1' END WHERE idPlato = ?";

            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, idPlato);

            System.out.println("SQL ==> " + pstm);

            salida = pstm.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstm != null) {
                    pstm.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return salida;
    }
}
