package sub2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WelcomeServlet extends HttpServlet{

	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		welcome(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		welcome(req, resp);
	}
	
	public void welcome(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Hello Servlet</title>");
		out.println("<meta charset='UTF-8'/>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>Welcome Servlet!!</h1>");
		out.println("<a href='./hello.do'>hello.do</a>");
		out.println("<a href='./greeting.do'>greeting.do</a>");
		out.println("</body>");
		out.println("</html>");
		
	}
}
