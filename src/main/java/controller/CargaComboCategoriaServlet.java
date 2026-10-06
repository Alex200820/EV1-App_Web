package controller;

import java.io.IOException;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import entity.Categoria;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.CategoriaModel;

@WebServlet("/cargaComboCategoria")
public class CargaComboCategoriaServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 1. Obtener la lista de categorías con su popularidad (Alta, Media, Baja) desde la BD
		CategoriaModel model = new CategoriaModel();
		List<Categoria> lista = model.listaCategoria();	
		
		// 2. Serializar la lista a formato JSON formateado (Pretty Print)
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsonSalida = gson.toJson(lista);
		System.out.println("Respuesta JSON: " + jsonSalida);
		
		// 3. Enviar la respuesta JSON al cliente
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		resp.getWriter().write(jsonSalida);
		
	}
	
}