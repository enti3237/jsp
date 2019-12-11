package kr.co.farmstory2.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory2.controller.CommonService;
import kr.co.farmstory2.dao.BoardDAO;
import kr.co.farmstory2.vo.BoardVO;

public class IndexService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		BoardDAO dao = BoardDAO.getInstance();
		
		List<BoardVO> latests1 = dao.selectLatest("grow");
		List<BoardVO> latests2 = dao.selectLatest("school");
		List<BoardVO> latests3 = dao.selectLatest("story");

		// latests1, latests2, latests3 view에서 출력하기 위한 데이터 저장
		req.setAttribute("latests1", latests1);
		req.setAttribute("latests2", latests2);
		req.setAttribute("latests3", latests3);
		
		return "/index.jsp";	
	}

}
