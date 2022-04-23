import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class Round18_01_Filter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest h_r = (HttpServletRequest) request;
		String method = h_r.getMethod();
		System.out.println("filter");
		if (method.equalsIgnoreCase("POST")) {
			request.setCharacterEncoding("utf-8");

		}
		chain.doFilter(request, response);

	}

}
