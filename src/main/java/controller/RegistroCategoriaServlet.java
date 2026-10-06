package controller;

import java.io.IOException;

import entity.Categoria;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.CategoriaModel;

@WebServlet("/registroCategoriaAlias")
public class RegistroCategoriaServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		try {
			// 1. Recibir los datos del formulario (descripcion y popularidad)
			String descripcion = req.getParameter("descripcion");
			String popularidad = req.getParameter("popularidad"); 
			
			// 2. Crear y llenar el objeto Categoria con los nuevos atributos
			Categoria objCategoria = new Categoria();
			objCategoria.setDescripcion(descripcion);
			objCategoria.setPopularidad(popularidad);

			// 3. Insertar en la BD mediante CategoriaModel
			CategoriaModel model = new CategoriaModel();
			int salida = model.insertaCategoria(objCategoria);
			
			String mensajeSalida = (salida > 0) ? "Categoría registrada correctamente" : "Error al registrar la categoría";

			// 4. Enviar respuesta JSON al cliente
			resp.setContentType("application/json");
			resp.setCharacterEncoding("UTF-8");
			resp.getWriter().write("{\"mensajeSalida\":\"" + mensajeSalida + "\"}");

		} catch (Exception e) {
			e.printStackTrace();
			resp.setContentType("application/json");
			resp.setCharacterEncoding("UTF-8");
			resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			resp.getWriter().write("{\"mensajeSalida\":\"Error de procesamiento: " + e.getMessage() + "\"}");
		}
	}
}