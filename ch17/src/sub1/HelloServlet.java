package sub1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {
	
//	按眉啊 积己凳
	public HelloServlet() {
		System.out.println("HelloServlet 按眉积己!");
	}

	@Override
	public void init() throws ServletException {
		System.out.println("init 角青!");
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestProc(req, resp);		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestProc(req, resp);
	}
	
	public void requestProc(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Hello Servlet</title>");
		out.println("<meta charset='UTF-8'/>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>Hello Servlet!!</h1>");
		out.println("<a href='./welcome.do'>welcome.do</a>");
		out.println("<a href='./greeting.do'>greeting.do</a>");
		out.println("</body>");
		out.println("</html>");
	}
}
