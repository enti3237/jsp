package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommonService;

public class LoginService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {

		// ��û�� post�� ���(submit�� ������ ��Ȳ) - get �� ���(�� �� ����-�� ����??)
		if(req.getMethod().equals("POST")) {
			
			// UTF ��ȯ�� ���� ������ �ѱ��� ���� ���Ѵ� - setCharacterEncoding("UTF-8")�� ���͸��ϱ�
			
			String uid = req.getParameter("uid");
			String pass = req.getParameter("pass");

			req.setAttribute("uid", uid);
			req.setAttribute("pass", pass);
			
			return "/loginResult.jsp";
			
		} else {
			return "/login.jsp";		
		}
		
	}

}
