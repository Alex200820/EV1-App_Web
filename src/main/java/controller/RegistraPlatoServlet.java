package controller;

import java.io.IOException;

import entity.Plato;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.PlatoModel;

@WebServlet("/registraPlatoAlias")
public class RegistraPlatoServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1 Recibir los datos del formulario del JSP
		String nombre = req.getParameter("nombre");
		String proteinaPlato = req.getParameter("proteinaPlato");
		int idCategoria = Integer.parseInt(req.getParameter("idCategoria"));
		int tiempoPreparacion = Integer.parseInt(req.getParameter("tiempoPreparacion"));
		String disponibilidad = req.getParameter("disponibilidad");
		String popularidad = req.getParameter("popularidad");
		double precio = Double.parseDouble(req.getParameter("precio"));

		System.out.println(
				"Datos recibidos: " + nombre + " - " + proteinaPlato + " - " + idCategoria + " - " + tiempoPreparacion + " - " 
						+ disponibilidad + " - " + popularidad + " - " + precio);

		// 2 Crear un objeto Libro
		Plato plato = new Plato();
		plato.setNombre(nombre);
		plato.setProteinaPlato(proteinaPlato);
		plato.setIdCategoria(idCategoria);
		plato.setTiempoPreparacion(tiempoPreparacion);
		plato.setDisponibilidad(disponibilidad);
		plato.setPopularidad(popularidad);
		plato.setPrecio(precio);

		// 3 Crear un objeto CocnursoModel
		PlatoModel model = new PlatoModel();
		int salida = model.insertaPlato(plato);

		String mensajeSalida = (salida > 0) ? "Plato registrado correctamente (OK)" : "Error al registrar el Plato";

		// 4 Enviar una respuesta al cliente en JSON al jquery
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		resp.getWriter().write("{\"mensajeSalida\":\"" + mensajeSalida + "\"}");
	}
}
