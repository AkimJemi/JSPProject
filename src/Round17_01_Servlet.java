import java.io.BufferedInputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Round17_01_Servlet extends HttpServlet {
	private File image;

	public void init() {
		ServletContext context = this.getServletContext();
		String path = context.getRealPath("/images");
		image = new File(path, "testimage.jpg");
	}

	public void doGet(HttpServletRequest rq, HttpServletResponse rp) throws IOException, ServletException {

		rp.setContentType("image/jpg");
		DataInputStream in = new DataInputStream(new BufferedInputStream(new FileInputStream(image)));

		ServletOutputStream out = rp.getOutputStream();

		byte[] data = new byte[512];
		while (true) {
			int x = in.read(data, 0, data.length);
			if (x == -1)
				break;
			out.write(data, 0, x);
			out.flush();
		}
		in.close();
		out.close();
	}

}
