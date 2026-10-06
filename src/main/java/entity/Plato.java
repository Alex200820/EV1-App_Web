package entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Plato {
	private int idPlato;
	private String nombre;
	private String proteinaPlato;
	private int idCategoria;
	private int tiempoPreparacion;
	private String disponibilidad;
	private String popularidad;
	private Double precio; 
}
