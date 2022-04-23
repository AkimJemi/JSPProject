import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Round18_02_Servlet extends HttpServlet {
	public void doGet(HttpServletRequest rq, HttpServletResponse rp) throws ServletException, IOException {
		String id = rq.getParameter("ID");
		rp.setContentType("text/html;charset=utf-8");
		PrintWriter out = rp.getWriter();
		out.println("<html><body><center>");
		out.println(id + "님 반갑습니다");
		out.println("</center></body></html>");
	}

}
