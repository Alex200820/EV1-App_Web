
package controller;

import java.io.IOException;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import entity.Plato;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import model.PlatoModel;

@WebServlet("/crudPlatoAlias")
public class CrudPlatoServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    public void service(ServletRequest req, ServletResponse res)
            throws ServletException, IOException {

        String metodo = req.getParameter("metodo");

        res.setContentType("application/json");
        res.setCharacterEncoding("UTF-8");

        if (metodo == null) {
            res.getWriter().write(
                "{\"mensajeSalida\":\"Método no encontrado\"}"
            );
            return;
        }

        switch (metodo) {
            case "listaPorNombre":
                listaPorNombre(req, res);
                break;

            case "registra":
                registra(req, res);
                break;

            case "actualiza":
                actualiza(req, res);
                break;

            case "eliminacionFisica":
                eliminacionFisica(req, res);
                break;

            case "eliminacionLogica":
                eliminacionLogica(req, res);
                break;

            default:
                res.getWriter().write(
                    "{\"mensajeSalida\":\"Método no encontrado\"}"
                );
                break;
        }
    }

    // Listar platos por nombre
    public void listaPorNombre(ServletRequest req, ServletResponse res)
            throws ServletException, IOException {

        String nombre = req.getParameter("nombre");

        PlatoModel model = new PlatoModel();

        List<Plato> lista = model.listaPlatoPorNombre(
            nombre == null ? "" : nombre
        );

        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String jsonSalida = gson.toJson(lista);

        System.out.println("Respuesta JSON: " + jsonSalida);

        res.getWriter().write(jsonSalida);
    }

    // Registrar plato
    public void registra(ServletRequest req, ServletResponse res)
            throws ServletException, IOException {

        String nombre = req.getParameter("nombre");
        String proteinaPlato = req.getParameter("proteinaPlato");
        String idCategoria = req.getParameter("idCategoria");
        String tiempoPreparacion = req.getParameter("tiempoPreparacion");
        String disponibilidad = req.getParameter("disponibilidad");
        String popularidad = req.getParameter("popularidad");
        String precio = req.getParameter("precio");

        Plato objPlato = new Plato();

        objPlato.setNombre(nombre);
        objPlato.setProteinaPlato(proteinaPlato);
        objPlato.setIdCategoria(Integer.parseInt(idCategoria));
        objPlato.setTiempoPreparacion(Integer.parseInt(tiempoPreparacion));
        objPlato.setDisponibilidad(disponibilidad);
        objPlato.setPopularidad(popularidad);
        objPlato.setPrecio(Double.parseDouble(precio));

        PlatoModel model = new PlatoModel();
        int salida = model.insertaPlato(objPlato);

        System.out.println("Resultado del registro: " + salida);

        List<Plato> lista = model.listaPlatoPorNombre("");

        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String jsonSalida = gson.toJson(lista);

        System.out.println("Respuesta JSON: " + jsonSalida);

        res.getWriter().write(jsonSalida);
    }

    // Actualizar plato
    public void actualiza(ServletRequest req, ServletResponse res)
            throws ServletException, IOException {

        String idPlato = req.getParameter("idPlato");
        String nombre = req.getParameter("nombre");
        String proteinaPlato = req.getParameter("proteinaPlato");
        String categoria = req.getParameter("idCategoria");
        String tiempoPreparacion = req.getParameter("tiempoPreparacion");
        String disponibilidad = req.getParameter("disponibilidad");
        String popularidad = req.getParameter("popularidad");
        String precio = req.getParameter("precio");

        Plato objPlato = new Plato();

        objPlato.setIdPlato(Integer.parseInt(idPlato));
        objPlato.setNombre(nombre);
        objPlato.setProteinaPlato(proteinaPlato);
        objPlato.setIdCategoria(Integer.parseInt(categoria));
        objPlato.setTiempoPreparacion(
            Integer.parseInt(tiempoPreparacion)
        );
        objPlato.setDisponibilidad(disponibilidad);
        objPlato.setPopularidad(popularidad);
        objPlato.setPrecio(Double.parseDouble(precio));

        PlatoModel model = new PlatoModel();
        int salida = model.actualizaPlato(objPlato);

        System.out.println("Resultado de la actualización: " + salida);

        List<Plato> lista = model.listaPlatoPorNombre("");

        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String jsonSalida = gson.toJson(lista);

        System.out.println("Respuesta JSON: " + jsonSalida);

        res.getWriter().write(jsonSalida);
    }

    // Eliminación física: borrar definitivamente el plato
    public void eliminacionFisica(ServletRequest req, ServletResponse res)
            throws ServletException, IOException {

        String idPlato = req.getParameter("idPlato");

        PlatoModel model = new PlatoModel();
        int salida = model.eliminarPlato(Integer.parseInt(idPlato));

        System.out.println("Resultado de la eliminación física: " + salida);

        List<Plato> lista = model.listaPlatoPorNombre("");

        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String jsonSalida = gson.toJson(lista);

        System.out.println("Respuesta JSON: " + jsonSalida);

        res.getWriter().write(jsonSalida);
    }

    // Eliminación lógica: alternar disponibilidad entre 1 y 0
    public void eliminacionLogica(ServletRequest req, ServletResponse res)
            throws ServletException, IOException {

        String idPlato = req.getParameter("idPlato");

        PlatoModel model = new PlatoModel();

        int salida = model.eliminacionLogicaPlato(
            Integer.parseInt(idPlato)
        );

        System.out.println("Filas actualizadas: " + salida);

        List<Plato> lista = model.listaPlatoPorNombre("");

        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String jsonSalida = gson.toJson(lista);

        System.out.println("Respuesta JSON: " + jsonSalida);

        res.setContentType("application/json");
        res.setCharacterEncoding("UTF-8");

        res.getWriter().write(jsonSalida);
    }
}
