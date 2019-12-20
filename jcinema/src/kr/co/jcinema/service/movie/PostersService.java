package kr.co.jcinema.service.movie;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.jcinema.controller.CommonService;
import kr.co.jcinema.dao.MovieDAO;
import kr.co.jcinema.vo.MovieVo;

public class PostersService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		MovieDAO dao = MovieDAO.getInstance();
		List<MovieVo> posters = dao.selectPosters();
		
		String json = new Gson().toJson(posters);
		return json;
				
		/*
		 * JSONObject json = new JSONObject();
		 * 
		 * for(int i = 0 ; i < posters.size() ; i++) { 
		 * 		String name = "poster" + (i+1);
		 * 		MovieVo mv = posters.get(i); 
		 * 		json.put(name, mv.getMovie_poster());}
		 * return json.toString();
		 */
		
	}

}
