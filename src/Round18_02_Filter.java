import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;

public class Round18_02_Filter implements Filter {

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		String id = arg0.getParameter("ID");
		if (id == null || id.trim().length() == 0) {
			HttpServletResponse h_r = (HttpServletResponse) arg1;
			h_r.sendRedirect("Round18_02_Servlet_Error.html");
		}
		arg2.doFilter(arg0, arg1);
	}

}
