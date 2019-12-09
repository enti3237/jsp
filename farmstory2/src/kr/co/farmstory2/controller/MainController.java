package kr.co.farmstory2.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private Map<String, Object> instances = new HashMap<String, Object>();
		
	// init - ���� �ѹ� ����Ǵ� �޼���� �ʱ�ȭ�� ����Ѵ�
	@Override
	public void init(ServletConfig config) throws ServletException {
		
		// ������Ƽ ���� ��� ���ϱ�
		ServletContext sc = config.getServletContext();
		String path = sc.getRealPath("/WEB-INF")+"/urlMapping.properties";
		
		Properties prop = new Properties();
		
		try {
			// ������Ƽ ���ϰ� ��Ʈ�� ����
			FileInputStream fis = new FileInputStream(path);
			// ��Ʈ������ ������ �о prop ��ü�� ����
			prop.load(fis);
			// ��Ʈ�� ����
			fis.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// prop ��ü�� Key-Value���� Value ���� �������� ���� ��ü�� ����
		// �� ������ �׳� ���ڿ� �������� ��
		Iterator iter = prop.keySet().iterator();
		
		while(iter.hasNext()) {
			String k = iter.next().toString();
			String v = prop.getProperty(k);
			
			try {
				Class obj = Class.forName(v);
				
				Object instance = obj.newInstance();
				/* CommonService instance = (CommonService) obj.newInstance(); */

				// obj �����͸� ����ִ´�
				instances.put(k, instance);				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// �׼��ּҿ� �ش��ϴ� ��Ŭ���� ��ü����
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			requestProc(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			requestProc(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		String path = req.getContextPath();	// /ch18
		String uri  = req.getRequestURI();	// /ch18/hello.do (�� /�ڸ� ����� key ���� �ȴ�)
		
		String action = uri.substring(path.length());
		
		CommonService instance = (CommonService) instances.get(action);
		String result = instance.requestProc(req, resp);
		
		// �����̷�Ʈ - ������ ��� 
		if(result.startsWith("redirect:")) {
			
			// result ���� �����̷�Ʈ ����̸� redirect: �� ���� �� ���� ���ڿ�����(9��°����)�� ����ؼ� �ּҷ� ��´�
			String redirectUrl = result.substring(9);
			resp.sendRedirect(redirectUrl);
			
		} else if(result.startsWith("{")) {
			
			// result ���� JSON ����� ��  
			PrintWriter out = resp.getWriter();
			out.print(result);
		
		} else {
			
			// VIEW ������			
			RequestDispatcher dispacher = req.getRequestDispatcher(result);
			dispacher.forward(req, resp);
			
		}
		
		
	}
}
