package jdbc;

import java.io.IOException;
import java.io.StringReader;
import java.util.Properties;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.sun.org.apache.xalan.internal.xsltc.dom.LoadDocument;

public class DBCPInitListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		String poolConfig = sce.getServletContext().getInitParameter("poolConfig");
		Properties prop = new Properties();
		
		try {
			prop.load(new StringReader(poolConfig));
		} catch (IOException e) {
			throw new RuntimeException("config load fail", e);
		}
		
		
		
		
	}
	
	
	

}
