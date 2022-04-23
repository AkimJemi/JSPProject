import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Round18_01_Servlet extends HttpServlet {
	
	public void doPost(HttpServletRequest rq, HttpServletResponse rp) throws IOException, ServletException {
		String name = rq.getParameter("name");
		String tel = rq.getParameter("tel");
		String addr = rq.getParameter("addr");

		rp.setContentType("text/html;charset=utf-8");
		PrintWriter out = rp.getWriter();
		out.println("<html><head><body><center>");
		out.println("전송된 이름=");
		out.println("<input type='text' value='" + name + "'</br>");
		out.println("전송된 전화번호=");
		out.println("<input type='text' value='" + tel + "'</br>");
		out.println("전송된 주소=");
		out.println("<input type='text' value='" + addr + "'</br>");
		out.println("</center></body></head></html>");

	}

}
