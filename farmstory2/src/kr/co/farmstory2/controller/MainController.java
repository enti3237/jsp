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
		
	// init - 최초 한번 실행되는 메서드로 초기화를 담당한다
	@Override
	public void init(ServletConfig config) throws ServletException {
		
		// 프로퍼티 파일 경로 구하기
		ServletContext sc = config.getServletContext();
		String path = sc.getRealPath("/WEB-INF")+"/urlMapping.properties";
		
		Properties prop = new Properties();
		
		try {
			// 프로퍼티 파일과 스트림 연결
			FileInputStream fis = new FileInputStream(path);
			// 스트림으로 데이터 읽어서 prop 객체에 저장
			prop.load(fis);
			// 스트림 해제
			fis.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// prop 객체의 Key-Value에서 Value 값을 집합으로 만들어서 객체로 생성
		// 그 전에는 그냥 문자열 정보값일 뿐
		Iterator iter = prop.keySet().iterator();
		
		while(iter.hasNext()) {
			String k = iter.next().toString();
			String v = prop.getProperty(k);
			
			try {
				Class obj = Class.forName(v);
				
				Object instance = obj.newInstance();
				/* CommonService instance = (CommonService) obj.newInstance(); */

				// obj 데이터를 집어넣는다
				instances.put(k, instance);				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 액션주소에 해당하는 모델클래스 객체생성
		
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
		String uri  = req.getRequestURI();	// /ch18/hello.do (즉 /뒤만 남기면 key 값이 된다)
		
		String action = uri.substring(path.length());
		
		CommonService instance = (CommonService) instances.get(action);
		String result = instance.requestProc(req, resp);
		
		// 리다이렉트 - 포워드 명령 
		if(result.startsWith("redirect:")) {
			
			// result 값이 리다이렉트 명령이면 redirect: 를 빼고 그 다음 문자열부터(9번째부터)를 출력해서 주소로 삼는다
			String redirectUrl = result.substring(9);
			resp.sendRedirect(redirectUrl);
			
		} else if(result.startsWith("{")) {
			
			// result 값이 JSON 출력일 때  
			PrintWriter out = resp.getWriter();
			out.print(result);
		
		} else {
			
			// VIEW 포워드			
			RequestDispatcher dispacher = req.getRequestDispatcher(result);
			dispacher.forward(req, resp);
			
		}
		
		
	}
}
