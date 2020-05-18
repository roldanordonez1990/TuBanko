package Utils;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class SuperTipoServlet
 */
@WebServlet("/superTipoServlet")
public class SuperTipoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuperTipoServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	/**
	 * 
	 * @return
	 */
	protected String getCabeceraHTML (String titulo) {
		return "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n" + 
				"<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n" + 
				"<head>\r\n" + 
				"<style>\r\n" + 
				"		body{font-family: Arial; background-color: #18A383; box-sizing: border-box;}\r\n" + 
				"\r\n" + 
				"		form{\r\n" + 
				"			background-color: white;\r\n" + 
				"			border-radius: 3px;\r\n" + 
				"			color: #999;\r\n" + 
				"			font-size: 0.8em;\r\n" + 
				"			padding: 20px;\r\n" + 
				"			margin: 0 auto;\r\n" + 
				"			width: 300px;\r\n" + 
				"		}\r\n" + 
				"\r\n" + 
				"		input, textarea{\r\n" + 
				"			border: 0;\r\n" + 
				"			outline: none;\r\n" + 
				"\r\n" + 
				"			width: 280px;\r\n" + 
				"		}\r\n" + 
				"\r\n" + 
				"		.field{\r\n" + 
				"			border: solid 1px #ccc;\r\n" + 
				"			padding: 10px;\r\n" + 
				"\r\n" + 
				"			\r\n" + 
				"		}\r\n" + 
				"\r\n" + 
				"		.field:focus{\r\n" + 
				"			border-color: #18A383;\r\n" + 
				"		}\r\n" + 
				"\r\n" + 
				"		.center-content{\r\n" + 
				"			text-align: center;\r\n" + 
				"		}\r\n" + 
				"\r\n" + 
				".imagenIndex {\r\n" + 
				"    width: 50px;\r\n" + 
				"    height: 50px;\r\n" + 
				"    color: #00000000\r\n" + 
				"}\r\n" + 

				"	</style>\r\n" + 
				"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\" />\r\n" + 
				"<title>" + titulo + "</title>\r\n" + 
				"</head>\r\n";
	}
	
	/**
	 * 
	 * @return
	 */
	protected String getPieHTML () {
		return "</body>\r\n" + 
			   "</html>\r\n";
	}	
}
