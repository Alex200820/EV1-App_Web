package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entity.Categoria;
import util.MySqlDBConexion;

public class CategoriaModel {

	public int insertaCategoria(Categoria obj) {
		int salida = -1;
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "INSERT INTO categoria(descripcion, fechaRegistro, popularidad) VALUES (?, CURRENT_DATE, ?)";
			
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getDescripcion());
			pstm.setString(2, obj.getPopularidad());
			
			salida = pstm.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
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

	public List<Categoria> listaCategoria() {
		ArrayList<Categoria> lista = new ArrayList<Categoria>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn = util.MySqlDBConexion.getConexion();
			String sql = "SELECT * FROM categoria";
			pstm = conn.prepareStatement(sql);
			rs = pstm.executeQuery();
			while (rs.next()) {
				Categoria categoria = new Categoria();
				categoria.setIdCategoria(rs.getInt("idCategoria"));
				categoria.setDescripcion(rs.getString("descripcion"));
				categoria.setFechaCategoria(rs.getString("fechaRegistro"));
				categoria.setPopularidad(rs.getString("popularidad"));
				lista.add(categoria);
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
		return lista;
	}
}