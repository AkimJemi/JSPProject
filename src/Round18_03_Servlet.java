import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Round18_03_Servlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ServletContext context = this.getServletContext();
		String co_name = context.getInitParameter("co_name");
		String co_tel = context.getInitParameter("co_tel");
		String admin_email = context.getInitParameter("admin_email");

		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.println("<html><head></head><body><center>");
		out.println("화사상호 : ");
		out.println("<input type='text' value='" + co_name + "'/><br/>");
		out.println("화사번호 : ");
		out.println("<input type='text' value='" + co_tel + "'/><br/>");
		out.println("화사메일 : ");
		out.println("<input type='text' value='" + admin_email + "'/><br/>");
		out.println("</center></body></html>");

	}

}
