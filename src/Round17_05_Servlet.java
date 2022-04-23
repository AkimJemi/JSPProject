import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Round17_05_Servlet extends HttpServlet {
	public void doPost(HttpServletRequest rq, HttpServletResponse rp) throws IOException, ServletException {
		String path = this.getServletContext().getRealPath("/data");
		String file_name = this.getInitParameter("result");

		File dir = new File(path);
		if (!dir.exists())
			dir.mkdir();
		File file = new File(dir, file_name);

		int agree = 0;
		int disagree = 0;
		if (file.exists()) {
			DataInputStream f_in = new DataInputStream(new BufferedInputStream(new FileInputStream(file)));

			try {
				agree = f_in.readInt();
				disagree = f_in.readInt();
			} catch (Exception e) {
				agree = 0;
				disagree = 0;
			}
			f_in.close();
		}
		String choice = rq.getParameter("choice");
		if (choice != null && choice.equalsIgnoreCase("yes"))
			agree++;
		else if (choice != null && choice.equalsIgnoreCase("no"))
			disagree++;

		DataOutputStream f_out = new DataOutputStream(new BufferedOutputStream(new FileOutputStream(file)));
		f_out.write(agree);
		f_out.write(disagree);
		f_out.close();
		rp.setContentType("text/html;charset=utf-8");
		PrintWriter out = rp.getWriter();
		out.println("<html><head><title>결과!</title></head>");
		out.println("<body><center>");
		out.println("<h3>찬반 투표 결과!</h3>");
		out.println("<img src='Servlet_05_Sub?agree=" + agree);
		out.println("&disagree=" + disagree + "'/>");
		out.println("</center></body></html>");

	}
}
