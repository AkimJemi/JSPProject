import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;

public class Round17_03_Servlet extends HttpServlet {
   public void doPost(HttpServletRequest request, HttpServletResponse
                                    response) throws IOException, ServletException{
      File dir = new File(this.getServletContext().getRealPath("/upload"));
      if(!dir.exists()) dir.mkdir();
      String filename = "";
      
      if(ServletFileUpload.isMultipartContent(request)) {
         try {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setSizeThreshold(10 * 1024);
            factory.setRepository(dir);
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setSizeMax(10 * 1024 * 1024);
            upload.setHeaderEncoding("utf-8");
            ArrayList items = (ArrayList)upload.parseRequest(request);
            FileItem item = (FileItem)items.get(0);
            if(!item.isFormField() && item.getFieldName().equals("attach_file")) {
               filename = item.getName();
               if(filename != null && filename.trim().length()!=0) {
                  filename = filename.substring(filename.lastIndexOf("\\")+1);
                  File file = new File(dir, filename);
                  item.write(file);
               }
            }
         }catch(Exception e) {
            e.printStackTrace();
         }
      }
      
      String exten = filename.substring(filename.lastIndexOf("."));
      String mime = "";
      if(exten.equalsIgnoreCase(".doc"))
         mime = "application/msword";
      else if(exten.equalsIgnoreCase(".xls"))
         mime = "application/vnd.ms-excel";
      else if(exten.equalsIgnoreCase(".ppt"))
         mime = "application/vnd.ms-powerpoint";
      else
         mime = "application/octet-stream";
      
      response.setContentType(mime);
      
      ServletOutputStream out = response.getOutputStream();
      
      DataInputStream in = new DataInputStream(new BufferedInputStream(new FileInputStream(new File(dir, filename))));
      
      byte[] data = new byte[1024];
      
      while(true) {
         int len = in.read(data, 0 , data.length);
         if(len == -1) break;
         out.write(data, 0 , len);
         out.flush();
      }
      
      in.close();
      out.close();
   }
}