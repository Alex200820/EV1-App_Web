package model;

import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entity.Plato;
import util.MySqlDBConexion;

public class PlatoModel {

	public int insertaPlato(Plato obj) {
		int salida = -1;
		Connection cn = null;
		PreparedStatement ps = null;
		try {
			//1 Crear la conexion a la BD
			cn = MySqlDBConexion.getConexion();
			
			//2 Crear el SQL de insercion
			String sql = "INSERT INTO plato (nombre, proteinaPlato, idCategoria, tiempoPreparacion, disponibilidad, popularidad, precio) VALUES (?,?,?,?,?,?,?)";
			
			//3 Crear el PreparedStatement
			ps = cn.prepareStatement(sql);
			ps.setString(1, obj.getNombre());
			ps.setString(2, obj.getProteinaPlato());
			ps.setInt(3, obj.getIdCategoria());
			ps.setInt(4, obj.getTiempoPreparacion());
			ps.setString(5, obj.getDisponibilidad());
			ps.setString(6, obj.getPopularidad());
			ps.setDouble(7, obj.getPrecio());
			
			
			System.out.println("SQL: " + ps);
			
			//4 Ejecutar el SQL	
			salida = ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (cn != null)
					cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}	

		return salida;
	}
	
	public List<Plato> listaPlatoPorNombre (String nombre){
		ArrayList<Plato> salida = new ArrayList<Plato>();
		
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			//1 se crea conexion
			conn = MySqlDBConexion.getConexion();
			
			//2 se prepara la sentencia SQL
			String sql = "SELECT * FROM plato WHERE nombre LIKE ?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, "%" + nombre + "%");
			
			//3 se ejecuta la consulta
			rs = pstm.executeQuery();

			while (rs.next()) {
				Plato obj = new Plato();
				obj.setIdPlato(rs.getInt("idPlato"));
				obj.setNombre(rs.getString("nombre"));
				obj.setProteinaPlato(rs.getString("proteinaPlato"));
				obj.setIdCategoria(rs.getInt("idCategoria"));
				obj.setTiempoPreparacion(rs.getInt("tiempoPreparacion"));
				obj.setDisponibilidad(rs.getString("disponibilidad"));
				obj.setPopularidad(rs.getString("popularidad"));
				obj.setPrecio(rs.getDouble("precio"));

				salida.add(obj);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstm != null)
					pstm.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return salida;
	}
}