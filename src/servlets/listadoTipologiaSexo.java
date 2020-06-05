package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import model.Tipologiasexo;
import model.controladores.TipologiaSexoControlador;

/**
 * Servlet implementation class listadoTipologiaSexo
 */
@WebServlet("/listadoTipologiaSexo")
public class listadoTipologiaSexo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public listadoTipologiaSexo() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("application/json;charset=UTF-8");		

		List<Tipologiasexo> elements = TipologiaSexoControlador.getControlador().findAllTipologiasSexo();

		
		ObjectMapper mapper = new ObjectMapper();
		out.println(mapper.writeValueAsString(elements));
		
		out.close();

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
