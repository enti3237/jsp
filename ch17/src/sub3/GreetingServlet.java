package sub3;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/greeting.do")
public class GreetingServlet extends HttpServlet {
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		greeting(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		greeting(req, resp);
	}
	
	public void greeting(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Greeting Servlet</title>");
		out.println("<meta charset='UTF-8'/>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>Greeting Servlet!!</h1>");
		out.println("<a href='./hello.do'>hello.do</a>");
		out.println("<a href='./welcome.do'>welcome.do</a>");
		out.println("</body>");
		out.println("</html>");
		
		
	}

}
