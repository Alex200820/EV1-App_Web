package controller;

import java.io.IOException;
import java.util.List;

import entity.Categoria;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.CategoriaModel;

@WebServlet("/cargaPlatoAlias")
public class CargaComboPlato extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1. Consultar la lista de categorías registradas en BD
		CategoriaModel categoriaModel = new CategoriaModel();
		List<Categoria> lista = categoriaModel.listaCategoria();

		// 2. Enviar la lista con el nombre 'listaCategorias' usado en el JSP
		req.setAttribute("listaCategorias", lista);

		// 3. Abrir el JSP de registro
		req.getRequestDispatcher("/registraPlato.jsp").forward(req, resp);
	}
}