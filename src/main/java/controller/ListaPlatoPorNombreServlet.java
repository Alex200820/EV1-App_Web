package controller;

import java.io.IOException;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import entity.Plato;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.PlatoModel;

@WebServlet("/listaPlatoPorNombre")
public class ListaPlatoPorNombreServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//1 Recibir el parametro del nombre
		String nombre = req.getParameter("nombre");
		
		//2 Crear un objeto PlatoModel
		PlatoModel model = new PlatoModel();
		List<Plato> lista = model.listaPlatoPorNombre(nombre);
		
		//3 Enviar la lista de platos al cliente en JSON
		resp.setContentType("application/json");
		
		//4 Construir el JSON mmediante Gson modo pretty print
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsonSalida = gson.toJson(lista);
		
		System.out.println("Respuesta JSON: " + jsonSalida);
		
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		resp.getWriter().write(jsonSalida);
		
		
	}

	
}
