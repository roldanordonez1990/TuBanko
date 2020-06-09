package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import Utils.SuperTipoServlet;
import model.Tipologiasexo;
import model.controladores.TipologiaSexoControlador;

/**
 * Servlet implementation class ListadoTipologiaSexo
 */
@WebServlet("/ListadoTipologiaSexo")
public class ListadoTipologiaSexo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListadoTipologiaSexo() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Tipologiasexo> tipos = TipologiaSexoControlador.getControlador().findAllTipologiasSexo();
		HashMap<String, Object> dto = new HashMap<String, Object>(); // "dto" significa Data Transfer Object
		ObjectMapper mapper = new ObjectMapper();
		
		List<HashMap<String, Object>> tipologias = new ArrayList<HashMap<String, Object>>();
		
		for (int i = 0; i < tipos.size(); i++) {
			HashMap<String, Object> hm = new HashMap<String, Object>();
			hm.put("id", tipos.get(i).getId());
			hm.put("descripcion", tipos.get(i).getDescripcion());
			
			//Añadimos a la lista el hashmap con los datos
			tipologias.add(hm);
		}
		
		dto.put("idTipologia", tipologias);
		// Relleno el dto para construir el json de respuesta al servlet
		response.setContentType("application/json;charset=UTF-8");		
		// Creo el JSON de salida y lo devuelvo al cliente
		response.getWriter().println(mapper.writeValueAsString(dto));
	}
	
	/**
	 * 
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
